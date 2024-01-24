{
  inputs = {
    hyprland.url = "github:hyprwm/hyprland/5b8cfdf2efc44106b61e60c642fd964823fd89f3";
    nixpkgs.url = "github:NixOS/nixpkgs/970a59bd19eff3752ce552935687100c46e820a5";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, hyprland, ... }: let
    inherit (hyprland.inputs) nixpkgs;
    hyprlandSystems = fn: nixpkgs.lib.genAttrs (builtins.attrNames hyprland.packages) (system: fn system nixpkgs.legacyPackages.${system});
  in {
    packages = hyprlandSystems (system: pkgs: let
      hyprlandPackage = hyprland.packages.${system}.hyprland;
    in rec {
      gaps = hyprlandPackage.stdenv.mkDerivation {
        pname = "gaps";
        version = "0.1";
        src = ./.;

        nativeBuildInputs = with pkgs; [ cmake pkg-config ];

        buildInputs = with pkgs; [
          hyprlandPackage.dev
          pango
          cairo
        ] ++ hyprlandPackage.buildInputs;

        # no noticeable impact on performance and greatly assists debugging
        cmakeBuildType = "Debug";
        dontStrip = true;

        meta = with pkgs.lib; {
          license = licenses.gpl3;
          platforms = platforms.linux;
        };
      };

      default = gaps;
    });

    devShells = hyprlandSystems (system: pkgs: {
      default = pkgs.mkShell.override {
        stdenv = pkgs.gcc13Stdenv;
      } {
        name = "gaps";

        nativeBuildInputs = with pkgs; [
          clang-tools_16
          bear
        ];

        inputsFrom = [ self.packages.${system}.gaps ];
      };
    });
  };
}

# Gaps Plugin Created by FlafyDev (https://github.com/FlafyDev)

### Overview

Hyprland plugin to change gaps_out depending on how many windows there are.

```
plugin {
  gaps {
    gaps_out_multi = 10
    gaps_out_single = 100
  }
}
```

### Compiling

Run both of the:

```
compile_commands_bear.sh
complie_commands_cmake.sh
```

Go into the newly created build directory and run the `Makefile`

```
cd build
make
```

Now there should be a `libgaps.so`. This is what actually will run the plugin. In order to actually load the plugin, use hyprctl.

```
hyprctl plugin load [full path to libgaps.so]
```

### Credits

The creator: FlafyDev (https://github.com/FlafyDev)
Code structure and build system taken from [hy3](https://github.com/outfoxxed/hy3)

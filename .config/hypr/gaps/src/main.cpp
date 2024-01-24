#include <optional>

#include <hyprland/src/Compositor.hpp>
#include <hyprland/src/plugins/PluginAPI.hpp>

#include "globals.hpp"
#include "Hooks.hpp"

APICALL EXPORT std::string PLUGIN_API_VERSION() { return HYPRLAND_API_VERSION; }

APICALL EXPORT PLUGIN_DESCRIPTION_INFO PLUGIN_INIT(HANDLE handle) {
	PHANDLE = handle;

	hooks::init();

#define CONF(NAME, TYPE, VALUE)                                                                    \
	HyprlandAPI::addConfigValue(PHANDLE, "plugin:gaps:" NAME, SConfigValue {.TYPE##Value = VALUE})

	// general
	CONF("gaps_out_single", int, 20);
	CONF("gaps_out_multi", int, 4);
#undef CONF

	hooks::enable();

	return {"gaps", "different out gaps for single and multiple windows", "flafy", "0.1"};
}

APICALL EXPORT void PLUGIN_EXIT() {
	hooks::disable();
}

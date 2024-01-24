#pragma once

#include "log.hpp"

#include <hyprland/src/plugins/PluginAPI.hpp>

inline HANDLE PHANDLE = nullptr;

inline void errorNotif() {
	HyprlandAPI::addNotificationV2(
	    PHANDLE,
	    {
	        {"text", "Something has gone very wrong. Check the log for details."},
	        {"time", (uint64_t) 10000},
	        {"color", CColor(1.0, 0.0, 0.0, 1.0)},
	        {"icon", ICON_ERROR},
	    }
	);
}

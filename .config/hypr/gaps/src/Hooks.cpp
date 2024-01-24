#include <hyprland/src/Compositor.hpp>
#include <hyprland/src/plugins/PluginAPI.hpp>

#include "globals.hpp"

namespace hooks {
inline CFunctionHook* g_getWorkspaceRuleHook = nullptr;
inline CFunctionHook* g_destroySurfaceTreeHook = nullptr;

SWorkspaceRule hook_getWorkspaceRuleFor(void* thisptr, CWorkspace* workspace) {
	int counter = 0;

	for (auto& w : g_pCompositor->m_vWindows) {
		if (w->m_iWorkspaceID == workspace->m_iID && !w->isHidden() && g_pCompositor->windowValidMapped(w.get()) && w->m_bIsMapped) {
			counter++;
		}
	}
	auto rule = ((SWorkspaceRule (*)(void*, CWorkspace*)) g_getWorkspaceRuleHook->m_pOriginal)(thisptr, workspace);

	rule.gapsOut = counter > 1 ? HyprlandAPI::getConfigValue(PHANDLE, "plugin:gaps:gaps_out_multi")->intValue : HyprlandAPI::getConfigValue(PHANDLE, "plugin:gaps:gaps_out_single")->intValue;

	return rule;
}

void hook_windowRemoved(void* thisptr, CWindow* pWindow) {
	((void (*)(void*, CWindow*)) g_destroySurfaceTreeHook->m_pOriginal)(thisptr, pWindow);
	for (auto& m : g_pCompositor->m_vMonitors)
			g_pLayoutManager->getCurrentLayout()->recalculateMonitor(m->ID);
}

void init() {

	static const auto wsRuleCandidates
	    = HyprlandAPI::findFunctionsByName(PHANDLE, "getWorkspaceRuleFor");

	if (wsRuleCandidates.size() != 1) {
		g_getWorkspaceRuleHook = nullptr;

		hy3_log(
		    ERR,
		    "expected one matching function to hook for"
		    "\"getWorkspaceRuleFor\", found {}",
		    wsRuleCandidates.size()
		);

		HyprlandAPI::addNotificationV2(
		    PHANDLE,
		    {
		        {"text",
		         "Failed to load function hooks: "
		         "\"getWorkspaceRuleFor\""},
		        {"time", (uint64_t) 10000},
		        {"color", CColor(1.0, 0.0, 0.0, 1.0)},
		        {"icon", ICON_ERROR},
		    }
		);
		return;
	}

	g_getWorkspaceRuleHook = HyprlandAPI::createFunctionHook(
	    PHANDLE,
	    wsRuleCandidates[0].address,
	    (void*) &hook_getWorkspaceRuleFor
	);

	static const auto destroySurfaceCandidates
	    = HyprlandAPI::findFunctionsByName(PHANDLE, "destroySurfaceTree");

	if (destroySurfaceCandidates.size() != 1) {
		g_destroySurfaceTreeHook = nullptr;

		hy3_log(
		    ERR,
		    "expected one matching function to hook for"
		    "\"destroySurfaceTree\", found {}",
		    destroySurfaceCandidates.size()
		);

		HyprlandAPI::addNotificationV2(
		    PHANDLE,
		    {
		        {"text",
		         "Failed to load function hooks: "
		         "\"destroySurfaceTree\""},
		        {"time", (uint64_t) 10000},
		        {"color", CColor(1.0, 0.0, 0.0, 1.0)},
		        {"icon", ICON_ERROR},
		    }
		);
		return;
	}

	g_destroySurfaceTreeHook = HyprlandAPI::createFunctionHook(
	    PHANDLE,
	    destroySurfaceCandidates[0].address,
	    (void*) &hook_windowRemoved
	);

}

void enable() {
	if (g_destroySurfaceTreeHook != nullptr) {
		g_destroySurfaceTreeHook->hook();
	}
	if (g_getWorkspaceRuleHook != nullptr) {
		g_getWorkspaceRuleHook->hook();
	}
}

void disable() {
	if (g_destroySurfaceTreeHook != nullptr) {
		g_destroySurfaceTreeHook->unhook();
	}
	if (g_getWorkspaceRuleHook != nullptr) {
		g_getWorkspaceRuleHook->unhook();
	}
}
} // namespace hooks

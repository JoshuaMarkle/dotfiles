#pragma once

#define WLR_USE_UNSTABLE

#include <hyprland/src/render/decorations/IHyprWindowDecoration.hpp>
#include <hyprland/src/render/OpenGL.hpp>
#include "globals.hpp"

class CHyprBar : public IHyprWindowDecoration {
  public:
    CHyprBar(CWindow*);
    virtual ~CHyprBar();

    virtual SDecorationPositioningInfo getPositioningInfo();

    virtual void                       onPositioningReply(const SDecorationPositioningReply& reply);

    virtual void                       draw(CMonitor*, float a, const Vector2D& offset);

    virtual eDecorationType            getDecorationType();

    virtual void                       updateWindow(CWindow*);

    virtual void                       damageEntire();

    virtual eDecorationLayer           getDecorationLayer();

    virtual uint64_t                   getDecorationFlags();

    bool                               m_bButtonsDirty = true;

    virtual std::string                getDisplayName();

  private:
    SWindowDecorationExtents m_seExtents;

    CWindow*                 m_pWindow = nullptr;

    CBox                     m_bAssignedBox;

    CTexture                 m_tTextTex;
    CTexture                 m_tButtonsTex;

    bool                     m_bWindowSizeChanged = false;

    Vector2D                 cursorRelativeToBar();

    void                     renderBarTitle(const Vector2D& bufferSize, const float scale);
    void                     renderText(CTexture& out, const std::string& text, const CColor& color, const Vector2D& bufferSize, const float scale, const int fontSize);
    void                     renderBarButtons(const Vector2D& bufferSize, const float scale);
    void                     renderBarButtonsText(CBox* barBox, const float scale, const float a);
    void                     onMouseDown(SCallbackInfo& info, wlr_pointer_button_event* e);
    void                     onMouseMove(Vector2D coords);
    CBox                     assignedBoxGlobal();

    HOOK_CALLBACK_FN*        m_pMouseButtonCallback;
    HOOK_CALLBACK_FN*        m_pMouseMoveCallback;

    std::string              m_szLastTitle;

    bool                     m_bDraggingThis  = false;
    bool                     m_bDragPending   = false;
    bool                     m_bCancelledDown = false;

    // for dynamic updates
    int m_iLastHeight = 0;
};

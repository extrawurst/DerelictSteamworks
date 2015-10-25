module derelict.steamworks.interfaces.steamscreenshots;

import derelict.steamworks.enums;
import derelict.steamworks.types;

static immutable uint32 k_nScreenshotMaxTaggedUsers = 32;
static immutable uint32 k_nScreenshotMaxTaggedPublishedFiles = 32;
static immutable int k_cubUFSTagTypeMax = 255;
static immutable int k_cubUFSTagValueMax = 255;

// Required with of a thumbnail provided to AddScreenshotToLibrary.  If you do not provide a thumbnail
// one will be generated.
static immutable int k_ScreenshotThumbWidth = 200;

// Handle is valid for the lifetime of your process and no longer
alias ScreenshotHandle = uint32;
static immutable INVALID_SCREENSHOT_HANDLE = 0;

static immutable const(char)* STEAMSCREENSHOTS_INTERFACE_VERSION = "STEAMSCREENSHOTS_INTERFACE_VERSION002";

mixin SteamAlignment;

struct ScreenshotReady_t
{
    enum { k_iCallback = k_iSteamScreenshotsCallbacks + 1 };
    ScreenshotHandle m_hLocal;
    EResult m_eResult;
}

struct ScreenshotRequested_t
{
    enum { k_iCallback = k_iSteamScreenshotsCallbacks + 2 };
}

module derelict.steamworks.steamscreenshots;

enum EVRScreenshotType
{
	k_EVRScreenshotType_None			= 0,
	k_EVRScreenshotType_Mono			= 1,
	k_EVRScreenshotType_Stereo			= 2,
	k_EVRScreenshotType_MonoCubemap		= 3,
	k_EVRScreenshotType_MonoPanorama	= 4,
	k_EVRScreenshotType_StereoPanorama	= 5
}

static immutable const(char)* STEAMSCREENSHOTS_INTERFACE_VERSION = "STEAMSCREENSHOTS_INTERFACE_VERSION003";
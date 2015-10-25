module derelict.steamworks.interfaces.steamclientpublic;

enum EAppOwnershipFlags
{
    k_EAppOwnershipFlags_None               = 0x0000,   // unknown
    k_EAppOwnershipFlags_OwnsLicense        = 0x0001,   // owns license for this game
    k_EAppOwnershipFlags_FreeLicense        = 0x0002,   // not paid for game
    k_EAppOwnershipFlags_RegionRestricted   = 0x0004,   // owns app, but not allowed to play in current region
    k_EAppOwnershipFlags_LowViolence        = 0x0008,   // only low violence version
    k_EAppOwnershipFlags_InvalidPlatform    = 0x0010,   // app not supported on current platform
    k_EAppOwnershipFlags_SharedLicense      = 0x0020,   // license was granted by authorized local device
    k_EAppOwnershipFlags_FreeWeekend        = 0x0040,   // owned by a free weekend licenses
    k_EAppOwnershipFlags_RetailLicense      = 0x0080,   // has a retail license for game, (CD-Key etc)
    k_EAppOwnershipFlags_LicenseLocked      = 0x0100,   // shared license is locked (in use) by other user
    k_EAppOwnershipFlags_LicensePending     = 0x0200,   // owns app, but transaction is still pending. Can't install or play
    k_EAppOwnershipFlags_LicenseExpired     = 0x0400,   // doesn't own app anymore since license expired
    k_EAppOwnershipFlags_LicensePermanent   = 0x0800,   // permanent license, not borrowed, or guest or freeweekend etc
    k_EAppOwnershipFlags_LicenseRecurring   = 0x1000,   // Recurring license, user is charged periodically
    k_EAppOwnershipFlags_LicenseCanceled    = 0x2000,   // Mark as canceled, but might be still active if recurring
    k_EAppOwnershipFlags_AutoGrant          = 0x4000,   // Ownership is based on any kind of autogrant license
    k_EAppOwnershipFlags_PendingGift        = 0x8000,   // user has pending gift to redeem
}

enum EAuthSessionResponse
{
    k_EAuthSessionResponseOK = 0,                           // Steam has verified the user is online, the ticket is valid and ticket has not been reused.
    k_EAuthSessionResponseUserNotConnectedToSteam = 1,      // The user in question is not connected to steam
    k_EAuthSessionResponseNoLicenseOrExpired = 2,           // The license has expired.
    k_EAuthSessionResponseVACBanned = 3,                    // The user is VAC banned for this game.
    k_EAuthSessionResponseLoggedInElseWhere = 4,            // The user account has logged in elsewhere and the session containing the game instance has been disconnected.
    k_EAuthSessionResponseVACCheckTimedOut = 5,             // VAC has been unable to perform anti-cheat checks on this user
    k_EAuthSessionResponseAuthTicketCanceled = 6,           // The ticket has been canceled by the issuer
    k_EAuthSessionResponseAuthTicketInvalidAlreadyUsed = 7, // This ticket has already been used, it is not valid.
    k_EAuthSessionResponseAuthTicketInvalid = 8,            // This ticket is not from a user instance currently connected to steam.
    k_EAuthSessionResponsePublisherIssuedBan = 9,           // The user is banned for this game. The ban came via the web api and not VAC
}

enum EBroadcastUploadResult
{
    k_EBroadcastUploadResultNone = 0,   // broadcast state unknown
    k_EBroadcastUploadResultOK = 1,     // broadcast was good, no problems
    k_EBroadcastUploadResultInitFailed = 2, // broadcast init failed
    k_EBroadcastUploadResultFrameFailed = 3,    // broadcast frame upload failed
    k_EBroadcastUploadResultTimeout = 4,    // broadcast upload timed out
    k_EBroadcastUploadResultBandwidthExceeded = 5,  // broadcast send too much data
    k_EBroadcastUploadResultLowFPS = 6, // broadcast FPS too low
    k_EBroadcastUploadResultMissingKeyFrames = 7,   // broadcast sending not enough key frames
    k_EBroadcastUploadResultNoConnection = 8,   // broadcast client failed to connect to relay
    k_EBroadcastUploadResultRelayFailed = 9,    // relay dropped the upload
    k_EBroadcastUploadResultSettingsChanged = 10,   // the client changed broadcast settings 
    k_EBroadcastUploadResultMissingAudio = 11,  // client failed to send audio data
    k_EBroadcastUploadResultTooFarBehind = 12,  // clients was too slow uploading
    k_EBroadcastUploadResultTranscodeBehind = 13,   // server failed to keep up with transcode
}

enum ELaunchOptionType
{
    k_ELaunchOptionType_None        = 0,    // unknown what launch option does
    k_ELaunchOptionType_Default     = 1,    // runs the game, app, whatever in default mode
    k_ELaunchOptionType_SafeMode    = 2,    // runs the game in safe mode
    k_ELaunchOptionType_Multiplayer = 3,    // runs the game in multiplayer mode
    k_ELaunchOptionType_Config      = 4,    // runs config tool for this game
    k_ELaunchOptionType_VR          = 5,    // runs game in VR mode
    k_ELaunchOptionType_Server      = 6,    // runs dedicated server for this game
    k_ELaunchOptionType_Editor      = 7,    // runs game editor
    k_ELaunchOptionType_Manual      = 8,    // shows game manual
    k_ELaunchOptionType_Benchmark   = 9,    // runs game benchmark
    k_ELaunchOptionType_Option1     = 10,   // generic run option, uses description field for game name
    k_ELaunchOptionType_Option2     = 11,   // generic run option, uses description field for game name
    k_ELaunchOptionType_Option3     = 12,   // generic run option, uses description field for game name
    
    
    k_ELaunchOptionType_Dialog      = 1000, // show launch options dialog
}
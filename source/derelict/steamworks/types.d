/*
 * Copyright (c) 2015 Derelict Developers
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 * * Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 *
 * * Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the distribution.
 *
 * * Neither the names 'Derelict', 'DerelictILUT', nor the names of its contributors
 *   may be used to endorse or promote products derived from this software
 *   without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
module derelict.steamworks.types;

import derelict.util.system;

alias int32 = int;
alias int64 = long;
alias uint64 = ulong;
alias int16 = short;
alias uint16 = ushort;
alias uint32 = uint;
alias uint8 = ubyte;

alias intptr_t = void*;

alias HSteamPipe = int32;
alias HSteamUser = int32;
alias HAuthTicket = uint32;
alias SteamAPICall_t = uint64;
alias FriendsGroupID_t = int16;

alias AppId_t= uint32;

enum EVoiceResult
{
    k_EVoiceResultOK = 0,
    k_EVoiceResultNotInitialized = 1,
    k_EVoiceResultNotRecording = 2,
    k_EVoiceResultNoData = 3,
    k_EVoiceResultBufferTooSmall = 4,
    k_EVoiceResultDataCorrupted = 5,
    k_EVoiceResultRestricted = 6,
    k_EVoiceResultUnsupportedCodec = 7,
    k_EVoiceResultReceiverOutOfDate = 8,
    k_EVoiceResultReceiverDidNotAnswer = 9,  
}

// results from BeginAuthSession
enum EBeginAuthSessionResult
{
    k_EBeginAuthSessionResultOK = 0,                        // Ticket is valid for this game and this steamID.
    k_EBeginAuthSessionResultInvalidTicket = 1,             // Ticket is not valid.
    k_EBeginAuthSessionResultDuplicateRequest = 2,          // A ticket has already been submitted for this steamID
    k_EBeginAuthSessionResultInvalidVersion = 3,            // Ticket is from an incompatible interface version
    k_EBeginAuthSessionResultGameMismatch = 4,              // Ticket is not for this game
    k_EBeginAuthSessionResultExpiredTicket = 5,             // Ticket has expired
}

enum EUserHasLicenseForAppResult
{
    k_EUserHasLicenseResultHasLicense = 0,
    k_EUserHasLicenseResultDoesNotHaveLicense = 1,
    k_EUserHasLicenseResultNoAuth = 2,
}

enum EPersonaState
{
    k_EPersonaStateOffline = 0,         // friend is not currently logged on
    k_EPersonaStateOnline = 1,          // friend is logged on
    k_EPersonaStateBusy = 2,            // user is on, but busy
    k_EPersonaStateAway = 3,            // auto-away feature
    k_EPersonaStateSnooze = 4,          // auto-away for a long time
    k_EPersonaStateLookingToTrade = 5,  // Online, trading
    k_EPersonaStateLookingToPlay = 6,   // Online, wanting to play
    k_EPersonaStateMax,
}

enum EChatEntryType
{
    k_EChatEntryTypeInvalid = 0, 
    k_EChatEntryTypeChatMsg = 1,        // Normal text message from another user
    k_EChatEntryTypeTyping = 2,         // Another user is typing (not used in multi-user chat)
    k_EChatEntryTypeInviteGame = 3,     // Invite from other user into that users current game
    k_EChatEntryTypeEmote = 4,          // text emote message (deprecated, should be treated as ChatMsg)
    //k_EChatEntryTypeLobbyGameStart = 5,   // lobby game is starting (dead - listen for LobbyGameCreated_t callback instead)
    k_EChatEntryTypeLeftConversation = 6, // user has left the conversation ( closed chat window )
    // Above are previous FriendMsgType entries, now merged into more generic chat entry types
    k_EChatEntryTypeEntered = 7,        // user has entered the conversation (used in multi-user chat and group chat)
    k_EChatEntryTypeWasKicked = 8,      // user was kicked (data: 64-bit steamid of actor performing the kick)
    k_EChatEntryTypeWasBanned = 9,      // user was banned (data: 64-bit steamid of actor performing the ban)
    k_EChatEntryTypeDisconnected = 10,  // user disconnected
    k_EChatEntryTypeHistoricalChat = 11,    // a chat message from user's chat history or offilne message
    k_EChatEntryTypeReserved1 = 12,
    k_EChatEntryTypeReserved2 = 13,
}

enum EFriendRelationship
{
    k_EFriendRelationshipNone = 0,
    k_EFriendRelationshipBlocked = 1,
    k_EFriendRelationshipRequestRecipient = 2,
    k_EFriendRelationshipFriend = 3,
    k_EFriendRelationshipRequestInitiator = 4,
    k_EFriendRelationshipIgnored = 5,
    k_EFriendRelationshipIgnoredFriend = 6,
    k_EFriendRelationshipSuggested = 7,
    
    // keep this updated
    k_EFriendRelationshipMax = 8,
}
enum EOverlayToStoreFlag
{
    k_EOverlayToStoreFlag_None = 0,
    k_EOverlayToStoreFlag_AddToCart = 1,
    k_EOverlayToStoreFlag_AddToCartAndShow = 2,
}

enum EFriendFlags
{
    k_EFriendFlagNone           = 0x00,
    k_EFriendFlagBlocked        = 0x01,
    k_EFriendFlagFriendshipRequested    = 0x02,
    k_EFriendFlagImmediate      = 0x04,         // "regular" friend
    k_EFriendFlagClanMember     = 0x08,
    k_EFriendFlagOnGameServer   = 0x10, 
    // k_EFriendFlagHasPlayedWith   = 0x20, // not currently used
    // k_EFriendFlagFriendOfFriend  = 0x40, // not currently used
    k_EFriendFlagRequestingFriendship = 0x80,
    k_EFriendFlagRequestingInfo = 0x100,
    k_EFriendFlagIgnored        = 0x200,
    k_EFriendFlagIgnoredFriend  = 0x400,
    k_EFriendFlagSuggested      = 0x800,
    k_EFriendFlagAll            = 0xFFFF,
}

enum EUniverse
{
    k_EUniverseInvalid = 0,
    k_EUniversePublic = 1,
    k_EUniverseBeta = 2,
    k_EUniverseInternal = 3,
    k_EUniverseDev = 4,
    // k_EUniverseRC = 5,               // no such universe anymore
    k_EUniverseMax
}

enum ENotificationPosition
{
    k_EPositionTopLeft = 0,
    k_EPositionTopRight = 1,
    k_EPositionBottomLeft = 2,
    k_EPositionBottomRight = 3,
}

enum ESteamAPICallFailure
{
    k_ESteamAPICallFailureNone = -1,
    k_ESteamAPICallFailureSteamGone = 0,
    k_ESteamAPICallFailureNetworkFailure = 1,
    k_ESteamAPICallFailureInvalidHandle = 2,
    k_ESteamAPICallFailureMismatchedCallback = 3,
}

enum EGamepadTextInputMode
{
    k_EGamepadTextInputModeNormal = 0,
    k_EGamepadTextInputModePassword = 1,
}

enum EGamepadTextInputLineMode
{
    k_EGamepadTextInputLineModeSingleLine = 0,
    k_EGamepadTextInputLineModeMultipleLines = 1,
}

extern(C) nothrow 
{
    alias SteamAPIWarningMessageHook_t = void function(int, const char *);
    alias SteamAPI_PostAPIResultInProcess_t = void function(SteamAPICall_t callHandle, void *, uint32 unCallbackSize, int iCallbackNum);
    alias SteamAPI_CheckCallbackRegistered_t = uint32 function( int iCallbackNum );
}

align(1)struct FriendGameInfo_t
{
    CGameID m_gameID;
    uint32 m_unGameIP;
    uint16 m_usGamePort;
    uint16 m_usQueryPort;
    CSteamID m_steamIDLobby;
}

align(1)struct LeaderboardEntry_t
{
    CSteamID m_steamIDUser; // user with the entry - use SteamFriends()->GetFriendPersonaName() & SteamFriends()->GetFriendAvatar() to get more info
    int32 m_nGlobalRank;    // [1..N], where N is the number of users with an entry in the leaderboard
    int32 m_nScore;         // score as set in the leaderboard
    int32 m_cDetails;       // number of int32 details available for this entry
    UGCHandle_t m_hUGC;     // handle for UGC attached to the entry
}

struct SteamControllerState001_t
{
    // If packet num matches that on your prior call, then the controller state hasn't been changed since 
    // your last call and there is no need to process it
    uint32 unPacketNum;
    
    // bit flags for each of the buttons
    uint64 ulButtons;
    
    // Left pad coordinates
    short sLeftPadX;
    short sLeftPadY;
    
    // Right pad coordinates
    short sRightPadX;
    short sRightPadY;
    
}

static immutable uint32 k_cchPublishedDocumentTitleMax = 128 + 1;
static immutable uint32 k_cchPublishedDocumentDescriptionMax = 8000;
static immutable uint32 k_cchPublishedDocumentChangeDescriptionMax = 8000;
static immutable uint32 k_unEnumeratePublishedFilesMaxResults = 50;
static immutable uint32 k_cchTagListMax = 1024 + 1;
static immutable uint32 k_cchFilenameMax = 260;
static immutable uint32 k_cchPublishedFileURLMax = 256;

struct SteamUGCDetails_t
{
    PublishedFileId_t m_nPublishedFileId;
    EResult m_eResult;                                              // The result of the operation. 
    EWorkshopFileType m_eFileType;                                  // Type of the file
    AppId_t m_nCreatorAppID;                                        // ID of the app that created this file.
    AppId_t m_nConsumerAppID;                                       // ID of the app that will consume this file.
    char[k_cchPublishedDocumentTitleMax] m_rgchTitle;               // title of document
    char[k_cchPublishedDocumentDescriptionMax] m_rgchDescription;   // description of document
    uint64 m_ulSteamIDOwner;                                        // Steam ID of the user who created this content.
    uint32 m_rtimeCreated;                                          // time when the published file was created
    uint32 m_rtimeUpdated;                                          // time when the published file was last updated
    uint32 m_rtimeAddedToUserList;                                  // time when the user added the published file to their list (not always applicable)
    ERemoteStoragePublishedFileVisibility m_eVisibility;            // visibility
    bool m_bBanned;                                                 // whether the file was banned
    bool m_bAcceptedForUse;                                         // developer has specifically flagged this item as accepted in the Workshop
    bool m_bTagsTruncated;                                          // whether the list of tags was too long to be returned in the provided buffer
    char[k_cchTagListMax] m_rgchTags;                               // comma separated list of all tags associated with this file   
    // file/url information
    UGCHandle_t m_hFile;                                            // The handle of the primary file
    UGCHandle_t m_hPreviewFile;                                     // The handle of the preview file
    char[k_cchFilenameMax] m_pchFileName;                           // The cloud filename of the primary file
    int32 m_nFileSize;                                              // Size of the primary file
    int32 m_nPreviewFileSize;                                       // Size of the preview file
    char[k_cchPublishedFileURLMax] m_rgchURL;                       // URL (for a video or a website)
    // voting information
    uint32 m_unVotesUp;                                             // number of votes up
    uint32 m_unVotesDown;                                           // number of votes down
    float m_flScore;                                                // calculated score
    // collection details
    uint32 m_unNumChildren;                         
}

struct SteamItemDetails_t
{
    SteamItemInstanceID_t m_itemId;
    SteamItemDef_t m_iDefinition;
    uint16 m_unQuantity;
    uint16 m_unFlags; // see ESteamItemFlags
}

alias CSteamID = uint64;
alias CGameID = uint64;
alias HServerListRequest = void*;
alias HServerQuery = int;
alias UGCHandle_t = uint64;
alias SteamLeaderboard_t = uint64;
alias SteamLeaderboardEntries_t = uint64;
alias UGCFileWriteStreamHandle_t = uint64;
alias PublishedFileUpdateHandle_t = uint64;
alias PublishedFileId_t = uint64;
alias DepotId_t = uint32;
alias SNetListenSocket_t = uint32;
alias SNetSocket_t = uint32;
alias ScreenshotHandle = uint32;
alias HTTPRequestHandle = uint32;
alias HTTPCookieContainerHandle = uint32;
alias ClientUnifiedMessageHandle = uint64;
alias UGCQueryHandle_t = uint64;
alias UGCUpdateHandle_t = uint64;
alias AccountID_t = uint32;
alias HHTMLBrowser = uint32;
alias RTime32 = uint32;
alias SteamInventoryResult_t = int32;
alias SteamItemInstanceID_t = uint64;
alias SteamItemDef_t = int32;

struct ISteamGameServer{}
struct ISteamMatchmaking{}
struct ISteamMatchmakingServers{}
struct ISteamUserStats{}
struct ISteamGameServerStats{}
struct ISteamApps{}
struct ISteamNetworking{}
struct ISteamRemoteStorage{}
struct ISteamScreenshots{}
struct ISteamHTTP{}
struct ISteamUnifiedMessages{}
struct ISteamController{}
struct ISteamUGC{}
struct ISteamAppList{}
struct ISteamMusic{}
struct ISteamMusicRemote{}
struct ISteamHTMLSurface{}
struct ISteamInventory{}
struct ISteamVideo{}
struct ISteamUtils{}
struct ISteamClient{}

enum EAccountType
{
    k_EAccountTypeInvalid = 0,          
    k_EAccountTypeIndividual = 1,       // single user account
    k_EAccountTypeMultiseat = 2,        // multiseat (e.g. cybercafe) account
    k_EAccountTypeGameServer = 3,       // game server account
    k_EAccountTypeAnonGameServer = 4,   // anonymous game server account
    k_EAccountTypePending = 5,          // pending
    k_EAccountTypeContentServer = 6,    // content server
    k_EAccountTypeClan = 7,
    k_EAccountTypeChat = 8,
    k_EAccountTypeConsoleUser = 9,      // Fake SteamID for local PSN account on PS3 or Live account on 360, etc.
    k_EAccountTypeAnonUser = 10,
    
    // Max of 16 items in this field
    k_EAccountTypeMax
}

enum ELobbyType
{
    k_ELobbyTypePrivate = 0,        // only way to join the lobby is to invite to someone else
    k_ELobbyTypeFriendsOnly = 1,    // shows for friends or invitees, but not in lobby list
    k_ELobbyTypePublic = 2,         // visible for friends and in lobby list
    k_ELobbyTypeInvisible = 3,      // returned by search, but not visible to other friends 
    //    useful if you want a user in two lobbies, for example matching groups together
    //    a user can be in only one regular lobby, and up to two invisible lobbies
}

enum ELobbyComparison
{
    k_ELobbyComparisonEqualToOrLessThan = -2,
    k_ELobbyComparisonLessThan = -1,
    k_ELobbyComparisonEqual = 0,
    k_ELobbyComparisonGreaterThan = 1,
    k_ELobbyComparisonEqualToOrGreaterThan = 2,
    k_ELobbyComparisonNotEqual = 3,
}

enum ELobbyDistanceFilter
{
    k_ELobbyDistanceFilterClose,        // only lobbies in the same immediate region will be returned
    k_ELobbyDistanceFilterDefault,      // only lobbies in the same region or near by regions
    k_ELobbyDistanceFilterFar,          // for games that don't have many latency requirements, will return lobbies about half-way around the globe
    k_ELobbyDistanceFilterWorldwide,    // no filtering, will match lobbies as far as India to NY (not recommended, expect multiple seconds of latency between the clients)
}

enum EMatchMakingServerResponse
{
    eServerResponded = 0,
    eServerFailedToRespond,
    eNoServersListedOnMasterServer // for the Internet query type, returned in response callback if no servers of this type match
}

enum ELeaderboardSortMethod
{
    k_ELeaderboardSortMethodNone = 0,
    k_ELeaderboardSortMethodAscending = 1,  // top-score is lowest number
    k_ELeaderboardSortMethodDescending = 2, // top-score is highest number
}

enum ELeaderboardDisplayType
{
    k_ELeaderboardDisplayTypeNone = 0, 
    k_ELeaderboardDisplayTypeNumeric = 1,           // simple numerical score
    k_ELeaderboardDisplayTypeTimeSeconds = 2,       // the score represents a time, in seconds
    k_ELeaderboardDisplayTypeTimeMilliSeconds = 3,  // the score represents a time, in milliseconds
}

enum ELeaderboardDataRequest
{
    k_ELeaderboardDataRequestGlobal = 0,
    k_ELeaderboardDataRequestGlobalAroundUser = 1,
    k_ELeaderboardDataRequestFriends = 2,
    k_ELeaderboardDataRequestUsers = 3
}

enum ELeaderboardUploadScoreMethod
{
    k_ELeaderboardUploadScoreMethodNone = 0,
    k_ELeaderboardUploadScoreMethodKeepBest = 1,    // Leaderboard will keep user's best score
    k_ELeaderboardUploadScoreMethodForceUpdate = 2, // Leaderboard will always replace score with specified
}

enum ERemoteStoragePlatform
{
    k_ERemoteStoragePlatformNone        = 0,
    k_ERemoteStoragePlatformWindows     = (1 << 0),
    k_ERemoteStoragePlatformOSX         = (1 << 1),
    k_ERemoteStoragePlatformPS3         = (1 << 2),
    k_ERemoteStoragePlatformLinux       = (1 << 3),
    k_ERemoteStoragePlatformReserved2   = (1 << 4),
    
    k_ERemoteStoragePlatformAll = 0xffffffff
}

enum EUGCReadAction
{
    // Keeps the file handle open unless the last byte is read.  You can use this when reading large files (over 100MB) in sequential chunks.
    // If the last byte is read, this will behave the same as k_EUGCRead_Close.  Otherwise, it behaves the same as k_EUGCRead_ContinueReading.
    // This value maintains the same behavior as before the EUGCReadAction parameter was introduced.
    k_EUGCRead_ContinueReadingUntilFinished = 0,
    
    // Keeps the file handle open.  Use this when using UGCRead to seek to different parts of the file.
    // When you are done seeking around the file, make a final call with k_EUGCRead_Close to close it.
    k_EUGCRead_ContinueReading = 1,
    
    // Frees the file handle.  Use this when you're done reading the content.  
    // To read the file from Steam again you will need to call UGCDownload again. 
    k_EUGCRead_Close = 2,   
}

enum ERemoteStoragePublishedFileVisibility
{
    k_ERemoteStoragePublishedFileVisibilityPublic = 0,
    k_ERemoteStoragePublishedFileVisibilityFriendsOnly = 1,
    k_ERemoteStoragePublishedFileVisibilityPrivate = 2,
}

enum EWorkshopFileType
{
    k_EWorkshopFileTypeFirst = 0,
    
    k_EWorkshopFileTypeCommunity              = 0,      // normal Workshop item that can be subscribed to
    k_EWorkshopFileTypeMicrotransaction       = 1,      // Workshop item that is meant to be voted on for the purpose of selling in-game
    k_EWorkshopFileTypeCollection             = 2,      // a collection of Workshop or Greenlight items
    k_EWorkshopFileTypeArt                    = 3,      // artwork
    k_EWorkshopFileTypeVideo                  = 4,      // external video
    k_EWorkshopFileTypeScreenshot             = 5,      // screenshot
    k_EWorkshopFileTypeGame                   = 6,      // Greenlight game entry
    k_EWorkshopFileTypeSoftware               = 7,      // Greenlight software entry
    k_EWorkshopFileTypeConcept                = 8,      // Greenlight concept
    k_EWorkshopFileTypeWebGuide               = 9,      // Steam web guide
    k_EWorkshopFileTypeIntegratedGuide        = 10,     // application integrated guide
    k_EWorkshopFileTypeMerch                  = 11,     // Workshop merchandise meant to be voted on for the purpose of being sold
    k_EWorkshopFileTypeControllerBinding      = 12,     // Steam Controller bindings
    k_EWorkshopFileTypeSteamworksAccessInvite = 13,     // internal
    k_EWorkshopFileTypeSteamVideo             = 14,     // Steam video
    k_EWorkshopFileTypeGameManagedItem        = 15,     // managed completely by the game, not the user, and not shown on the web
    
    // Update k_EWorkshopFileTypeMax if you add values.
    k_EWorkshopFileTypeMax = 16
    
}

enum EWorkshopVideoProvider
{
    k_EWorkshopVideoProviderNone = 0,
    k_EWorkshopVideoProviderYoutube = 1
}

enum EWorkshopFileAction
{
    k_EWorkshopFileActionPlayed = 0,
    k_EWorkshopFileActionCompleted = 1,
}

enum EWorkshopEnumerationType
{
    k_EWorkshopEnumerationTypeRankedByVote = 0,
    k_EWorkshopEnumerationTypeRecent = 1,
    k_EWorkshopEnumerationTypeTrending = 2,
    k_EWorkshopEnumerationTypeFavoritesOfFriends = 3,
    k_EWorkshopEnumerationTypeVotedByFriends = 4,
    k_EWorkshopEnumerationTypeContentByFriends = 5,
    k_EWorkshopEnumerationTypeRecentFromFollowedUsers = 6,
}

enum EP2PSend
{
    // Basic UDP send. Packets can't be bigger than 1200 bytes (your typical MTU size). Can be lost, or arrive out of order (rare).
    // The sending API does have some knowledge of the underlying connection, so if there is no NAT-traversal accomplished or
    // there is a recognized adjustment happening on the connection, the packet will be batched until the connection is open again.
    k_EP2PSendUnreliable = 0,
    
    // As above, but if the underlying p2p connection isn't yet established the packet will just be thrown away. Using this on the first
    // packet sent to a remote host almost guarantees the packet will be dropped.
    // This is only really useful for kinds of data that should never buffer up, i.e. voice payload packets
    k_EP2PSendUnreliableNoDelay = 1,
    
    // Reliable message send. Can send up to 1MB of data in a single message. 
    // Does fragmentation/re-assembly of messages under the hood, as well as a sliding window for efficient sends of large chunks of data. 
    k_EP2PSendReliable = 2,
    
    // As above, but applies the Nagle algorithm to the send - sends will accumulate 
    // until the current MTU size (typically ~1200 bytes, but can change) or ~200ms has passed (Nagle algorithm). 
    // Useful if you want to send a set of smaller messages but have the coalesced into a single packet
    // Since the reliable stream is all ordered, you can do several small message sends with k_EP2PSendReliableWithBuffering and then
    // do a normal k_EP2PSendReliable to force all the buffered data to be sent.
    k_EP2PSendReliableWithBuffering = 3,
}

enum ESNetSocketConnectionType
{
    k_ESNetSocketConnectionTypeNotConnected = 0,
    k_ESNetSocketConnectionTypeUDP = 1,
    k_ESNetSocketConnectionTypeUDPRelay = 2,
}

enum AudioPlayback_Status
{
    AudioPlayback_Undefined = 0, 
    AudioPlayback_Playing = 1,
    AudioPlayback_Paused = 2,
    AudioPlayback_Idle = 3
}

enum ISteamHTMLSurface_EHTMLMouseButton
{
    eHTMLMouseButton_Left = 0,
    eHTMLMouseButton_Right = 1,
    eHTMLMouseButton_Middle = 2,
}

enum ISteamHTMLSurface_EMouseCursor
{
    dc_user = 0,
    dc_none,
    dc_arrow,
    dc_ibeam,
    dc_hourglass,
    dc_waitarrow,
    dc_crosshair,
    dc_up,
    dc_sizenw,
    dc_sizese,
    dc_sizene,
    dc_sizesw,
    dc_sizew,
    dc_sizee,
    dc_sizen,
    dc_sizes,
    dc_sizewe,
    dc_sizens,
    dc_sizeall,
    dc_no,
    dc_hand,
    dc_blank, // don't show any custom cursor, just use your default
    dc_middle_pan,
    dc_north_pan,
    dc_north_east_pan,
    dc_east_pan,
    dc_south_east_pan,
    dc_south_pan,
    dc_south_west_pan,
    dc_west_pan,
    dc_north_west_pan,
    dc_alias,
    dc_cell,
    dc_colresize,
    dc_copycur,
    dc_verticaltext,
    dc_rowresize,
    dc_zoomin,
    dc_zoomout,
    dc_help,
    dc_custom,
    
    dc_last, // custom cursors start from this value and up
}

enum ISteamHTMLSurface_EHTMLKeyModifiers
{
    k_eHTMLKeyModifier_None = 0,
    k_eHTMLKeyModifier_AltDown = 1 << 0,
    k_eHTMLKeyModifier_CtrlDown = 1 << 1,
    k_eHTMLKeyModifier_ShiftDown = 1 << 2,
}

enum EHTTPMethod
{
    k_EHTTPMethodInvalid = 0,
    k_EHTTPMethodGET = 1,
    k_EHTTPMethodHEAD = 2,
    k_EHTTPMethodPOST = 3,
    k_EHTTPMethodPUT = 4,
    k_EHTTPMethodDELETE = 5,
    k_EHTTPMethodOPTIONS = 6,
}

enum EResult
{
    k_EResultOK = 1,                            // success
    k_EResultFail = 2,                          // generic failure 
    k_EResultNoConnection = 3,                  // no/failed network connection
    //  k_EResultNoConnectionRetry = 4,             // OBSOLETE - removed
    k_EResultInvalidPassword = 5,               // password/ticket is invalid
    k_EResultLoggedInElsewhere = 6,             // same user logged in elsewhere
    k_EResultInvalidProtocolVer = 7,            // protocol version is incorrect
    k_EResultInvalidParam = 8,                  // a parameter is incorrect
    k_EResultFileNotFound = 9,                  // file was not found
    k_EResultBusy = 10,                         // called method busy - action not taken
    k_EResultInvalidState = 11,                 // called object was in an invalid state
    k_EResultInvalidName = 12,                  // name is invalid
    k_EResultInvalidEmail = 13,                 // email is invalid
    k_EResultDuplicateName = 14,                // name is not unique
    k_EResultAccessDenied = 15,                 // access is denied
    k_EResultTimeout = 16,                      // operation timed out
    k_EResultBanned = 17,                       // VAC2 banned
    k_EResultAccountNotFound = 18,              // account not found
    k_EResultInvalidSteamID = 19,               // steamID is invalid
    k_EResultServiceUnavailable = 20,           // The requested service is currently unavailable
    k_EResultNotLoggedOn = 21,                  // The user is not logged on
    k_EResultPending = 22,                      // Request is pending (may be in process, or waiting on third party)
    k_EResultEncryptionFailure = 23,            // Encryption or Decryption failed
    k_EResultInsufficientPrivilege = 24,        // Insufficient privilege
    k_EResultLimitExceeded = 25,                // Too much of a good thing
    k_EResultRevoked = 26,                      // Access has been revoked (used for revoked guest passes)
    k_EResultExpired = 27,                      // License/Guest pass the user is trying to access is expired
    k_EResultAlreadyRedeemed = 28,              // Guest pass has already been redeemed by account, cannot be acked again
    k_EResultDuplicateRequest = 29,             // The request is a duplicate and the action has already occurred in the past, ignored this time
    k_EResultAlreadyOwned = 30,                 // All the games in this guest pass redemption request are already owned by the user
    k_EResultIPNotFound = 31,                   // IP address not found
    k_EResultPersistFailed = 32,                // failed to write change to the data store
    k_EResultLockingFailed = 33,                // failed to acquire access lock for this operation
    k_EResultLogonSessionReplaced = 34,
    k_EResultConnectFailed = 35,
    k_EResultHandshakeFailed = 36,
    k_EResultIOFailure = 37,
    k_EResultRemoteDisconnect = 38,
    k_EResultShoppingCartNotFound = 39,         // failed to find the shopping cart requested
    k_EResultBlocked = 40,                      // a user didn't allow it
    k_EResultIgnored = 41,                      // target is ignoring sender
    k_EResultNoMatch = 42,                      // nothing matching the request found
    k_EResultAccountDisabled = 43,
    k_EResultServiceReadOnly = 44,              // this service is not accepting content changes right now
    k_EResultAccountNotFeatured = 45,           // account doesn't have value, so this feature isn't available
    k_EResultAdministratorOK = 46,              // allowed to take this action, but only because requester is admin
    k_EResultContentVersion = 47,               // A Version mismatch in content transmitted within the Steam protocol.
    k_EResultTryAnotherCM = 48,                 // The current CM can't service the user making a request, user should try another.
    k_EResultPasswordRequiredToKickSession = 49,// You are already logged in elsewhere, this cached credential login has failed.
    k_EResultAlreadyLoggedInElsewhere = 50,     // You are already logged in elsewhere, you must wait
    k_EResultSuspended = 51,                    // Long running operation (content download) suspended/paused
    k_EResultCancelled = 52,                    // Operation canceled (typically by user: content download)
    k_EResultDataCorruption = 53,               // Operation canceled because data is ill formed or unrecoverable
    k_EResultDiskFull = 54,                     // Operation canceled - not enough disk space.
    k_EResultRemoteCallFailed = 55,             // an remote call or IPC call failed
    k_EResultPasswordUnset = 56,                // Password could not be verified as it's unset server side
    k_EResultExternalAccountUnlinked = 57,      // External account (PSN, Facebook...) is not linked to a Steam account
    k_EResultPSNTicketInvalid = 58,             // PSN ticket was invalid
    k_EResultExternalAccountAlreadyLinked = 59, // External account (PSN, Facebook...) is already linked to some other account, must explicitly request to replace/delete the link first
    k_EResultRemoteFileConflict = 60,           // The sync cannot resume due to a conflict between the local and remote files
    k_EResultIllegalPassword = 61,              // The requested new password is not legal
    k_EResultSameAsPreviousValue = 62,          // new value is the same as the old one ( secret question and answer )
    k_EResultAccountLogonDenied = 63,           // account login denied due to 2nd factor authentication failure
    k_EResultCannotUseOldPassword = 64,         // The requested new password is not legal
    k_EResultInvalidLoginAuthCode = 65,         // account login denied due to auth code invalid
    k_EResultAccountLogonDeniedNoMail = 66,     // account login denied due to 2nd factor auth failure - and no mail has been sent
    k_EResultHardwareNotCapableOfIPT = 67,      // 
    k_EResultIPTInitError = 68,                 // 
    k_EResultParentalControlRestricted = 69,    // operation failed due to parental control restrictions for current user
    k_EResultFacebookQueryError = 70,           // Facebook query returned an error
    k_EResultExpiredLoginAuthCode = 71,         // account login denied due to auth code expired
    k_EResultIPLoginRestrictionFailed = 72,
    k_EResultAccountLockedDown = 73,
    k_EResultAccountLogonDeniedVerifiedEmailRequired = 74,
    k_EResultNoMatchingURL = 75,
    k_EResultBadResponse = 76,                  // parse failure, missing field, etc.
    k_EResultRequirePasswordReEntry = 77,       // The user cannot complete the action until they re-enter their password
    k_EResultValueOutOfRange = 78,              // the value entered is outside the acceptable range
    k_EResultUnexpectedError = 79,              // something happened that we didn't expect to ever happen
    k_EResultDisabled = 80,                     // The requested service has been configured to be unavailable
    k_EResultInvalidCEGSubmission = 81,         // The set of files submitted to the CEG server are not valid !
    k_EResultRestrictedDevice = 82,             // The device being used is not allowed to perform this action
    k_EResultRegionLocked = 83,                 // The action could not be complete because it is region restricted
    k_EResultRateLimitExceeded = 84,            // Temporary rate limit exceeded, try again later, different from k_EResultLimitExceeded which may be permanent
    k_EResultAccountLoginDeniedNeedTwoFactor = 85,  // Need two-factor code to login
    k_EResultItemDeleted = 86,                  // The thing we're trying to access has been deleted
    k_EResultAccountLoginDeniedThrottle = 87,   // login attempt failed, try to throttle response to possible attacker
    k_EResultTwoFactorCodeMismatch = 88,        // two factor code mismatch
    k_EResultTwoFactorActivationCodeMismatch = 89,  // activation code for two-factor didn't match
    k_EResultAccountAssociatedToMultiplePartners = 90,  // account has been associated with multiple partners
    k_EResultNotModified = 91,                  // data not modified
    k_EResultNoMobileDevice = 92,               // the account does not have a mobile device associated with it
    k_EResultTimeNotSynced = 93,                // the time presented is out of range or tolerance
    k_EResultSmsCodeFailed = 94,                // SMS code failure (no match, none pending, etc.)
    k_EResultAccountLimitExceeded = 95,         // Too many accounts access this resource
    k_EResultAccountActivityLimitExceeded = 96, // Too many changes to this account
    k_EResultPhoneActivityLimitExceeded = 97,   // Too many changes to this phone
    k_EResultRefundToWallet = 98,               // Cannot refund to payment method, must use wallet
    k_EResultEmailSendFailure = 99,             // Cannot send an email
    k_EResultNotSettled = 100,                  // Can't perform operation till payment has settled
}

enum ESteamControllerPad
{
    k_ESteamControllerPad_Left,
    k_ESteamControllerPad_Right
}

enum EUGCQuery
{
    k_EUGCQuery_RankedByVote                                  = 0,
    k_EUGCQuery_RankedByPublicationDate                       = 1,
    k_EUGCQuery_AcceptedForGameRankedByAcceptanceDate         = 2,
    k_EUGCQuery_RankedByTrend                                 = 3,
    k_EUGCQuery_FavoritedByFriendsRankedByPublicationDate     = 4,
    k_EUGCQuery_CreatedByFriendsRankedByPublicationDate       = 5,
    k_EUGCQuery_RankedByNumTimesReported                      = 6,
    k_EUGCQuery_CreatedByFollowedUsersRankedByPublicationDate = 7,
    k_EUGCQuery_NotYetRated                                   = 8,
    k_EUGCQuery_RankedByTotalVotesAsc                         = 9,
    k_EUGCQuery_RankedByVotesUp                               = 10,
    k_EUGCQuery_RankedByTextSearch                            = 11,
    k_EUGCQuery_RankedByTotalUniqueSubscriptions              = 12,
}

enum EUserUGCList
{
    k_EUserUGCList_Published,
    k_EUserUGCList_VotedOn,
    k_EUserUGCList_VotedUp,
    k_EUserUGCList_VotedDown,
    k_EUserUGCList_WillVoteLater,
    k_EUserUGCList_Favorited,
    k_EUserUGCList_Subscribed,
    k_EUserUGCList_UsedOrPlayed,
    k_EUserUGCList_Followed,
}

enum EUserUGCListSortOrder
{
    k_EUserUGCListSortOrder_CreationOrderDesc,
    k_EUserUGCListSortOrder_CreationOrderAsc,
    k_EUserUGCListSortOrder_TitleAsc,
    k_EUserUGCListSortOrder_LastUpdatedDesc,
    k_EUserUGCListSortOrder_SubscriptionDateDesc,
    k_EUserUGCListSortOrder_VoteScoreDesc,
    k_EUserUGCListSortOrder_ForModeration,
}

enum EUGCMatchingUGCType
{
    k_EUGCMatchingUGCType_Items              = 0,       // both mtx items and ready-to-use items
    k_EUGCMatchingUGCType_Items_Mtx          = 1,
    k_EUGCMatchingUGCType_Items_ReadyToUse   = 2,
    k_EUGCMatchingUGCType_Collections        = 3,
    k_EUGCMatchingUGCType_Artwork            = 4,
    k_EUGCMatchingUGCType_Videos             = 5,
    k_EUGCMatchingUGCType_Screenshots        = 6,
    k_EUGCMatchingUGCType_AllGuides          = 7,       // both web guides and integrated guides
    k_EUGCMatchingUGCType_WebGuides          = 8,
    k_EUGCMatchingUGCType_IntegratedGuides   = 9,
    k_EUGCMatchingUGCType_UsableInGame       = 10,      // ready-to-use items and integrated guides
    k_EUGCMatchingUGCType_ControllerBindings = 11,
    k_EUGCMatchingUGCType_GameManagedItems   = 12,      // game managed items (not managed by users)
}

enum EItemStatistic
{
    k_EItemStatistic_NumSubscriptions       = 0,
    k_EItemStatistic_NumFavorites           = 1,
    k_EItemStatistic_NumFollowers           = 2,
    k_EItemStatistic_NumUniqueSubscriptions = 3,
    k_EItemStatistic_NumUniqueFavorites     = 4,
    k_EItemStatistic_NumUniqueFollowers     = 5,
    k_EItemStatistic_NumUniqueWebsiteViews  = 6,
    k_EItemStatistic_ReportScore            = 7,
}

enum EItemUpdateStatus
{
    k_EItemUpdateStatusInvalid              = 0, // The item update handle was invalid, job might be finished, listen too SubmitItemUpdateResult_t
    k_EItemUpdateStatusPreparingConfig      = 1, // The item update is processing configuration data
    k_EItemUpdateStatusPreparingContent     = 2, // The item update is reading and processing content files
    k_EItemUpdateStatusUploadingContent     = 3, // The item update is uploading content changes to Steam
    k_EItemUpdateStatusUploadingPreviewFile = 4, // The item update is uploading new preview file image
    k_EItemUpdateStatusCommittingChanges    = 5  // The item update is committing all changes
}

static immutable int k_cbMaxGameServerGameDir = 32;
static immutable int k_cbMaxGameServerMapName = 32;
static immutable int k_cbMaxGameServerGameDescription = 64;
static immutable int k_cbMaxGameServerName = 64;
static immutable int k_cbMaxGameServerTags = 128;
static immutable int k_cbMaxGameServerGameData = 2048;

struct servernetadr_t 
{
    uint16  m_usConnectionPort; // (in HOST byte order)
    uint16  m_usQueryPort;
    uint32  m_unIP;
}

struct gameserveritem_t
{
    servernetadr_t m_NetAdr;                                    ///< IP/Query Port/Connection Port for this server
    int m_nPing;                                                ///< current ping time in milliseconds
    bool m_bHadSuccessfulResponse;                              ///< server has responded successfully in the past
    bool m_bDoNotRefresh;                                       ///< server is marked as not responding and should no longer be refreshed
    char[k_cbMaxGameServerGameDir] m_szGameDir;                 ///< current game directory
    char[k_cbMaxGameServerMapName] m_szMap;                     ///< current map
    char[k_cbMaxGameServerGameDescription] m_szGameDescription; ///< game description
    uint32 m_nAppID;                                            ///< Steam App ID of this server
    int m_nPlayers;                                             ///< total number of players currently on the server.  INCLUDES BOTS!!
    int m_nMaxPlayers;                                          ///< Maximum players that can join this server
    int m_nBotPlayers;                                          ///< Number of bots (i.e simulated players) on this server
    bool m_bPassword;                                           ///< true if this server needs a password to join
    bool m_bSecure;                                             ///< Is this server protected by VAC
    uint32 m_ulTimeLastPlayed;                                  ///< time (in unix time) when this server was last played on (for favorite/history servers)
    int m_nServerVersion;                                       ///< server version as reported to Steam
    char[k_cbMaxGameServerName] m_szServerName;
    char[k_cbMaxGameServerTags] m_szGameTags;
    CSteamID m_steamID;
}

struct MatchMakingKeyValuePair_t
{
    char[ 256 ] m_szKey;
    char[ 256 ] m_szValue;
}

struct SteamParamStringArray_t
{
    const(char)** m_ppStrings;
    int32 m_nNumStrings;
}

struct P2PSessionState_t
{
    uint8 m_bConnectionActive;      // true if we've got an active open connection
    uint8 m_bConnecting;            // true if we're currently trying to establish a connection
    uint8 m_eP2PSessionError;       // last error recorded (see enum above)
    uint8 m_bUsingRelay;            // true if it's going through a relay server (TURN)
    int32 m_nBytesQueuedForSend;
    int32 m_nPacketsQueuedForSend;
    uint32 m_nRemoteIP;             // potential IP:Port of remote host. Could be TURN server. 
    uint16 m_nRemotePort;           // Only exists for compatibility with older authentication api's
};

//-----------------------------------------------------------------------------
// Purpose: Base values for callback identifiers, each callback must
//          have a unique ID.
//-----------------------------------------------------------------------------
enum k_iSteamUserCallbacks = 100;
enum k_iSteamGameServerCallbacks = 200;
enum k_iSteamFriendsCallbacks = 300;
enum k_iSteamBillingCallbacks = 400;
enum k_iSteamMatchmakingCallbacks = 500;
enum k_iSteamContentServerCallbacks = 600;
enum k_iSteamUtilsCallbacks = 700;
enum k_iClientFriendsCallbacks = 800;
enum k_iClientUserCallbacks = 900;
enum k_iSteamAppsCallbacks = 1000;
enum k_iSteamUserStatsCallbacks = 1100;
enum k_iSteamNetworkingCallbacks = 1200;
enum k_iClientRemoteStorageCallbacks = 1300;
enum k_iClientDepotBuilderCallbacks = 1400;
enum k_iSteamGameServerItemsCallbacks = 1500;
enum k_iClientUtilsCallbacks = 1600;
enum k_iSteamGameCoordinatorCallbacks = 1700;
enum k_iSteamGameServerStatsCallbacks = 1800;
enum k_iSteam2AsyncCallbacks = 1900;
enum k_iSteamGameStatsCallbacks = 2000;
enum k_iClientHTTPCallbacks = 2100;
enum k_iClientScreenshotsCallbacks = 2200;
enum k_iSteamScreenshotsCallbacks = 2300;
enum k_iClientAudioCallbacks = 2400;
enum k_iClientUnifiedMessagesCallbacks = 2500;
enum k_iSteamStreamLauncherCallbacks = 2600;
enum k_iClientControllerCallbacks = 2700;
enum k_iSteamControllerCallbacks = 2800;
enum k_iClientParentalSettingsCallbacks = 2900;
enum k_iClientDeviceAuthCallbacks = 3000;
enum k_iClientNetworkDeviceManagerCallbacks = 3100;
enum k_iClientMusicCallbacks = 3200;
enum k_iClientRemoteClientManagerCallbacks = 3300;
enum k_iClientUGCCallbacks = 3400;
enum k_iSteamStreamClientCallbacks = 3500;
enum k_IClientProductBuilderCallbacks = 3600;
enum k_iClientShortcutsCallbacks = 3700;
enum k_iClientRemoteControlManagerCallbacks = 3800;
enum k_iSteamAppListCallbacks = 3900;
enum k_iSteamMusicCallbacks = 4000;
enum k_iSteamMusicRemoteCallbacks = 4100;
enum k_iClientVRCallbacks = 4200;
enum k_iClientReservedCallbacks = 4300;
enum k_iSteamReservedCallbacks = 4400;
enum k_iSteamHTMLSurfaceCallbacks = 4500;
enum k_iClientVideoCallbacks = 4600;
enum k_iClientInventoryCallbacks = 4700;

struct LobbyMatchList_t
{
    enum k_iCallback = k_iSteamMatchmakingCallbacks + 10;
    uint32 m_nLobbiesMatching;      // Number of lobbies that matched search criteria and we have SteamIDs for
}
struct NumberOfCurrentPlayers_t
{
    enum k_iCallback = k_iSteamUserStatsCallbacks + 7;
    uint8 m_bSuccess;           // 1 if the call was successful
    int32 m_cPlayers;           // Number of players currently playing
}

interface ISteamMatchmakingServerListResponse
{
    // Server has responded ok with updated data
    void ServerResponded( HServerListRequest hRequest, int iServer );
    
    // Server has failed to respond
    void ServerFailedToRespond( HServerListRequest hRequest, int iServer );
    
    // A list refresh you had initiated is now 100% completed
    void RefreshComplete( HServerListRequest hRequest, EMatchMakingServerResponse response );
}

interface ISteamMatchmakingPingResponse
{
    // Server has responded successfully and has updated data
    void ServerResponded( gameserveritem_t* server );
    
    // Server failed to respond to the ping request
    void ServerFailedToRespond();
}

interface ISteamMatchmakingPlayersResponse
{
    // Got data on a new player on the server -- you'll get this callback once per player
    // on the server which you have requested player data on.
    void AddPlayerToList( const(char)* pchName, int nScore, float flTimePlayed );
    
    // The server failed to respond to the request for player details
    void PlayersFailedToRespond();
    
    // The server has finished responding to the player details request 
    // (ie, you won't get anymore AddPlayerToList callbacks)
    void PlayersRefreshComplete();
}

interface ISteamMatchmakingRulesResponse
{
    // Got data on a rule on the server -- you'll get one of these per rule defined on
    // the server you are querying
    void RulesResponded( const(char)* pchRule, const(char)* pchValue );
    
    // The server failed to respond to the request for rule details
    void RulesFailedToRespond();
    
    // The server has finished responding to the rule details request 
    // (ie, you won't get anymore RulesResponded callbacks)
    void RulesRefreshComplete();
}

static immutable const(char)* STEAMAPPLIST_INTERFACE_VERSION = "STEAMAPPLIST_INTERFACE_VERSION001";
static immutable const(char)* STEAMAPPS_INTERFACE_VERSION = "STEAMAPPS_INTERFACE_VERSION007";
static immutable const(char)* STEAMAPPTICKET_INTERFACE_VERSION = "STEAMAPPTICKET_INTERFACE_VERSION001";
static immutable const(char)* STEAMCLIENT_INTERFACE_VERSION = "SteamClient017";
static immutable const(char)* STEAMCONTROLLER_INTERFACE_VERSION = "STEAMCONTROLLER_INTERFACE_VERSION";
static immutable const(char)* STEAMFRIENDS_INTERFACE_VERSION = "SteamFriends015";
static immutable const(char)* STEAMGAMECOORDINATOR_INTERFACE_VERSION = "SteamGameCoordinator001";
static immutable const(char)* STEAMGAMESERVER_INTERFACE_VERSION = "SteamGameServer012";
static immutable const(char)* STEAMGAMESERVERSTATS_INTERFACE_VERSION = "SteamGameServerStats001";
static immutable const(char)* STEAMHTMLSURFACE_INTERFACE_VERSION = "STEAMHTMLSURFACE_INTERFACE_VERSION_003";
static immutable const(char)* STEAMHTTP_INTERFACE_VERSION = "STEAMHTTP_INTERFACE_VERSION002";
static immutable const(char)* STEAMINVENTORY_INTERFACE_VERSION = "STEAMINVENTORY_INTERFACE_V001";
static immutable const(char)* STEAMMATCHMAKING_INTERFACE_VERSION = "SteamMatchMaking009";
static immutable const(char)* STEAMMATCHMAKINGSERVERS_INTERFACE_VERSION = "SteamMatchMakingServers002";
static immutable const(char)* STEAMMUSIC_INTERFACE_VERSION = "STEAMMUSIC_INTERFACE_VERSION001";
static immutable const(char)* STEAMMUSICREMOTE_INTERFACE_VERSION = "STEAMMUSICREMOTE_INTERFACE_VERSION001";
static immutable const(char)* STEAMNETWORKING_INTERFACE_VERSION = "SteamNetworking005";
static immutable const(char)* STEAMREMOTESTORAGE_INTERFACE_VERSION = "STEAMREMOTESTORAGE_INTERFACE_VERSION012";
static immutable const(char)* STEAMSCREENSHOTS_INTERFACE_VERSION = "STEAMSCREENSHOTS_INTERFACE_VERSION002";
static immutable const(char)* STEAMUGC_INTERFACE_VERSION = "STEAMUGC_INTERFACE_VERSION007";
static immutable const(char)* STEAMUNIFIEDMESSAGES_INTERFACE_VERSION = "STEAMUNIFIEDMESSAGES_INTERFACE_VERSION001";
static immutable const(char)* STEAMUSER_INTERFACE_VERSION = "SteamUser018";
static immutable const(char)* STEAMUSERSTATS_INTERFACE_VERSION = "STEAMUSERSTATS_INTERFACE_VERSION011";
static immutable const(char)* STEAMUTILS_INTERFACE_VERSION = "SteamUtils007";
static immutable const(char)* STEAMVIDEO_INTERFACE_VERSION = "STEAMVIDEO_INTERFACE_V001";
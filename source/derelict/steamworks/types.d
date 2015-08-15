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
public:
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
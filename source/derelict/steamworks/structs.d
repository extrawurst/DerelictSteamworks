module derelict.steamworks.structs;

import derelict.steamworks.enums;
import derelict.steamworks.types;
import derelict.steamworks.interfaces;

align(1):

struct FriendGameInfo_t
{
    CGameID m_gameID;
    uint32 m_unGameIP;
    uint16 m_usGamePort;
    uint16 m_usQueryPort;
    CSteamID m_steamIDLobby;
}

struct LeaderboardEntry_t
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
}

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

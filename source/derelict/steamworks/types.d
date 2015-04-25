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
alias uint64 = ulong;
alias int16 = short;
alias uint16 = ushort;
alias uint32 = uint;

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
};

align(1)struct FriendGameInfo_t
{
    CGameID m_gameID;
    uint32 m_unGameIP;
    uint16 m_usGamePort;
    uint16 m_usQueryPort;
    CSteamID m_steamIDLobby;
};

extern(C++) interface CSteamID{}
extern(C++) interface CGameID{}

extern(C++) interface ISteamUser
{
    // returns the HSteamUser this interface represents
    // this is only used internally by the API, and by a few select interfaces that support multi-user
    HSteamUser GetHSteamUser();
    
    // returns true if the Steam client current has a live connection to the Steam servers. 
    // If false, it means there is no active connection due to either a networking issue on the local machine, or the Steam server is down/busy.
    // The Steam client will automatically be trying to recreate the connection as often as possible.
    bool BLoggedOn();
    
    // returns the CSteamID of the account currently logged into the Steam client
    // a CSteamID is a unique identifier for an account, and used to differentiate users in all parts of the Steamworks API
    CSteamID GetSteamID();
    
    // Multiplayer Authentication functions
    
    // InitiateGameConnection() starts the state machine for authenticating the game client with the game server
    // It is the client portion of a three-way handshake between the client, the game server, and the steam servers
    //
    // Parameters:
    // void *pAuthBlob - a pointer to empty memory that will be filled in with the authentication token.
    // int cbMaxAuthBlob - the number of bytes of allocated memory in pBlob. Should be at least 2048 bytes.
    // CSteamID steamIDGameServer - the steamID of the game server, received from the game server by the client
    // CGameID gameID - the ID of the current game. For games without mods, this is just CGameID( <appID> )
    // uint32 unIPServer, uint16 usPortServer - the IP address of the game server
    // bool bSecure - whether or not the client thinks that the game server is reporting itself as secure (i.e. VAC is running)
    //
    // return value - returns the number of bytes written to pBlob. If the return is 0, then the buffer passed in was too small, and the call has failed
    // The contents of pBlob should then be sent to the game server, for it to use to complete the authentication process.
    int InitiateGameConnection( void *pAuthBlob, int cbMaxAuthBlob, CSteamID steamIDGameServer, uint32 unIPServer, uint16 usPortServer, bool bSecure );
    
    // notify of disconnect
    // needs to occur when the game client leaves the specified game server, needs to match with the InitiateGameConnection() call
    void TerminateGameConnection( uint32 unIPServer, uint16 usPortServer );
    
    // Legacy functions
    
    // used by only a few games to track usage events
    void TrackAppUsageEvent( CGameID gameID, int eAppUsageEvent, const char *pchExtraInfo = "" );
    
    // get the local storage folder for current Steam account to write application data, e.g. save games, configs etc.
    // this will usually be something like "C:\Progam Files\Steam\userdata\<SteamID>\<AppID>\local"
    bool GetUserDataFolder( char *pchBuffer, int cubBuffer );
    
    // Starts voice recording. Once started, use GetVoice() to get the data
    void StartVoiceRecording( );
    
    // Stops voice recording. Because people often release push-to-talk keys early, the system will keep recording for
    // a little bit after this function is called. GetVoice() should continue to be called until it returns
    // k_eVoiceResultNotRecording
    void StopVoiceRecording( );
    
    // Determine the amount of captured audio data that is available in bytes.
    // This provides both the compressed and uncompressed data. Please note that the uncompressed
    // data is not the raw feed from the microphone: data may only be available if audible 
    // levels of speech are detected.
    // nUncompressedVoiceDesiredSampleRate is necessary to know the number of bytes to return in pcbUncompressed - can be set to 0 if you don't need uncompressed (the usual case)
    // If you're upgrading from an older Steamworks API, you'll want to pass in 11025 to nUncompressedVoiceDesiredSampleRate
    EVoiceResult GetAvailableVoice( uint32 *pcbCompressed, uint32 *pcbUncompressed, uint32 nUncompressedVoiceDesiredSampleRate );
    
    // Gets the latest voice data from the microphone. Compressed data is an arbitrary format, and is meant to be handed back to 
    // DecompressVoice() for playback later as a binary blob. Uncompressed data is 16-bit, signed integer, 11025Hz PCM format.
    // Please note that the uncompressed data is not the raw feed from the microphone: data may only be available if audible 
    // levels of speech are detected, and may have passed through denoising filters, etc.
    // This function should be called as often as possible once recording has started; once per frame at least.
    // nBytesWritten is set to the number of bytes written to pDestBuffer. 
    // nUncompressedBytesWritten is set to the number of bytes written to pUncompressedDestBuffer. 
    // You must grab both compressed and uncompressed here at the same time, if you want both.
    // Matching data that is not read during this call will be thrown away.
    // GetAvailableVoice() can be used to determine how much data is actually available.
    // If you're upgrading from an older Steamworks API, you'll want to pass in 11025 to nUncompressedVoiceDesiredSampleRate
    EVoiceResult GetVoice( bool bWantCompressed, void *pDestBuffer, uint32 cbDestBufferSize, uint32 *nBytesWritten, bool bWantUncompressed, void *pUncompressedDestBuffer, uint32 cbUncompressedDestBufferSize, uint32 *nUncompressBytesWritten, uint32 nUncompressedVoiceDesiredSampleRate );
    
    // Decompresses a chunk of compressed data produced by GetVoice().
    // nBytesWritten is set to the number of bytes written to pDestBuffer unless the return value is k_EVoiceResultBufferTooSmall.
    // In that case, nBytesWritten is set to the size of the buffer required to decompress the given
    // data. The suggested buffer size for the destination buffer is 22 kilobytes.
    // The output format of the data is 16-bit signed at the requested samples per second.
    // If you're upgrading from an older Steamworks API, you'll want to pass in 11025 to nDesiredSampleRate
    EVoiceResult DecompressVoice( const void *pCompressed, uint32 cbCompressed, void *pDestBuffer, uint32 cbDestBufferSize, uint32 *nBytesWritten, uint32 nDesiredSampleRate );
    
    // This returns the frequency of the voice data as it's stored internally; calling DecompressVoice() with this size will yield the best results
    uint32 GetVoiceOptimalSampleRate();
    
    // Retrieve ticket to be sent to the entity who wishes to authenticate you. 
    // pcbTicket retrieves the length of the actual ticket.
    HAuthTicket GetAuthSessionTicket( void *pTicket, int cbMaxTicket, uint32 *pcbTicket );
    
    // Authenticate ticket from entity steamID to be sure it is valid and isnt reused
    // Registers for callbacks if the entity goes offline or cancels the ticket ( see ValidateAuthTicketResponse_t callback and EAuthSessionResponse )
    EBeginAuthSessionResult BeginAuthSession( const void *pAuthTicket, int cbAuthTicket, CSteamID steamID );
    
    // Stop tracking started by BeginAuthSession - called when no longer playing game with this entity
    void EndAuthSession( CSteamID steamID );

    // Cancel auth ticket from GetAuthSessionTicket, called when no longer playing game with the entity you gave the ticket to
    void CancelAuthTicket( HAuthTicket hAuthTicket );
    
    // After receiving a user's authentication data, and passing it to BeginAuthSession, use this function
    // to determine if the user owns downloadable content specified by the provided AppID.
    EUserHasLicenseForAppResult UserHasLicenseForApp( CSteamID steamID, AppId_t appID );
    
    // returns true if this users looks like they are behind a NAT device. Only valid once the user has connected to steam 
    // (i.e a SteamServersConnected_t has been issued) and may not catch all forms of NAT.
    bool BIsBehindNAT();
    
    // set data to be replicated to friends so that they can join your game
    // CSteamID steamIDGameServer - the steamID of the game server, received from the game server by the client
    // uint32 unIPServer, uint16 usPortServer - the IP address of the game server
    void AdvertiseGame( CSteamID steamIDGameServer, uint32 unIPServer, uint16 usPortServer );
    
    // Requests a ticket encrypted with an app specific shared key
    // pDataToInclude, cbDataToInclude will be encrypted into the ticket
    // ( This is asynchronous, you must wait for the ticket to be completed by the server )
    SteamAPICall_t RequestEncryptedAppTicket( void *pDataToInclude, int cbDataToInclude );

    // retrieve a finished ticket
    bool GetEncryptedAppTicket( void *pTicket, int cbMaxTicket, uint32 *pcbTicket );
    
    // Trading Card badges data access
    // if you only have one set of cards, the series will be 1
    // the user has can have two different badges for a series; the regular (max level 5) and the foil (max level 1)
    int GetGameBadgeLevel( int nSeries, bool bFoil );
    
    // gets the Steam Level of the user, as shown on their profile
    int GetPlayerSteamLevel();
    
    // Requests a URL which authenticates an in-game browser for store check-out,
    // and then redirects to the specified URL. As long as the in-game browser
    // accepts and handles session cookies, Steam microtransaction checkout pages
    // will automatically recognize the user instead of presenting a login page.
    // The result of this API call will be a StoreAuthURLResponse_t callback.
    // NOTE: The URL has a very short lifetime to prevent history-snooping attacks,
    // so you should only call this API when you are about to launch the browser,
    // or else immediately navigate to the result URL using a hidden browser window.
    // NOTE 2: The resulting authorization cookie has an expiration time of one day,
    // so it would be a good idea to request and visit a new auth URL every 12 hours.
    SteamAPICall_t RequestStoreAuthURL( const char *pchRedirectURL );
    
version(_PS3){
    // Initiates PS3 Logon request using just PSN ticket.  
    //
    // PARAMS: bInteractive - If set tells Steam to go ahead and show the PS3 NetStart dialog if needed to
    // prompt the user for network setup/PSN logon before initiating the Steam side of the logon.
    //
    // Listen for SteamServersConnected_t or SteamServerConnectFailure_t for status.  SteamServerConnectFailure_t
    // may return with EResult k_EResultExternalAccountUnlinked if the PSN account is unknown to Steam.  You should
    // then call LogOnAndLinkSteamAccountToPSN() after prompting the user for credentials to establish a link. 
    // Future calls to LogOn() after the one time link call should succeed as long as the user is connected to PSN.
    void LogOn( bool bInteractive ) = 0;
    
    // Initiates a request to logon with a specific steam username/password and create a PSN account link at 
    // the same time.  Should call this only if LogOn() has failed and indicated the PSN account is unlinked.
    //
    // PARAMS: bInteractive - If set tells Steam to go ahead and show the PS3 NetStart dialog if needed to
    // prompt the user for network setup/PSN logon before initiating the Steam side of the logon.  pchUserName 
    // should be the users Steam username, and pchPassword should be the users Steam password.
    // 
    // Listen for SteamServersConnected_t or SteamServerConnectFailure_t for status.  SteamServerConnectFailure_t
    // may return with EResult k_EResultOtherAccountAlreadyLinked if already linked to another account. 
    void LogOnAndLinkSteamAccountToPSN( bool bInteractive, const char *pchUserName, const char *pchPassword ) = 0;
    
    // Final logon option for PS3, this logs into an existing account if already linked, but if not already linked
    // creates a new account using the info in the PSN ticket to generate a unique account name.  The new account is
    // then linked to the PSN ticket.  This is the faster option for new users who don't have an existing Steam account
    // to get into multiplayer.
    //
    // PARAMS: bInteractive - If set tells Steam to go ahead and show the PS3 NetStart dialog if needed to
    // prompt the user for network setup/PSN logon before initiating the Steam side of the logon.
    void LogOnAndCreateNewSteamAccountIfNeeded( bool bInteractive ) = 0;
    
    // Returns a special SteamID that represents the user's PSN information. Can be used to query the user's PSN avatar,
    // online name, etc. through the standard Steamworks interfaces.
    CSteamID GetConsoleSteamID() = 0;
}
}

extern(C++) interface ISteamFriends
{
    // returns the local players name - guaranteed to not be NULL.
    // this is the same name as on the users community profile page
    // this is stored in UTF-8 format
    // like all the other interface functions that return a char *, it's important that this pointer is not saved
    // off; it will eventually be free'd or re-allocated
    const char *GetPersonaName();
    
    // Sets the player name, stores it on the server and publishes the changes to all friends who are online.
    // Changes take place locally immediately, and a PersonaStateChange_t is posted, presuming success.
    //
    // The final results are available through the return value SteamAPICall_t, using SetPersonaNameResponse_t.
    //
    // If the name change fails to happen on the server, then an additional global PersonaStateChange_t will be posted
    // to change the name back, in addition to the SetPersonaNameResponse_t callback.
    SteamAPICall_t SetPersonaName( const char *pchPersonaName );
    
    // gets the status of the current user
    EPersonaState GetPersonaState();
    
    // friend iteration
    // takes a set of k_EFriendFlags, and returns the number of users the client knows about who meet that criteria
    // then GetFriendByIndex() can then be used to return the id's of each of those users
    int GetFriendCount( EFriendFlags iFriendFlags );
    
    // returns the steamID of a user
    // iFriend is a index of range [0, GetFriendCount())
    // iFriendsFlags must be the same value as used in GetFriendCount()
    // the returned CSteamID can then be used by all the functions below to access details about the user
    CSteamID GetFriendByIndex( int iFriend, int iFriendFlags );
    
    // returns a relationship to a user
    EFriendRelationship GetFriendRelationship( CSteamID steamIDFriend );
    
    // returns the current status of the specified user
    // this will only be known by the local user if steamIDFriend is in their friends list; on the same game server; in a chat room or lobby; or in a small group with the local user
    EPersonaState GetFriendPersonaState( CSteamID steamIDFriend );
    
    // returns the name another user - guaranteed to not be NULL.
    // same rules as GetFriendPersonaState() apply as to whether or not the user knowns the name of the other user
    // note that on first joining a lobby, chat room or game server the local user will not known the name of the other users automatically; that information will arrive asyncronously
    // 
    const char *GetFriendPersonaName( CSteamID steamIDFriend );
    
    // returns true if the friend is actually in a game, and fills in pFriendGameInfo with an extra details 
    bool GetFriendGamePlayed( CSteamID steamIDFriend, /+OUT_STRUCT()+/ FriendGameInfo_t *pFriendGameInfo );
    // accesses old friends names - returns an empty string when their are no more items in the history
    const char *GetFriendPersonaNameHistory( CSteamID steamIDFriend, int iPersonaName );
    // friends steam level
    int GetFriendSteamLevel( CSteamID steamIDFriend );
    
    // Returns nickname the current user has set for the specified player. Returns NULL if the no nickname has been set for that player.
    const char* GetPlayerNickname( CSteamID steamIDPlayer );
    
    // friend grouping (tag) apis
    // returns the number of friends groups
    int GetFriendsGroupCount();
    // returns the friends group ID for the given index (invalid indices return k_FriendsGroupID_Invalid)
    FriendsGroupID_t GetFriendsGroupIDByIndex( int iFG );
    // returns the name for the given friends group (NULL in the case of invalid friends group IDs)
    const char *GetFriendsGroupName( FriendsGroupID_t friendsGroupID );
    // returns the number of members in a given friends group
    int GetFriendsGroupMembersCount( FriendsGroupID_t friendsGroupID );
    // gets up to nMembersCount members of the given friends group, if fewer exist than requested those positions' SteamIDs will be invalid
    void GetFriendsGroupMembersList( FriendsGroupID_t friendsGroupID, /+OUT_ARRAY_CALL(nMembersCount, GetFriendsGroupMembersCount, friendsGroupID )+/ CSteamID *pOutSteamIDMembers, int nMembersCount );
    
    // returns true if the specified user meets any of the criteria specified in iFriendFlags
    // iFriendFlags can be the union (binary or, |) of one or more k_EFriendFlags values
    bool HasFriend( CSteamID steamIDFriend, int iFriendFlags );
    
    // clan (group) iteration and access functions
    int GetClanCount();
    CSteamID GetClanByIndex( int iClan );
    const char *GetClanName( CSteamID steamIDClan );
    const char *GetClanTag( CSteamID steamIDClan );
    // returns the most recent information we have about what's happening in a clan
    bool GetClanActivityCounts( CSteamID steamIDClan, int *pnOnline, int *pnInGame, int *pnChatting );
    // for clans a user is a member of, they will have reasonably up-to-date information, but for others you'll have to download the info to have the latest
    SteamAPICall_t DownloadClanActivityCounts( /+ARRAY_COUNT(cClansToRequest)+/ CSteamID *psteamIDClans, int cClansToRequest );
    
    // iterators for getting users in a chat room, lobby, game server or clan
    // note that large clans that cannot be iterated by the local user
    // note that the current user must be in a lobby to retrieve CSteamIDs of other users in that lobby
    // steamIDSource can be the steamID of a group, game server, lobby or chat room
    int GetFriendCountFromSource( CSteamID steamIDSource );
    CSteamID GetFriendFromSourceByIndex( CSteamID steamIDSource, int iFriend );
    
    // returns true if the local user can see that steamIDUser is a member or in steamIDSource
    bool IsUserInSource( CSteamID steamIDUser, CSteamID steamIDSource );
    
    // User is in a game pressing the talk button (will suppress the microphone for all voice comms from the Steam friends UI)
    void SetInGameVoiceSpeaking( CSteamID steamIDUser, bool bSpeaking );
    
    // activates the game overlay, with an optional dialog to open 
    // valid options are "Friends", "Community", "Players", "Settings", "OfficialGameGroup", "Stats", "Achievements"
    void ActivateGameOverlay( const char *pchDialog );
    
    // activates game overlay to a specific place
    // valid options are
    //      "steamid" - opens the overlay web browser to the specified user or groups profile
    //      "chat" - opens a chat window to the specified user, or joins the group chat 
    //      "jointrade" - opens a window to a Steam Trading session that was started with the ISteamEconomy/StartTrade Web API
    //      "stats" - opens the overlay web browser to the specified user's stats
    //      "achievements" - opens the overlay web browser to the specified user's achievements
    //      "friendadd" - opens the overlay in minimal mode prompting the user to add the target user as a friend
    //      "friendremove" - opens the overlay in minimal mode prompting the user to remove the target friend
    //      "friendrequestaccept" - opens the overlay in minimal mode prompting the user to accept an incoming friend invite
    //      "friendrequestignore" - opens the overlay in minimal mode prompting the user to ignore an incoming friend invite
    void ActivateGameOverlayToUser( const char *pchDialog, CSteamID steamID );
    
    // activates game overlay web browser directly to the specified URL
    // full address with protocol type is required, e.g. http://www.steamgames.com/
    void ActivateGameOverlayToWebPage( const char *pchURL );
    
    // activates game overlay to store page for app
    void ActivateGameOverlayToStore( AppId_t nAppID, EOverlayToStoreFlag eFlag );
    
    // Mark a target user as 'played with'. This is a client-side only feature that requires that the calling user is 
    // in game 
    void SetPlayedWith( CSteamID steamIDUserPlayedWith );
    
    // activates game overlay to open the invite dialog. Invitations will be sent for the provided lobby.
    void ActivateGameOverlayInviteDialog( CSteamID steamIDLobby );
    
    // gets the small (32x32) avatar of the current user, which is a handle to be used in IClientUtils::GetImageRGBA(), or 0 if none set
    int GetSmallFriendAvatar( CSteamID steamIDFriend );
    
    // gets the medium (64x64) avatar of the current user, which is a handle to be used in IClientUtils::GetImageRGBA(), or 0 if none set
    int GetMediumFriendAvatar( CSteamID steamIDFriend );
    
    // gets the large (184x184) avatar of the current user, which is a handle to be used in IClientUtils::GetImageRGBA(), or 0 if none set
    // returns -1 if this image has yet to be loaded, in this case wait for a AvatarImageLoaded_t callback and then call this again
    int GetLargeFriendAvatar( CSteamID steamIDFriend );
    
    // requests information about a user - persona name & avatar
    // if bRequireNameOnly is set, then the avatar of a user isn't downloaded 
    // - it's a lot slower to download avatars and churns the local cache, so if you don't need avatars, don't request them
    // if returns true, it means that data is being requested, and a PersonaStateChanged_t callback will be posted when it's retrieved
    // if returns false, it means that we already have all the details about that user, and functions can be called immediately
    bool RequestUserInformation( CSteamID steamIDUser, bool bRequireNameOnly );
    
    // requests information about a clan officer list
    // when complete, data is returned in ClanOfficerListResponse_t call result
    // this makes available the calls below
    // you can only ask about clans that a user is a member of
    // note that this won't download avatars automatically; if you get an officer,
    // and no avatar image is available, call RequestUserInformation( steamID, false ) to download the avatar
    SteamAPICall_t RequestClanOfficerList( CSteamID steamIDClan );
    
    // iteration of clan officers - can only be done when a RequestClanOfficerList() call has completed
    
    // returns the steamID of the clan owner
    CSteamID GetClanOwner( CSteamID steamIDClan );
    // returns the number of officers in a clan (including the owner)
    int GetClanOfficerCount( CSteamID steamIDClan );
    // returns the steamID of a clan officer, by index, of range [0,GetClanOfficerCount)
    CSteamID GetClanOfficerByIndex( CSteamID steamIDClan, int iOfficer );
    // if current user is chat restricted, he can't send or receive any text/voice chat messages.
    // the user can't see custom avatars. But the user can be online and send/recv game invites.
    // a chat restricted user can't add friends or join any groups.
    uint32 GetUserRestrictions();
    
    // Rich Presence data is automatically shared between friends who are in the same game
    // Each user has a set of Key/Value pairs
    // Up to 20 different keys can be set
    // There are two magic keys:
    //      "status"  - a UTF-8 string that will show up in the 'view game info' dialog in the Steam friends list
    //      "connect" - a UTF-8 string that contains the command-line for how a friend can connect to a game
    // GetFriendRichPresence() returns an empty string "" if no value is set
    // SetRichPresence() to a NULL or an empty string deletes the key
    // You can iterate the current set of keys for a friend with GetFriendRichPresenceKeyCount()
    // and GetFriendRichPresenceKeyByIndex() (typically only used for debugging)
    bool SetRichPresence( const char *pchKey, const char *pchValue );
    void ClearRichPresence();
    const char *GetFriendRichPresence( CSteamID steamIDFriend, const char *pchKey );
    int GetFriendRichPresenceKeyCount( CSteamID steamIDFriend );
    const char *GetFriendRichPresenceKeyByIndex( CSteamID steamIDFriend, int iKey );
    // Requests rich presence for a specific user.
    void RequestFriendRichPresence( CSteamID steamIDFriend );
    
    // rich invite support
    // if the target accepts the invite, the pchConnectString gets added to the command-line for launching the game
    // if the game is already running, a GameRichPresenceJoinRequested_t callback is posted containing the connect string
    // invites can only be sent to friends
    bool InviteUserToGame( CSteamID steamIDFriend, const char *pchConnectString );
    
    // recently-played-with friends iteration
    // this iterates the entire list of users recently played with, across games
    // GetFriendCoplayTime() returns as a unix time
    int GetCoplayFriendCount();
    CSteamID GetCoplayFriend( int iCoplayFriend );
    int GetFriendCoplayTime( CSteamID steamIDFriend );
    AppId_t GetFriendCoplayGame( CSteamID steamIDFriend );
    
    // chat interface for games
    // this allows in-game access to group (clan) chats from in the game
    // the behavior is somewhat sophisticated, because the user may or may not be already in the group chat from outside the game or in the overlay
    // use ActivateGameOverlayToUser( "chat", steamIDClan ) to open the in-game overlay version of the chat
    SteamAPICall_t JoinClanChatRoom( CSteamID steamIDClan );
    bool LeaveClanChatRoom( CSteamID steamIDClan );
    int GetClanChatMemberCount( CSteamID steamIDClan );
    CSteamID GetChatMemberByIndex( CSteamID steamIDClan, int iUser );
    bool SendClanChatMessage( CSteamID steamIDClanChat, const char *pchText );
    int GetClanChatMessage( CSteamID steamIDClanChat, int iMessage, void *prgchText, int cchTextMax, EChatEntryType *peChatEntryType, /+OUT_STRUCT()+/ CSteamID *psteamidChatter );
    bool IsClanChatAdmin( CSteamID steamIDClanChat, CSteamID steamIDUser );
    
    // interact with the Steam (game overlay / desktop)
    bool IsClanChatWindowOpenInSteam( CSteamID steamIDClanChat );
    bool OpenClanChatWindowInSteam( CSteamID steamIDClanChat );
    bool CloseClanChatWindowInSteam( CSteamID steamIDClanChat );
    
    // peer-to-peer chat interception
    // this is so you can show P2P chats inline in the game
    bool SetListenForFriendsMessages( bool bInterceptEnabled );
    bool ReplyToFriendMessage( CSteamID steamIDFriend, const char *pchMsgToSend );
    int GetFriendMessage( CSteamID steamIDFriend, int iMessageID, void *pvData, int cubData, EChatEntryType *peChatEntryType );
    
    // following apis
    SteamAPICall_t GetFollowerCount( CSteamID steamID );
    SteamAPICall_t IsFollowing( CSteamID steamID );
    SteamAPICall_t EnumerateFollowingList( uint32 unStartIndex );
}
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
import derelict.steamworks.enums;
import derelict.steamworks.structs;

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
alias AppId_t = uint32;

extern(C) nothrow 
{
    alias SteamAPIWarningMessageHook_t = void function(int, const char *);
    alias SteamAPI_PostAPIResultInProcess_t = void function(SteamAPICall_t callHandle, void *, uint32 unCallbackSize, int iCallbackNum);
    alias SteamAPI_CheckCallbackRegistered_t = uint32 function( int iCallbackNum );
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
struct ISteamUser{}
struct ISteamFriends{}

static immutable int k_cbMaxGameServerGameDir = 32;
static immutable int k_cbMaxGameServerMapName = 32;
static immutable int k_cbMaxGameServerGameDescription = 64;
static immutable int k_cbMaxGameServerName = 64;
static immutable int k_cbMaxGameServerTags = 128;
static immutable int k_cbMaxGameServerGameData = 2048;

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

static immutable uint32 k_cchPublishedDocumentTitleMax = 128 + 1;
static immutable uint32 k_cchPublishedDocumentDescriptionMax = 8000;
static immutable uint32 k_cchPublishedDocumentChangeDescriptionMax = 8000;
static immutable uint32 k_unEnumeratePublishedFilesMaxResults = 50;
static immutable uint32 k_cchTagListMax = 1024 + 1;
static immutable uint32 k_cchFilenameMax = 260;
static immutable uint32 k_cchPublishedFileURLMax = 256;
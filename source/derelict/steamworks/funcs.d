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
module derelict.steamworks.funcs;

private
{
    import derelict.util.system;
    import derelict.steamworks.types;
    import derelict.steamworks.interfaces;
}

@nogc nothrow extern(C)
{
    alias da_SteamAPI_Init = bool function();
    alias da_SteamAPI_Shutdown = void function();
    alias da_SteamAPI_IsSteamRunning = bool function();
    alias da_SteamClient = ISteamClient* function();

    alias da_SteamAPI_ISteamClient_CreateSteamPipe = HSteamPipe function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamClient_BReleaseSteamPipe = bool function(intptr_t instancePtr, HSteamPipe hSteamPipe);
    alias da_SteamAPI_ISteamClient_ConnectToGlobalUser = HSteamUser function(intptr_t instancePtr, HSteamPipe hSteamPipe);
    alias da_SteamAPI_ISteamClient_CreateLocalUser = HSteamUser function(intptr_t instancePtr, HSteamPipe * phSteamPipe, EAccountType eAccountType);
    alias da_SteamAPI_ISteamClient_ReleaseUser = void function(intptr_t instancePtr, HSteamPipe hSteamPipe, HSteamUser hUser);
    alias da_SteamAPI_ISteamClient_GetISteamUser = ISteamUser* function(intptr_t instancePtr, HSteamUser hSteamUser, HSteamPipe hSteamPipe, const(char)* pchVersion);
    alias da_SteamAPI_ISteamClient_GetISteamGameServer = ISteamGameServer * function(intptr_t instancePtr, HSteamUser hSteamUser, HSteamPipe hSteamPipe, const(char)* pchVersion);
    alias da_SteamAPI_ISteamClient_SetLocalIPBinding = void function(intptr_t instancePtr, uint32 unIP, uint16 usPort);
    alias da_SteamAPI_ISteamClient_GetISteamFriends = ISteamFriends * function(intptr_t instancePtr, HSteamUser hSteamUser, HSteamPipe hSteamPipe, const(char)* pchVersion);
    alias da_SteamAPI_ISteamClient_GetISteamUtils = ISteamUtils * function(intptr_t instancePtr, HSteamPipe hSteamPipe, const(char)* pchVersion);
    alias da_SteamAPI_ISteamClient_GetISteamMatchmaking = ISteamMatchmaking * function(intptr_t instancePtr, HSteamUser hSteamUser, HSteamPipe hSteamPipe, const(char)* pchVersion);
    alias da_SteamAPI_ISteamClient_GetISteamMatchmakingServers = ISteamMatchmakingServers * function(intptr_t instancePtr, HSteamUser hSteamUser, HSteamPipe hSteamPipe, const(char)* pchVersion);
    alias da_SteamAPI_ISteamClient_GetISteamGenericInterface = void * function(intptr_t instancePtr, HSteamUser hSteamUser, HSteamPipe hSteamPipe, const(char)* pchVersion);
    alias da_SteamAPI_ISteamClient_GetISteamUserStats = ISteamUserStats * function(intptr_t instancePtr, HSteamUser hSteamUser, HSteamPipe hSteamPipe, const(char)* pchVersion);
    alias da_SteamAPI_ISteamClient_GetISteamGameServerStats = ISteamGameServerStats * function(intptr_t instancePtr, HSteamUser hSteamuser, HSteamPipe hSteamPipe, const(char)* pchVersion);
    alias da_SteamAPI_ISteamClient_GetISteamApps = ISteamApps * function(intptr_t instancePtr, HSteamUser hSteamUser, HSteamPipe hSteamPipe, const(char)* pchVersion);
    alias da_SteamAPI_ISteamClient_GetISteamNetworking = ISteamNetworking * function(intptr_t instancePtr, HSteamUser hSteamUser, HSteamPipe hSteamPipe, const(char)* pchVersion);
    alias da_SteamAPI_ISteamClient_GetISteamRemoteStorage = ISteamRemoteStorage * function(intptr_t instancePtr, HSteamUser hSteamuser, HSteamPipe hSteamPipe, const(char)* pchVersion);
    alias da_SteamAPI_ISteamClient_GetISteamScreenshots = ISteamScreenshots * function(intptr_t instancePtr, HSteamUser hSteamuser, HSteamPipe hSteamPipe, const(char)* pchVersion);
    alias da_SteamAPI_ISteamClient_RunFrame = void function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamClient_GetIPCCallCount = uint32 function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamClient_SetWarningMessageHook = void function(intptr_t instancePtr, SteamAPIWarningMessageHook_t pFunction);
    alias da_SteamAPI_ISteamClient_BShutdownIfAllPipesClosed = bool function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamClient_GetISteamHTTP = ISteamHTTP * function(intptr_t instancePtr, HSteamUser hSteamuser, HSteamPipe hSteamPipe, const(char)* pchVersion);
    alias da_SteamAPI_ISteamClient_GetISteamUnifiedMessages = ISteamUnifiedMessages * function(intptr_t instancePtr, HSteamUser hSteamuser, HSteamPipe hSteamPipe, const(char)* pchVersion);
    alias da_SteamAPI_ISteamClient_GetISteamController = ISteamController * function(intptr_t instancePtr, HSteamUser hSteamUser, HSteamPipe hSteamPipe, const(char)* pchVersion);
    alias da_SteamAPI_ISteamClient_GetISteamUGC = ISteamUGC * function(intptr_t instancePtr, HSteamUser hSteamUser, HSteamPipe hSteamPipe, const(char)* pchVersion);
    alias da_SteamAPI_ISteamClient_GetISteamAppList = ISteamAppList * function(intptr_t instancePtr, HSteamUser hSteamUser, HSteamPipe hSteamPipe, const(char)* pchVersion);
    alias da_SteamAPI_ISteamClient_GetISteamMusic = ISteamMusic * function(intptr_t instancePtr, HSteamUser hSteamuser, HSteamPipe hSteamPipe, const(char)* pchVersion);
    alias da_SteamAPI_ISteamClient_GetISteamMusicRemote = ISteamMusicRemote * function(intptr_t instancePtr, HSteamUser hSteamuser, HSteamPipe hSteamPipe, const(char)* pchVersion);
    alias da_SteamAPI_ISteamClient_GetISteamHTMLSurface = ISteamHTMLSurface * function(intptr_t instancePtr, HSteamUser hSteamuser, HSteamPipe hSteamPipe, const(char)* pchVersion);
    alias da_SteamAPI_ISteamClient_Set_SteamAPI_CPostAPIResultInProcess = void function(intptr_t instancePtr, SteamAPI_PostAPIResultInProcess_t func);
    alias da_SteamAPI_ISteamClient_Remove_SteamAPI_CPostAPIResultInProcess = void function(intptr_t instancePtr, SteamAPI_PostAPIResultInProcess_t func);
    alias da_SteamAPI_ISteamClient_Set_SteamAPI_CCheckCallbackRegisteredInProcess = void function(intptr_t instancePtr, SteamAPI_CheckCallbackRegistered_t func);
    alias da_SteamAPI_ISteamClient_GetISteamInventory = ISteamInventory * function(intptr_t instancePtr, HSteamUser hSteamuser, HSteamPipe hSteamPipe, const(char)* pchVersion);
    alias da_SteamAPI_ISteamClient_GetISteamVideo = ISteamVideo * function(intptr_t instancePtr, HSteamUser hSteamuser, HSteamPipe hSteamPipe, const(char)* pchVersion);

    alias da_SteamAPI_ISteamUser_GetHSteamUser = HSteamUser function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamUser_BLoggedOn = bool function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamUser_GetSteamID = uint64 function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamUser_InitiateGameConnection = int function(intptr_t instancePtr, void * pAuthBlob, int cbMaxAuthBlob, CSteamID steamIDGameServer, uint32 unIPServer, uint16 usPortServer, bool bSecure);
    alias da_SteamAPI_ISteamUser_TerminateGameConnection = void function(intptr_t instancePtr, uint32 unIPServer, uint16 usPortServer);
    alias da_SteamAPI_ISteamUser_TrackAppUsageEvent = void function(intptr_t instancePtr, CGameID gameID, int eAppUsageEvent, const(char)* pchExtraInfo);
    alias da_SteamAPI_ISteamUser_GetUserDataFolder = bool function(intptr_t instancePtr, char * pchBuffer, int cubBuffer);
    alias da_SteamAPI_ISteamUser_StartVoiceRecording = void function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamUser_StopVoiceRecording = void function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamUser_GetAvailableVoice = EVoiceResult function(intptr_t instancePtr, uint32 * pcbCompressed, uint32 * pcbUncompressed, uint32 nUncompressedVoiceDesiredSampleRate);
    alias da_SteamAPI_ISteamUser_GetVoice = EVoiceResult function(intptr_t instancePtr, bool bWantCompressed, void * pDestBuffer, uint32 cbDestBufferSize, uint32 * nBytesWritten, bool bWantUncompressed, void * pUncompressedDestBuffer, uint32 cbUncompressedDestBufferSize, uint32 * nUncompressBytesWritten, uint32 nUncompressedVoiceDesiredSampleRate);
    alias da_SteamAPI_ISteamUser_DecompressVoice = EVoiceResult function(intptr_t instancePtr, const void * pCompressed, uint32 cbCompressed, void * pDestBuffer, uint32 cbDestBufferSize, uint32 * nBytesWritten, uint32 nDesiredSampleRate);
    alias da_SteamAPI_ISteamUser_GetVoiceOptimalSampleRate = uint32 function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamUser_GetAuthSessionTicket = HAuthTicket function(intptr_t instancePtr, void * pTicket, int cbMaxTicket, uint32 * pcbTicket);
    alias da_SteamAPI_ISteamUser_BeginAuthSession = EBeginAuthSessionResult function(intptr_t instancePtr, const void * pAuthTicket, int cbAuthTicket, CSteamID steamID);
    alias da_SteamAPI_ISteamUser_EndAuthSession = void function(intptr_t instancePtr, CSteamID steamID);
    alias da_SteamAPI_ISteamUser_CancelAuthTicket = void function(intptr_t instancePtr, HAuthTicket hAuthTicket);
    alias da_SteamAPI_ISteamUser_UserHasLicenseForApp = EUserHasLicenseForAppResult function(intptr_t instancePtr, CSteamID steamID, AppId_t appID);
    alias da_SteamAPI_ISteamUser_BIsBehindNAT = bool function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamUser_AdvertiseGame = void function(intptr_t instancePtr, CSteamID steamIDGameServer, uint32 unIPServer, uint16 usPortServer);
    alias da_SteamAPI_ISteamUser_RequestEncryptedAppTicket = SteamAPICall_t function(intptr_t instancePtr, void * pDataToInclude, int cbDataToInclude);
    alias da_SteamAPI_ISteamUser_GetEncryptedAppTicket = bool function(intptr_t instancePtr, void * pTicket, int cbMaxTicket, uint32 * pcbTicket);
    alias da_SteamAPI_ISteamUser_GetGameBadgeLevel = int function(intptr_t instancePtr, int nSeries, bool bFoil);
    alias da_SteamAPI_ISteamUser_GetPlayerSteamLevel = int function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamUser_RequestStoreAuthURL = SteamAPICall_t function(intptr_t instancePtr, const(char)* pchRedirectURL);

    alias da_SteamAPI_ISteamFriends_GetPersonaName = const(char)* function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamFriends_SetPersonaName = SteamAPICall_t function(intptr_t instancePtr, const(char)* pchPersonaName);
    alias da_SteamAPI_ISteamFriends_GetPersonaState = EPersonaState function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamFriends_GetFriendCount = int function(intptr_t instancePtr, int iFriendFlags);
    alias da_SteamAPI_ISteamFriends_GetFriendByIndex = uint64 function(intptr_t instancePtr, int iFriend, int iFriendFlags);
    alias da_SteamAPI_ISteamFriends_GetFriendRelationship = EFriendRelationship function(intptr_t instancePtr, CSteamID steamIDFriend);
    alias da_SteamAPI_ISteamFriends_GetFriendPersonaState = EPersonaState function(intptr_t instancePtr, CSteamID steamIDFriend);
    alias da_SteamAPI_ISteamFriends_GetFriendPersonaName = const(char)* function(intptr_t instancePtr, CSteamID steamIDFriend);
    alias da_SteamAPI_ISteamFriends_GetFriendGamePlayed = bool function(intptr_t instancePtr, CSteamID steamIDFriend, FriendGameInfo_t * pFriendGameInfo);
    alias da_SteamAPI_ISteamFriends_GetFriendPersonaNameHistory = const(char)* function(intptr_t instancePtr, CSteamID steamIDFriend, int iPersonaName);
    alias da_SteamAPI_ISteamFriends_GetFriendSteamLevel = int function(intptr_t instancePtr, CSteamID steamIDFriend);
    alias da_SteamAPI_ISteamFriends_GetPlayerNickname = const(char)* function(intptr_t instancePtr, CSteamID steamIDPlayer);
    alias da_SteamAPI_ISteamFriends_GetFriendsGroupCount = int function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamFriends_GetFriendsGroupIDByIndex = FriendsGroupID_t function(intptr_t instancePtr, int iFG);
    alias da_SteamAPI_ISteamFriends_GetFriendsGroupName = const(char)* function(intptr_t instancePtr, FriendsGroupID_t friendsGroupID);
    alias da_SteamAPI_ISteamFriends_GetFriendsGroupMembersCount = int function(intptr_t instancePtr, FriendsGroupID_t friendsGroupID);
    alias da_SteamAPI_ISteamFriends_GetFriendsGroupMembersList = void function(intptr_t instancePtr, FriendsGroupID_t friendsGroupID, CSteamID * pOutSteamIDMembers, int nMembersCount);
    alias da_SteamAPI_ISteamFriends_HasFriend = bool function(intptr_t instancePtr, CSteamID steamIDFriend, int iFriendFlags);
    alias da_SteamAPI_ISteamFriends_GetClanCount = int function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamFriends_GetClanByIndex = uint64 function(intptr_t instancePtr, int iClan);
    alias da_SteamAPI_ISteamFriends_GetClanName = const(char)* function(intptr_t instancePtr, CSteamID steamIDClan);
    alias da_SteamAPI_ISteamFriends_GetClanTag = const(char)* function(intptr_t instancePtr, CSteamID steamIDClan);
    alias da_SteamAPI_ISteamFriends_GetClanActivityCounts = bool function(intptr_t instancePtr, CSteamID steamIDClan, int * pnOnline, int * pnInGame, int * pnChatting);
    alias da_SteamAPI_ISteamFriends_DownloadClanActivityCounts = SteamAPICall_t function(intptr_t instancePtr, CSteamID * psteamIDClans, int cClansToRequest);
    alias da_SteamAPI_ISteamFriends_GetFriendCountFromSource = int function(intptr_t instancePtr, CSteamID steamIDSource);
    alias da_SteamAPI_ISteamFriends_GetFriendFromSourceByIndex = uint64 function(intptr_t instancePtr, CSteamID steamIDSource, int iFriend);
    alias da_SteamAPI_ISteamFriends_IsUserInSource = bool function(intptr_t instancePtr, CSteamID steamIDUser, CSteamID steamIDSource);
    alias da_SteamAPI_ISteamFriends_SetInGameVoiceSpeaking = void function(intptr_t instancePtr, CSteamID steamIDUser, bool bSpeaking);
    alias da_SteamAPI_ISteamFriends_ActivateGameOverlay = void function(intptr_t instancePtr, const(char)* pchDialog);
    alias da_SteamAPI_ISteamFriends_ActivateGameOverlayToUser = void function(intptr_t instancePtr, const(char)* pchDialog, CSteamID steamID);
    alias da_SteamAPI_ISteamFriends_ActivateGameOverlayToWebPage = void function(intptr_t instancePtr, const(char)* pchURL);
    alias da_SteamAPI_ISteamFriends_ActivateGameOverlayToStore = void function(intptr_t instancePtr, AppId_t nAppID, EOverlayToStoreFlag eFlag);
    alias da_SteamAPI_ISteamFriends_SetPlayedWith = void function(intptr_t instancePtr, CSteamID steamIDUserPlayedWith);
    alias da_SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialog = void function(intptr_t instancePtr, CSteamID steamIDLobby);
    alias da_SteamAPI_ISteamFriends_GetSmallFriendAvatar = int function(intptr_t instancePtr, CSteamID steamIDFriend);
    alias da_SteamAPI_ISteamFriends_GetMediumFriendAvatar = int function(intptr_t instancePtr, CSteamID steamIDFriend);
    alias da_SteamAPI_ISteamFriends_GetLargeFriendAvatar = int function(intptr_t instancePtr, CSteamID steamIDFriend);
    alias da_SteamAPI_ISteamFriends_RequestUserInformation = bool function(intptr_t instancePtr, CSteamID steamIDUser, bool bRequireNameOnly);
    alias da_SteamAPI_ISteamFriends_RequestClanOfficerList = SteamAPICall_t function(intptr_t instancePtr, CSteamID steamIDClan);
    alias da_SteamAPI_ISteamFriends_GetClanOwner = uint64 function(intptr_t instancePtr, CSteamID steamIDClan);
    alias da_SteamAPI_ISteamFriends_GetClanOfficerCount = int function(intptr_t instancePtr, CSteamID steamIDClan);
    alias da_SteamAPI_ISteamFriends_GetClanOfficerByIndex = uint64 function(intptr_t instancePtr, CSteamID steamIDClan, int iOfficer);
    alias da_SteamAPI_ISteamFriends_GetUserRestrictions = uint32 function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamFriends_SetRichPresence = bool function(intptr_t instancePtr, const(char)* pchKey, const(char)* pchValue);
    alias da_SteamAPI_ISteamFriends_ClearRichPresence = void function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamFriends_GetFriendRichPresence = const(char)* function(intptr_t instancePtr, CSteamID steamIDFriend, const(char)* pchKey);
    alias da_SteamAPI_ISteamFriends_GetFriendRichPresenceKeyCount = int function(intptr_t instancePtr, CSteamID steamIDFriend);
    alias da_SteamAPI_ISteamFriends_GetFriendRichPresenceKeyByIndex = const(char)* function(intptr_t instancePtr, CSteamID steamIDFriend, int iKey);
    alias da_SteamAPI_ISteamFriends_RequestFriendRichPresence = void function(intptr_t instancePtr, CSteamID steamIDFriend);
    alias da_SteamAPI_ISteamFriends_InviteUserToGame = bool function(intptr_t instancePtr, CSteamID steamIDFriend, const(char)* pchConnectString);
    alias da_SteamAPI_ISteamFriends_GetCoplayFriendCount = int function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamFriends_GetCoplayFriend = uint64 function(intptr_t instancePtr, int iCoplayFriend);
    alias da_SteamAPI_ISteamFriends_GetFriendCoplayTime = int function(intptr_t instancePtr, CSteamID steamIDFriend);
    alias da_SteamAPI_ISteamFriends_GetFriendCoplayGame = AppId_t function(intptr_t instancePtr, CSteamID steamIDFriend);
    alias da_SteamAPI_ISteamFriends_JoinClanChatRoom = SteamAPICall_t function(intptr_t instancePtr, CSteamID steamIDClan);
    alias da_SteamAPI_ISteamFriends_LeaveClanChatRoom = bool function(intptr_t instancePtr, CSteamID steamIDClan);
    alias da_SteamAPI_ISteamFriends_GetClanChatMemberCount = int function(intptr_t instancePtr, CSteamID steamIDClan);
    alias da_SteamAPI_ISteamFriends_GetChatMemberByIndex = uint64 function(intptr_t instancePtr, CSteamID steamIDClan, int iUser);
    alias da_SteamAPI_ISteamFriends_SendClanChatMessage = bool function(intptr_t instancePtr, CSteamID steamIDClanChat, const(char)* pchText);
    alias da_SteamAPI_ISteamFriends_GetClanChatMessage = int function(intptr_t instancePtr, CSteamID steamIDClanChat, int iMessage, void * prgchText, int cchTextMax, EChatEntryType * peChatEntryType, CSteamID * psteamidChatter);
    alias da_SteamAPI_ISteamFriends_IsClanChatAdmin = bool function(intptr_t instancePtr, CSteamID steamIDClanChat, CSteamID steamIDUser);
    alias da_SteamAPI_ISteamFriends_IsClanChatWindowOpenInSteam = bool function(intptr_t instancePtr, CSteamID steamIDClanChat);
    alias da_SteamAPI_ISteamFriends_OpenClanChatWindowInSteam = bool function(intptr_t instancePtr, CSteamID steamIDClanChat);
    alias da_SteamAPI_ISteamFriends_CloseClanChatWindowInSteam = bool function(intptr_t instancePtr, CSteamID steamIDClanChat);
    alias da_SteamAPI_ISteamFriends_SetListenForFriendsMessages = bool function(intptr_t instancePtr, bool bInterceptEnabled);
    alias da_SteamAPI_ISteamFriends_ReplyToFriendMessage = bool function(intptr_t instancePtr, CSteamID steamIDFriend, const(char)* pchMsgToSend);
    alias da_SteamAPI_ISteamFriends_GetFriendMessage = int function(intptr_t instancePtr, CSteamID steamIDFriend, int iMessageID, void * pvData, int cubData, EChatEntryType * peChatEntryType);
    alias da_SteamAPI_ISteamFriends_GetFollowerCount = SteamAPICall_t function(intptr_t instancePtr, CSteamID steamID);
    alias da_SteamAPI_ISteamFriends_IsFollowing = SteamAPICall_t function(intptr_t instancePtr, CSteamID steamID);
    alias da_SteamAPI_ISteamFriends_EnumerateFollowingList = SteamAPICall_t function(intptr_t instancePtr, uint32 unStartIndex);

    alias da_SteamAPI_ISteamUtils_GetSecondsSinceAppActive = uint32 function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamUtils_GetSecondsSinceComputerActive = uint32 function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamUtils_GetConnectedUniverse = EUniverse function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamUtils_GetServerRealTime = uint32 function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamUtils_GetIPCountry = const(char)* function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamUtils_GetImageSize = bool function(intptr_t instancePtr, int iImage, uint32 * pnWidth, uint32 * pnHeight);
    alias da_SteamAPI_ISteamUtils_GetImageRGBA = bool function(intptr_t instancePtr, int iImage, uint8 * pubDest, int nDestBufferSize);
    alias da_SteamAPI_ISteamUtils_GetCSERIPPort = bool function(intptr_t instancePtr, uint32 * unIP, uint16 * usPort);
    alias da_SteamAPI_ISteamUtils_GetCurrentBatteryPower = uint8 function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamUtils_GetAppID = uint32 function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamUtils_SetOverlayNotificationPosition = void function(intptr_t instancePtr, ENotificationPosition eNotificationPosition);
    alias da_SteamAPI_ISteamUtils_IsAPICallCompleted = bool function(intptr_t instancePtr, SteamAPICall_t hSteamAPICall, bool * pbFailed);
    alias da_SteamAPI_ISteamUtils_GetAPICallFailureReason = ESteamAPICallFailure function(intptr_t instancePtr, SteamAPICall_t hSteamAPICall);
    alias da_SteamAPI_ISteamUtils_GetAPICallResult = bool function(intptr_t instancePtr, SteamAPICall_t hSteamAPICall, void * pCallback, int cubCallback, int iCallbackExpected, bool * pbFailed);
    alias da_SteamAPI_ISteamUtils_RunFrame = void function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamUtils_GetIPCCallCount = uint32 function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamUtils_SetWarningMessageHook = void function(intptr_t instancePtr, SteamAPIWarningMessageHook_t pFunction);
    alias da_SteamAPI_ISteamUtils_IsOverlayEnabled = bool function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamUtils_BOverlayNeedsPresent = bool function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamUtils_CheckFileSignature = SteamAPICall_t function(intptr_t instancePtr, const(char)* szFileName);
    alias da_SteamAPI_ISteamUtils_ShowGamepadTextInput = bool function(intptr_t instancePtr, EGamepadTextInputMode eInputMode, EGamepadTextInputLineMode eLineInputMode, const(char)* pchDescription, uint32 unCharMax, const(char)* pchExistingText);
    alias da_SteamAPI_ISteamUtils_GetEnteredGamepadTextLength = uint32 function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamUtils_GetEnteredGamepadTextInput = bool function(intptr_t instancePtr, char * pchText, uint32 cchText);
    alias da_SteamAPI_ISteamUtils_GetSteamUILanguage = const(char)* function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamUtils_IsSteamRunningInVR = bool function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamUtils_SetOverlayNotificationInset = void function(intptr_t instancePtr, int nHorizontalInset, int nVerticalInset);

    alias da_SteamAPI_ISteamMatchmaking_GetFavoriteGameCount = int function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamMatchmaking_GetFavoriteGame = bool function(intptr_t instancePtr, int iGame, AppId_t * pnAppID, uint32 * pnIP, uint16 * pnConnPort, uint16 * pnQueryPort, uint32 * punFlags, uint32 * pRTime32LastPlayedOnServer);
    alias da_SteamAPI_ISteamMatchmaking_AddFavoriteGame = int function(intptr_t instancePtr, AppId_t nAppID, uint32 nIP, uint16 nConnPort, uint16 nQueryPort, uint32 unFlags, uint32 rTime32LastPlayedOnServer);
    alias da_SteamAPI_ISteamMatchmaking_RemoveFavoriteGame = bool function(intptr_t instancePtr, AppId_t nAppID, uint32 nIP, uint16 nConnPort, uint16 nQueryPort, uint32 unFlags);
    alias da_SteamAPI_ISteamMatchmaking_RequestLobbyList = SteamAPICall_t function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamMatchmaking_AddRequestLobbyListStringFilter = void function(intptr_t instancePtr, const(char)* pchKeyToMatch, const(char)* pchValueToMatch, ELobbyComparison eComparisonType);
    alias da_SteamAPI_ISteamMatchmaking_AddRequestLobbyListNumericalFilter = void function(intptr_t instancePtr, const(char)* pchKeyToMatch, int nValueToMatch, ELobbyComparison eComparisonType);
    alias da_SteamAPI_ISteamMatchmaking_AddRequestLobbyListNearValueFilter = void function(intptr_t instancePtr, const(char)* pchKeyToMatch, int nValueToBeCloseTo);
    alias da_SteamAPI_ISteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable = void function(intptr_t instancePtr, int nSlotsAvailable);
    alias da_SteamAPI_ISteamMatchmaking_AddRequestLobbyListDistanceFilter = void function(intptr_t instancePtr, ELobbyDistanceFilter eLobbyDistanceFilter);
    alias da_SteamAPI_ISteamMatchmaking_AddRequestLobbyListResultCountFilter = void function(intptr_t instancePtr, int cMaxResults);
    alias da_SteamAPI_ISteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter = void function(intptr_t instancePtr, CSteamID steamIDLobby);
    alias da_SteamAPI_ISteamMatchmaking_GetLobbyByIndex = uint64 function(intptr_t instancePtr, int iLobby);
    alias da_SteamAPI_ISteamMatchmaking_CreateLobby = SteamAPICall_t function(intptr_t instancePtr, ELobbyType eLobbyType, int cMaxMembers);
    alias da_SteamAPI_ISteamMatchmaking_JoinLobby = SteamAPICall_t function(intptr_t instancePtr, CSteamID steamIDLobby);
    alias da_SteamAPI_ISteamMatchmaking_LeaveLobby = void function(intptr_t instancePtr, CSteamID steamIDLobby);
    alias da_SteamAPI_ISteamMatchmaking_InviteUserToLobby = bool function(intptr_t instancePtr, CSteamID steamIDLobby, CSteamID steamIDInvitee);
    alias da_SteamAPI_ISteamMatchmaking_GetNumLobbyMembers = int function(intptr_t instancePtr, CSteamID steamIDLobby);
    alias da_SteamAPI_ISteamMatchmaking_GetLobbyMemberByIndex = uint64 function(intptr_t instancePtr, CSteamID steamIDLobby, int iMember);
    alias da_SteamAPI_ISteamMatchmaking_GetLobbyData = const(char)* function(intptr_t instancePtr, CSteamID steamIDLobby, const(char)* pchKey);
    alias da_SteamAPI_ISteamMatchmaking_SetLobbyData = bool function(intptr_t instancePtr, CSteamID steamIDLobby, const(char)* pchKey, const(char)* pchValue);
    alias da_SteamAPI_ISteamMatchmaking_GetLobbyDataCount = int function(intptr_t instancePtr, CSteamID steamIDLobby);
    alias da_SteamAPI_ISteamMatchmaking_GetLobbyDataByIndex = bool function(intptr_t instancePtr, CSteamID steamIDLobby, int iLobbyData, char * pchKey, int cchKeyBufferSize, char * pchValue, int cchValueBufferSize);
    alias da_SteamAPI_ISteamMatchmaking_DeleteLobbyData = bool function(intptr_t instancePtr, CSteamID steamIDLobby, const(char)* pchKey);
    alias da_SteamAPI_ISteamMatchmaking_GetLobbyMemberData = const(char)* function(intptr_t instancePtr, CSteamID steamIDLobby, CSteamID steamIDUser, const(char)* pchKey);
    alias da_SteamAPI_ISteamMatchmaking_SetLobbyMemberData = void function(intptr_t instancePtr, CSteamID steamIDLobby, const(char)* pchKey, const(char)* pchValue);
    alias da_SteamAPI_ISteamMatchmaking_SendLobbyChatMsg = bool function(intptr_t instancePtr, CSteamID steamIDLobby, const void * pvMsgBody, int cubMsgBody);
    alias da_SteamAPI_ISteamMatchmaking_GetLobbyChatEntry = int function(intptr_t instancePtr, CSteamID steamIDLobby, int iChatID, CSteamID * pSteamIDUser, void * pvData, int cubData, EChatEntryType * peChatEntryType);
    alias da_SteamAPI_ISteamMatchmaking_RequestLobbyData = bool function(intptr_t instancePtr, CSteamID steamIDLobby);
    alias da_SteamAPI_ISteamMatchmaking_SetLobbyGameServer = void function(intptr_t instancePtr, CSteamID steamIDLobby, uint32 unGameServerIP, uint16 unGameServerPort, CSteamID steamIDGameServer);
    alias da_SteamAPI_ISteamMatchmaking_GetLobbyGameServer = bool function(intptr_t instancePtr, CSteamID steamIDLobby, uint32 * punGameServerIP, uint16 * punGameServerPort, CSteamID * psteamIDGameServer);
    alias da_SteamAPI_ISteamMatchmaking_SetLobbyMemberLimit = bool function(intptr_t instancePtr, CSteamID steamIDLobby, int cMaxMembers);
    alias da_SteamAPI_ISteamMatchmaking_GetLobbyMemberLimit = int function(intptr_t instancePtr, CSteamID steamIDLobby);
    alias da_SteamAPI_ISteamMatchmaking_SetLobbyType = bool function(intptr_t instancePtr, CSteamID steamIDLobby, ELobbyType eLobbyType);
    alias da_SteamAPI_ISteamMatchmaking_SetLobbyJoinable = bool function(intptr_t instancePtr, CSteamID steamIDLobby, bool bLobbyJoinable);
    alias da_SteamAPI_ISteamMatchmaking_GetLobbyOwner = uint64 function(intptr_t instancePtr, CSteamID steamIDLobby);
    alias da_SteamAPI_ISteamMatchmaking_SetLobbyOwner = bool function(intptr_t instancePtr, CSteamID steamIDLobby, CSteamID steamIDNewOwner);
    alias da_SteamAPI_ISteamMatchmaking_SetLinkedLobby = bool function(intptr_t instancePtr, CSteamID steamIDLobby, CSteamID steamIDLobbyDependent);
    alias da_SteamAPI_ISteamMatchmakingServerListResponse_ServerResponded = void function(intptr_t instancePtr, HServerListRequest hRequest, int iServer);
    alias da_SteamAPI_ISteamMatchmakingServerListResponse_ServerFailedToRespond = void function(intptr_t instancePtr, HServerListRequest hRequest, int iServer);
    alias da_SteamAPI_ISteamMatchmakingServerListResponse_RefreshComplete = void function(intptr_t instancePtr, HServerListRequest hRequest, EMatchMakingServerResponse response);
    alias da_SteamAPI_ISteamMatchmakingPingResponse_ServerResponded = void function(intptr_t instancePtr, gameserveritem_t* server);
    alias da_SteamAPI_ISteamMatchmakingPingResponse_ServerFailedToRespond = void function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamMatchmakingPlayersResponse_AddPlayerToList = void function(intptr_t instancePtr, const(char)* pchName, int nScore, float flTimePlayed);
    alias da_SteamAPI_ISteamMatchmakingPlayersResponse_PlayersFailedToRespond = void function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamMatchmakingPlayersResponse_PlayersRefreshComplete = void function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamMatchmakingRulesResponse_RulesResponded = void function(intptr_t instancePtr, const(char)* pchRule, const(char)* pchValue);
    alias da_SteamAPI_ISteamMatchmakingRulesResponse_RulesFailedToRespond = void function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamMatchmakingRulesResponse_RulesRefreshComplete = void function(intptr_t instancePtr);
    alias da_SteamAPI_ISteamMatchmakingServers_RequestInternetServerList = HServerListRequest function(intptr_t instancePtr, AppId_t iApp, MatchMakingKeyValuePair_t ** ppchFilters, uint32 nFilters, ISteamMatchmakingServerListResponse * pRequestServersResponse);
    alias da_SteamAPI_ISteamMatchmakingServers_RequestLANServerList = HServerListRequest function(intptr_t instancePtr, AppId_t iApp, ISteamMatchmakingServerListResponse * pRequestServersResponse);
    alias da_SteamAPI_ISteamMatchmakingServers_RequestFriendsServerList = HServerListRequest function(intptr_t instancePtr, AppId_t iApp, MatchMakingKeyValuePair_t ** ppchFilters, uint32 nFilters, ISteamMatchmakingServerListResponse * pRequestServersResponse);
    alias da_SteamAPI_ISteamMatchmakingServers_RequestFavoritesServerList = HServerListRequest function(intptr_t instancePtr, AppId_t iApp, MatchMakingKeyValuePair_t ** ppchFilters, uint32 nFilters, ISteamMatchmakingServerListResponse * pRequestServersResponse);
    alias da_SteamAPI_ISteamMatchmakingServers_RequestHistoryServerList = HServerListRequest function(intptr_t instancePtr, AppId_t iApp, MatchMakingKeyValuePair_t ** ppchFilters, uint32 nFilters, ISteamMatchmakingServerListResponse * pRequestServersResponse);
    alias da_SteamAPI_ISteamMatchmakingServers_RequestSpectatorServerList = HServerListRequest function(intptr_t instancePtr, AppId_t iApp, MatchMakingKeyValuePair_t ** ppchFilters, uint32 nFilters, ISteamMatchmakingServerListResponse * pRequestServersResponse);
    alias da_SteamAPI_ISteamMatchmakingServers_ReleaseRequest = void function(intptr_t instancePtr, HServerListRequest hServerListRequest);
    alias da_SteamAPI_ISteamMatchmakingServers_GetServerDetails = gameserveritem_t * function(intptr_t instancePtr, HServerListRequest hRequest, int iServer);
    alias da_SteamAPI_ISteamMatchmakingServers_CancelQuery = void function(intptr_t instancePtr, HServerListRequest hRequest);
    alias da_SteamAPI_ISteamMatchmakingServers_RefreshQuery = void function(intptr_t instancePtr, HServerListRequest hRequest);
    alias da_SteamAPI_ISteamMatchmakingServers_IsRefreshing = bool function(intptr_t instancePtr, HServerListRequest hRequest);
    alias da_SteamAPI_ISteamMatchmakingServers_GetServerCount = int function(intptr_t instancePtr, HServerListRequest hRequest);
    alias da_SteamAPI_ISteamMatchmakingServers_RefreshServer = void function(intptr_t instancePtr, HServerListRequest hRequest, int iServer);
    alias da_SteamAPI_ISteamMatchmakingServers_PingServer = HServerQuery function(intptr_t instancePtr, uint32 unIP, uint16 usPort, ISteamMatchmakingPingResponse * pRequestServersResponse);
    alias da_SteamAPI_ISteamMatchmakingServers_PlayerDetails = HServerQuery function(intptr_t instancePtr, uint32 unIP, uint16 usPort, ISteamMatchmakingPlayersResponse * pRequestServersResponse);
    alias da_SteamAPI_ISteamMatchmakingServers_ServerRules = HServerQuery function(intptr_t instancePtr, uint32 unIP, uint16 usPort, ISteamMatchmakingRulesResponse * pRequestServersResponse);
    alias da_SteamAPI_ISteamMatchmakingServers_CancelServerQuery = void function(intptr_t instancePtr, HServerQuery hServerQuery);
}

__gshared
{
    da_SteamAPI_Init SteamAPI_Init;
    da_SteamAPI_Shutdown SteamAPI_Shutdown;
    da_SteamAPI_IsSteamRunning SteamAPI_IsSteamRunning;
    da_SteamClient SteamClient;

    da_SteamAPI_ISteamClient_CreateSteamPipe SteamAPI_ISteamClient_CreateSteamPipe;
    da_SteamAPI_ISteamClient_BReleaseSteamPipe SteamAPI_ISteamClient_BReleaseSteamPipe;
    da_SteamAPI_ISteamClient_ConnectToGlobalUser SteamAPI_ISteamClient_ConnectToGlobalUser;
    da_SteamAPI_ISteamClient_CreateLocalUser SteamAPI_ISteamClient_CreateLocalUser;
    da_SteamAPI_ISteamClient_ReleaseUser SteamAPI_ISteamClient_ReleaseUser;
    da_SteamAPI_ISteamClient_GetISteamUser SteamAPI_ISteamClient_GetISteamUser;
    da_SteamAPI_ISteamClient_GetISteamGameServer SteamAPI_ISteamClient_GetISteamGameServer;
    da_SteamAPI_ISteamClient_SetLocalIPBinding SteamAPI_ISteamClient_SetLocalIPBinding;
    da_SteamAPI_ISteamClient_GetISteamFriends SteamAPI_ISteamClient_GetISteamFriends;
    da_SteamAPI_ISteamClient_GetISteamUtils SteamAPI_ISteamClient_GetISteamUtils;
    da_SteamAPI_ISteamClient_GetISteamMatchmaking SteamAPI_ISteamClient_GetISteamMatchmaking;
    da_SteamAPI_ISteamClient_GetISteamMatchmakingServers SteamAPI_ISteamClient_GetISteamMatchmakingServers;
    da_SteamAPI_ISteamClient_GetISteamGenericInterface SteamAPI_ISteamClient_GetISteamGenericInterface;
    da_SteamAPI_ISteamClient_GetISteamUserStats SteamAPI_ISteamClient_GetISteamUserStats;
    da_SteamAPI_ISteamClient_GetISteamGameServerStats SteamAPI_ISteamClient_GetISteamGameServerStats;
    da_SteamAPI_ISteamClient_GetISteamApps SteamAPI_ISteamClient_GetISteamApps;
    da_SteamAPI_ISteamClient_GetISteamNetworking SteamAPI_ISteamClient_GetISteamNetworking;
    da_SteamAPI_ISteamClient_GetISteamRemoteStorage SteamAPI_ISteamClient_GetISteamRemoteStorage;
    da_SteamAPI_ISteamClient_GetISteamScreenshots SteamAPI_ISteamClient_GetISteamScreenshots;
    da_SteamAPI_ISteamClient_RunFrame SteamAPI_ISteamClient_RunFrame;
    da_SteamAPI_ISteamClient_GetIPCCallCount SteamAPI_ISteamClient_GetIPCCallCount;
    da_SteamAPI_ISteamClient_SetWarningMessageHook SteamAPI_ISteamClient_SetWarningMessageHook;
    da_SteamAPI_ISteamClient_BShutdownIfAllPipesClosed SteamAPI_ISteamClient_BShutdownIfAllPipesClosed;
    da_SteamAPI_ISteamClient_GetISteamHTTP SteamAPI_ISteamClient_GetISteamHTTP;
    da_SteamAPI_ISteamClient_GetISteamUnifiedMessages SteamAPI_ISteamClient_GetISteamUnifiedMessages;
    da_SteamAPI_ISteamClient_GetISteamController SteamAPI_ISteamClient_GetISteamController;
    da_SteamAPI_ISteamClient_GetISteamUGC SteamAPI_ISteamClient_GetISteamUGC;
    da_SteamAPI_ISteamClient_GetISteamAppList SteamAPI_ISteamClient_GetISteamAppList;
    da_SteamAPI_ISteamClient_GetISteamMusic SteamAPI_ISteamClient_GetISteamMusic;
    da_SteamAPI_ISteamClient_GetISteamMusicRemote SteamAPI_ISteamClient_GetISteamMusicRemote;
    da_SteamAPI_ISteamClient_GetISteamHTMLSurface SteamAPI_ISteamClient_GetISteamHTMLSurface;
    da_SteamAPI_ISteamClient_Set_SteamAPI_CPostAPIResultInProcess SteamAPI_ISteamClient_Set_SteamAPI_CPostAPIResultInProcess;
    da_SteamAPI_ISteamClient_Remove_SteamAPI_CPostAPIResultInProcess SteamAPI_ISteamClient_Remove_SteamAPI_CPostAPIResultInProcess;
    da_SteamAPI_ISteamClient_Set_SteamAPI_CCheckCallbackRegisteredInProcess SteamAPI_ISteamClient_Set_SteamAPI_CCheckCallbackRegisteredInProcess;
    da_SteamAPI_ISteamClient_GetISteamInventory SteamAPI_ISteamClient_GetISteamInventory;
    da_SteamAPI_ISteamClient_GetISteamVideo SteamAPI_ISteamClient_GetISteamVideo;
    
    da_SteamAPI_ISteamUser_GetHSteamUser SteamAPI_ISteamUser_GetHSteamUser;
    da_SteamAPI_ISteamUser_BLoggedOn SteamAPI_ISteamUser_BLoggedOn;
    da_SteamAPI_ISteamUser_GetSteamID SteamAPI_ISteamUser_GetSteamID;
    da_SteamAPI_ISteamUser_InitiateGameConnection SteamAPI_ISteamUser_InitiateGameConnection;
    da_SteamAPI_ISteamUser_TerminateGameConnection SteamAPI_ISteamUser_TerminateGameConnection;
    da_SteamAPI_ISteamUser_TrackAppUsageEvent SteamAPI_ISteamUser_TrackAppUsageEvent;
    da_SteamAPI_ISteamUser_GetUserDataFolder SteamAPI_ISteamUser_GetUserDataFolder;
    da_SteamAPI_ISteamUser_StartVoiceRecording SteamAPI_ISteamUser_StartVoiceRecording;
    da_SteamAPI_ISteamUser_StopVoiceRecording SteamAPI_ISteamUser_StopVoiceRecording;
    da_SteamAPI_ISteamUser_GetAvailableVoice SteamAPI_ISteamUser_GetAvailableVoice;
    da_SteamAPI_ISteamUser_GetVoice SteamAPI_ISteamUser_GetVoice;
    da_SteamAPI_ISteamUser_DecompressVoice SteamAPI_ISteamUser_DecompressVoice;
    da_SteamAPI_ISteamUser_GetVoiceOptimalSampleRate SteamAPI_ISteamUser_GetVoiceOptimalSampleRate;
    da_SteamAPI_ISteamUser_GetAuthSessionTicket SteamAPI_ISteamUser_GetAuthSessionTicket;
    da_SteamAPI_ISteamUser_BeginAuthSession SteamAPI_ISteamUser_BeginAuthSession;
    da_SteamAPI_ISteamUser_EndAuthSession SteamAPI_ISteamUser_EndAuthSession;
    da_SteamAPI_ISteamUser_CancelAuthTicket SteamAPI_ISteamUser_CancelAuthTicket;
    da_SteamAPI_ISteamUser_UserHasLicenseForApp SteamAPI_ISteamUser_UserHasLicenseForApp;
    da_SteamAPI_ISteamUser_BIsBehindNAT SteamAPI_ISteamUser_BIsBehindNAT;
    da_SteamAPI_ISteamUser_AdvertiseGame SteamAPI_ISteamUser_AdvertiseGame;
    da_SteamAPI_ISteamUser_RequestEncryptedAppTicket SteamAPI_ISteamUser_RequestEncryptedAppTicket;
    da_SteamAPI_ISteamUser_GetEncryptedAppTicket SteamAPI_ISteamUser_GetEncryptedAppTicket;
    da_SteamAPI_ISteamUser_GetGameBadgeLevel SteamAPI_ISteamUser_GetGameBadgeLevel;
    da_SteamAPI_ISteamUser_GetPlayerSteamLevel SteamAPI_ISteamUser_GetPlayerSteamLevel;
    da_SteamAPI_ISteamUser_RequestStoreAuthURL SteamAPI_ISteamUser_RequestStoreAuthURL;

    da_SteamAPI_ISteamFriends_GetPersonaName SteamAPI_ISteamFriends_GetPersonaName;
    da_SteamAPI_ISteamFriends_SetPersonaName SteamAPI_ISteamFriends_SetPersonaName;
    da_SteamAPI_ISteamFriends_GetPersonaState SteamAPI_ISteamFriends_GetPersonaState;
    da_SteamAPI_ISteamFriends_GetFriendCount SteamAPI_ISteamFriends_GetFriendCount;
    da_SteamAPI_ISteamFriends_GetFriendByIndex SteamAPI_ISteamFriends_GetFriendByIndex;
    da_SteamAPI_ISteamFriends_GetFriendRelationship SteamAPI_ISteamFriends_GetFriendRelationship;
    da_SteamAPI_ISteamFriends_GetFriendPersonaState SteamAPI_ISteamFriends_GetFriendPersonaState;
    da_SteamAPI_ISteamFriends_GetFriendPersonaName SteamAPI_ISteamFriends_GetFriendPersonaName;
    da_SteamAPI_ISteamFriends_GetFriendGamePlayed SteamAPI_ISteamFriends_GetFriendGamePlayed;
    da_SteamAPI_ISteamFriends_GetFriendPersonaNameHistory SteamAPI_ISteamFriends_GetFriendPersonaNameHistory;
    da_SteamAPI_ISteamFriends_GetFriendSteamLevel SteamAPI_ISteamFriends_GetFriendSteamLevel;
    da_SteamAPI_ISteamFriends_GetPlayerNickname SteamAPI_ISteamFriends_GetPlayerNickname;
    da_SteamAPI_ISteamFriends_GetFriendsGroupCount SteamAPI_ISteamFriends_GetFriendsGroupCount;
    da_SteamAPI_ISteamFriends_GetFriendsGroupIDByIndex SteamAPI_ISteamFriends_GetFriendsGroupIDByIndex;
    da_SteamAPI_ISteamFriends_GetFriendsGroupName SteamAPI_ISteamFriends_GetFriendsGroupName;
    da_SteamAPI_ISteamFriends_GetFriendsGroupMembersCount SteamAPI_ISteamFriends_GetFriendsGroupMembersCount;
    da_SteamAPI_ISteamFriends_GetFriendsGroupMembersList SteamAPI_ISteamFriends_GetFriendsGroupMembersList;
    da_SteamAPI_ISteamFriends_HasFriend SteamAPI_ISteamFriends_HasFriend;
    da_SteamAPI_ISteamFriends_GetClanCount SteamAPI_ISteamFriends_GetClanCount;
    da_SteamAPI_ISteamFriends_GetClanByIndex SteamAPI_ISteamFriends_GetClanByIndex;
    da_SteamAPI_ISteamFriends_GetClanName SteamAPI_ISteamFriends_GetClanName;
    da_SteamAPI_ISteamFriends_GetClanTag SteamAPI_ISteamFriends_GetClanTag;
    da_SteamAPI_ISteamFriends_GetClanActivityCounts SteamAPI_ISteamFriends_GetClanActivityCounts;
    da_SteamAPI_ISteamFriends_DownloadClanActivityCounts SteamAPI_ISteamFriends_DownloadClanActivityCounts;
    da_SteamAPI_ISteamFriends_GetFriendCountFromSource SteamAPI_ISteamFriends_GetFriendCountFromSource;
    da_SteamAPI_ISteamFriends_GetFriendFromSourceByIndex SteamAPI_ISteamFriends_GetFriendFromSourceByIndex;
    da_SteamAPI_ISteamFriends_IsUserInSource SteamAPI_ISteamFriends_IsUserInSource;
    da_SteamAPI_ISteamFriends_SetInGameVoiceSpeaking SteamAPI_ISteamFriends_SetInGameVoiceSpeaking;
    da_SteamAPI_ISteamFriends_ActivateGameOverlay SteamAPI_ISteamFriends_ActivateGameOverlay;
    da_SteamAPI_ISteamFriends_ActivateGameOverlayToUser SteamAPI_ISteamFriends_ActivateGameOverlayToUser;
    da_SteamAPI_ISteamFriends_ActivateGameOverlayToWebPage SteamAPI_ISteamFriends_ActivateGameOverlayToWebPage;
    da_SteamAPI_ISteamFriends_ActivateGameOverlayToStore SteamAPI_ISteamFriends_ActivateGameOverlayToStore;
    da_SteamAPI_ISteamFriends_SetPlayedWith SteamAPI_ISteamFriends_SetPlayedWith;
    da_SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialog SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialog;
    da_SteamAPI_ISteamFriends_GetSmallFriendAvatar SteamAPI_ISteamFriends_GetSmallFriendAvatar;
    da_SteamAPI_ISteamFriends_GetMediumFriendAvatar SteamAPI_ISteamFriends_GetMediumFriendAvatar;
    da_SteamAPI_ISteamFriends_GetLargeFriendAvatar SteamAPI_ISteamFriends_GetLargeFriendAvatar;
    da_SteamAPI_ISteamFriends_RequestUserInformation SteamAPI_ISteamFriends_RequestUserInformation;
    da_SteamAPI_ISteamFriends_RequestClanOfficerList SteamAPI_ISteamFriends_RequestClanOfficerList;
    da_SteamAPI_ISteamFriends_GetClanOwner SteamAPI_ISteamFriends_GetClanOwner;
    da_SteamAPI_ISteamFriends_GetClanOfficerCount SteamAPI_ISteamFriends_GetClanOfficerCount;
    da_SteamAPI_ISteamFriends_GetClanOfficerByIndex SteamAPI_ISteamFriends_GetClanOfficerByIndex;
    da_SteamAPI_ISteamFriends_GetUserRestrictions SteamAPI_ISteamFriends_GetUserRestrictions;
    da_SteamAPI_ISteamFriends_SetRichPresence SteamAPI_ISteamFriends_SetRichPresence;
    da_SteamAPI_ISteamFriends_ClearRichPresence SteamAPI_ISteamFriends_ClearRichPresence;
    da_SteamAPI_ISteamFriends_GetFriendRichPresence SteamAPI_ISteamFriends_GetFriendRichPresence;
    da_SteamAPI_ISteamFriends_GetFriendRichPresenceKeyCount SteamAPI_ISteamFriends_GetFriendRichPresenceKeyCount;
    da_SteamAPI_ISteamFriends_GetFriendRichPresenceKeyByIndex SteamAPI_ISteamFriends_GetFriendRichPresenceKeyByIndex;
    da_SteamAPI_ISteamFriends_RequestFriendRichPresence SteamAPI_ISteamFriends_RequestFriendRichPresence;
    da_SteamAPI_ISteamFriends_InviteUserToGame SteamAPI_ISteamFriends_InviteUserToGame;
    da_SteamAPI_ISteamFriends_GetCoplayFriendCount SteamAPI_ISteamFriends_GetCoplayFriendCount;
    da_SteamAPI_ISteamFriends_GetCoplayFriend SteamAPI_ISteamFriends_GetCoplayFriend;
    da_SteamAPI_ISteamFriends_GetFriendCoplayTime SteamAPI_ISteamFriends_GetFriendCoplayTime;
    da_SteamAPI_ISteamFriends_GetFriendCoplayGame SteamAPI_ISteamFriends_GetFriendCoplayGame;
    da_SteamAPI_ISteamFriends_JoinClanChatRoom SteamAPI_ISteamFriends_JoinClanChatRoom;
    da_SteamAPI_ISteamFriends_LeaveClanChatRoom SteamAPI_ISteamFriends_LeaveClanChatRoom;
    da_SteamAPI_ISteamFriends_GetClanChatMemberCount SteamAPI_ISteamFriends_GetClanChatMemberCount;
    da_SteamAPI_ISteamFriends_GetChatMemberByIndex SteamAPI_ISteamFriends_GetChatMemberByIndex;
    da_SteamAPI_ISteamFriends_SendClanChatMessage SteamAPI_ISteamFriends_SendClanChatMessage;
    da_SteamAPI_ISteamFriends_GetClanChatMessage SteamAPI_ISteamFriends_GetClanChatMessage;
    da_SteamAPI_ISteamFriends_IsClanChatAdmin SteamAPI_ISteamFriends_IsClanChatAdmin;
    da_SteamAPI_ISteamFriends_IsClanChatWindowOpenInSteam SteamAPI_ISteamFriends_IsClanChatWindowOpenInSteam;
    da_SteamAPI_ISteamFriends_OpenClanChatWindowInSteam SteamAPI_ISteamFriends_OpenClanChatWindowInSteam;
    da_SteamAPI_ISteamFriends_CloseClanChatWindowInSteam SteamAPI_ISteamFriends_CloseClanChatWindowInSteam;
    da_SteamAPI_ISteamFriends_SetListenForFriendsMessages SteamAPI_ISteamFriends_SetListenForFriendsMessages;
    da_SteamAPI_ISteamFriends_ReplyToFriendMessage SteamAPI_ISteamFriends_ReplyToFriendMessage;
    da_SteamAPI_ISteamFriends_GetFriendMessage SteamAPI_ISteamFriends_GetFriendMessage;
    da_SteamAPI_ISteamFriends_GetFollowerCount SteamAPI_ISteamFriends_GetFollowerCount;
    da_SteamAPI_ISteamFriends_IsFollowing SteamAPI_ISteamFriends_IsFollowing;
    da_SteamAPI_ISteamFriends_EnumerateFollowingList SteamAPI_ISteamFriends_EnumerateFollowingList;

    da_SteamAPI_ISteamUtils_GetSecondsSinceAppActive SteamAPI_ISteamUtils_GetSecondsSinceAppActive;
    da_SteamAPI_ISteamUtils_GetSecondsSinceComputerActive SteamAPI_ISteamUtils_GetSecondsSinceComputerActive;
    da_SteamAPI_ISteamUtils_GetConnectedUniverse SteamAPI_ISteamUtils_GetConnectedUniverse;
    da_SteamAPI_ISteamUtils_GetServerRealTime SteamAPI_ISteamUtils_GetServerRealTime;
    da_SteamAPI_ISteamUtils_GetIPCountry SteamAPI_ISteamUtils_GetIPCountry;
    da_SteamAPI_ISteamUtils_GetImageSize SteamAPI_ISteamUtils_GetImageSize;
    da_SteamAPI_ISteamUtils_GetImageRGBA SteamAPI_ISteamUtils_GetImageRGBA;
    da_SteamAPI_ISteamUtils_GetCSERIPPort SteamAPI_ISteamUtils_GetCSERIPPort;
    da_SteamAPI_ISteamUtils_GetCurrentBatteryPower SteamAPI_ISteamUtils_GetCurrentBatteryPower;
    da_SteamAPI_ISteamUtils_GetAppID SteamAPI_ISteamUtils_GetAppID;
    da_SteamAPI_ISteamUtils_SetOverlayNotificationPosition SteamAPI_ISteamUtils_SetOverlayNotificationPosition;
    da_SteamAPI_ISteamUtils_IsAPICallCompleted SteamAPI_ISteamUtils_IsAPICallCompleted;
    da_SteamAPI_ISteamUtils_GetAPICallFailureReason SteamAPI_ISteamUtils_GetAPICallFailureReason;
    da_SteamAPI_ISteamUtils_GetAPICallResult SteamAPI_ISteamUtils_GetAPICallResult;
    da_SteamAPI_ISteamUtils_RunFrame SteamAPI_ISteamUtils_RunFrame;
    da_SteamAPI_ISteamUtils_GetIPCCallCount SteamAPI_ISteamUtils_GetIPCCallCount;
    da_SteamAPI_ISteamUtils_SetWarningMessageHook SteamAPI_ISteamUtils_SetWarningMessageHook;
    da_SteamAPI_ISteamUtils_IsOverlayEnabled SteamAPI_ISteamUtils_IsOverlayEnabled;
    da_SteamAPI_ISteamUtils_BOverlayNeedsPresent SteamAPI_ISteamUtils_BOverlayNeedsPresent;
    da_SteamAPI_ISteamUtils_CheckFileSignature SteamAPI_ISteamUtils_CheckFileSignature;
    da_SteamAPI_ISteamUtils_ShowGamepadTextInput SteamAPI_ISteamUtils_ShowGamepadTextInput;
    da_SteamAPI_ISteamUtils_GetEnteredGamepadTextLength SteamAPI_ISteamUtils_GetEnteredGamepadTextLength;
    da_SteamAPI_ISteamUtils_GetEnteredGamepadTextInput SteamAPI_ISteamUtils_GetEnteredGamepadTextInput;
    da_SteamAPI_ISteamUtils_GetSteamUILanguage SteamAPI_ISteamUtils_GetSteamUILanguage;
    da_SteamAPI_ISteamUtils_IsSteamRunningInVR SteamAPI_ISteamUtils_IsSteamRunningInVR;
    da_SteamAPI_ISteamUtils_SetOverlayNotificationInset SteamAPI_ISteamUtils_SetOverlayNotificationInset;

    da_SteamAPI_ISteamMatchmaking_GetFavoriteGameCount SteamAPI_ISteamMatchmaking_GetFavoriteGameCount;
    da_SteamAPI_ISteamMatchmaking_GetFavoriteGame SteamAPI_ISteamMatchmaking_GetFavoriteGame;
    da_SteamAPI_ISteamMatchmaking_AddFavoriteGame SteamAPI_ISteamMatchmaking_AddFavoriteGame;
    da_SteamAPI_ISteamMatchmaking_RemoveFavoriteGame SteamAPI_ISteamMatchmaking_RemoveFavoriteGame;
    da_SteamAPI_ISteamMatchmaking_RequestLobbyList SteamAPI_ISteamMatchmaking_RequestLobbyList;
    da_SteamAPI_ISteamMatchmaking_AddRequestLobbyListStringFilter SteamAPI_ISteamMatchmaking_AddRequestLobbyListStringFilter;
    da_SteamAPI_ISteamMatchmaking_AddRequestLobbyListNumericalFilter SteamAPI_ISteamMatchmaking_AddRequestLobbyListNumericalFilter;
    da_SteamAPI_ISteamMatchmaking_AddRequestLobbyListNearValueFilter SteamAPI_ISteamMatchmaking_AddRequestLobbyListNearValueFilter;
    da_SteamAPI_ISteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable SteamAPI_ISteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable;
    da_SteamAPI_ISteamMatchmaking_AddRequestLobbyListDistanceFilter SteamAPI_ISteamMatchmaking_AddRequestLobbyListDistanceFilter;
    da_SteamAPI_ISteamMatchmaking_AddRequestLobbyListResultCountFilter SteamAPI_ISteamMatchmaking_AddRequestLobbyListResultCountFilter;
    da_SteamAPI_ISteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter SteamAPI_ISteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter;
    da_SteamAPI_ISteamMatchmaking_GetLobbyByIndex SteamAPI_ISteamMatchmaking_GetLobbyByIndex;
    da_SteamAPI_ISteamMatchmaking_CreateLobby SteamAPI_ISteamMatchmaking_CreateLobby;
    da_SteamAPI_ISteamMatchmaking_JoinLobby SteamAPI_ISteamMatchmaking_JoinLobby;
    da_SteamAPI_ISteamMatchmaking_LeaveLobby SteamAPI_ISteamMatchmaking_LeaveLobby;
    da_SteamAPI_ISteamMatchmaking_InviteUserToLobby SteamAPI_ISteamMatchmaking_InviteUserToLobby;
    da_SteamAPI_ISteamMatchmaking_GetNumLobbyMembers SteamAPI_ISteamMatchmaking_GetNumLobbyMembers;
    da_SteamAPI_ISteamMatchmaking_GetLobbyMemberByIndex SteamAPI_ISteamMatchmaking_GetLobbyMemberByIndex;
    da_SteamAPI_ISteamMatchmaking_GetLobbyData SteamAPI_ISteamMatchmaking_GetLobbyData;
    da_SteamAPI_ISteamMatchmaking_SetLobbyData SteamAPI_ISteamMatchmaking_SetLobbyData;
    da_SteamAPI_ISteamMatchmaking_GetLobbyDataCount SteamAPI_ISteamMatchmaking_GetLobbyDataCount;
    da_SteamAPI_ISteamMatchmaking_GetLobbyDataByIndex SteamAPI_ISteamMatchmaking_GetLobbyDataByIndex;
    da_SteamAPI_ISteamMatchmaking_DeleteLobbyData SteamAPI_ISteamMatchmaking_DeleteLobbyData;
    da_SteamAPI_ISteamMatchmaking_GetLobbyMemberData SteamAPI_ISteamMatchmaking_GetLobbyMemberData;
    da_SteamAPI_ISteamMatchmaking_SetLobbyMemberData SteamAPI_ISteamMatchmaking_SetLobbyMemberData;
    da_SteamAPI_ISteamMatchmaking_SendLobbyChatMsg SteamAPI_ISteamMatchmaking_SendLobbyChatMsg;
    da_SteamAPI_ISteamMatchmaking_GetLobbyChatEntry SteamAPI_ISteamMatchmaking_GetLobbyChatEntry;
    da_SteamAPI_ISteamMatchmaking_RequestLobbyData SteamAPI_ISteamMatchmaking_RequestLobbyData;
    da_SteamAPI_ISteamMatchmaking_SetLobbyGameServer SteamAPI_ISteamMatchmaking_SetLobbyGameServer;
    da_SteamAPI_ISteamMatchmaking_GetLobbyGameServer SteamAPI_ISteamMatchmaking_GetLobbyGameServer;
    da_SteamAPI_ISteamMatchmaking_SetLobbyMemberLimit SteamAPI_ISteamMatchmaking_SetLobbyMemberLimit;
    da_SteamAPI_ISteamMatchmaking_GetLobbyMemberLimit SteamAPI_ISteamMatchmaking_GetLobbyMemberLimit;
    da_SteamAPI_ISteamMatchmaking_SetLobbyType SteamAPI_ISteamMatchmaking_SetLobbyType;
    da_SteamAPI_ISteamMatchmaking_SetLobbyJoinable SteamAPI_ISteamMatchmaking_SetLobbyJoinable;
    da_SteamAPI_ISteamMatchmaking_GetLobbyOwner SteamAPI_ISteamMatchmaking_GetLobbyOwner;
    da_SteamAPI_ISteamMatchmaking_SetLobbyOwner SteamAPI_ISteamMatchmaking_SetLobbyOwner;
    da_SteamAPI_ISteamMatchmaking_SetLinkedLobby SteamAPI_ISteamMatchmaking_SetLinkedLobby;
    da_SteamAPI_ISteamMatchmakingServerListResponse_ServerResponded SteamAPI_ISteamMatchmakingServerListResponse_ServerResponded;
    da_SteamAPI_ISteamMatchmakingServerListResponse_ServerFailedToRespond SteamAPI_ISteamMatchmakingServerListResponse_ServerFailedToRespond;
    da_SteamAPI_ISteamMatchmakingServerListResponse_RefreshComplete SteamAPI_ISteamMatchmakingServerListResponse_RefreshComplete;
    da_SteamAPI_ISteamMatchmakingPingResponse_ServerResponded SteamAPI_ISteamMatchmakingPingResponse_ServerResponded;
    da_SteamAPI_ISteamMatchmakingPingResponse_ServerFailedToRespond SteamAPI_ISteamMatchmakingPingResponse_ServerFailedToRespond;
    da_SteamAPI_ISteamMatchmakingPlayersResponse_AddPlayerToList SteamAPI_ISteamMatchmakingPlayersResponse_AddPlayerToList;
    da_SteamAPI_ISteamMatchmakingPlayersResponse_PlayersFailedToRespond SteamAPI_ISteamMatchmakingPlayersResponse_PlayersFailedToRespond;
    da_SteamAPI_ISteamMatchmakingPlayersResponse_PlayersRefreshComplete SteamAPI_ISteamMatchmakingPlayersResponse_PlayersRefreshComplete;
    da_SteamAPI_ISteamMatchmakingRulesResponse_RulesResponded SteamAPI_ISteamMatchmakingRulesResponse_RulesResponded;
    da_SteamAPI_ISteamMatchmakingRulesResponse_RulesFailedToRespond SteamAPI_ISteamMatchmakingRulesResponse_RulesFailedToRespond;
    da_SteamAPI_ISteamMatchmakingRulesResponse_RulesRefreshComplete SteamAPI_ISteamMatchmakingRulesResponse_RulesRefreshComplete;
    da_SteamAPI_ISteamMatchmakingServers_RequestInternetServerList SteamAPI_ISteamMatchmakingServers_RequestInternetServerList;
    da_SteamAPI_ISteamMatchmakingServers_RequestLANServerList SteamAPI_ISteamMatchmakingServers_RequestLANServerList;
    da_SteamAPI_ISteamMatchmakingServers_RequestFriendsServerList SteamAPI_ISteamMatchmakingServers_RequestFriendsServerList;
    da_SteamAPI_ISteamMatchmakingServers_RequestFavoritesServerList SteamAPI_ISteamMatchmakingServers_RequestFavoritesServerList;
    da_SteamAPI_ISteamMatchmakingServers_RequestHistoryServerList SteamAPI_ISteamMatchmakingServers_RequestHistoryServerList;
    da_SteamAPI_ISteamMatchmakingServers_RequestSpectatorServerList SteamAPI_ISteamMatchmakingServers_RequestSpectatorServerList;
    da_SteamAPI_ISteamMatchmakingServers_ReleaseRequest SteamAPI_ISteamMatchmakingServers_ReleaseRequest;
    da_SteamAPI_ISteamMatchmakingServers_GetServerDetails SteamAPI_ISteamMatchmakingServers_GetServerDetails;
    da_SteamAPI_ISteamMatchmakingServers_CancelQuery SteamAPI_ISteamMatchmakingServers_CancelQuery;
    da_SteamAPI_ISteamMatchmakingServers_RefreshQuery SteamAPI_ISteamMatchmakingServers_RefreshQuery;
    da_SteamAPI_ISteamMatchmakingServers_IsRefreshing SteamAPI_ISteamMatchmakingServers_IsRefreshing;
    da_SteamAPI_ISteamMatchmakingServers_GetServerCount SteamAPI_ISteamMatchmakingServers_GetServerCount;
    da_SteamAPI_ISteamMatchmakingServers_RefreshServer SteamAPI_ISteamMatchmakingServers_RefreshServer;
    da_SteamAPI_ISteamMatchmakingServers_PingServer SteamAPI_ISteamMatchmakingServers_PingServer;
    da_SteamAPI_ISteamMatchmakingServers_PlayerDetails SteamAPI_ISteamMatchmakingServers_PlayerDetails;
    da_SteamAPI_ISteamMatchmakingServers_ServerRules SteamAPI_ISteamMatchmakingServers_ServerRules;
    da_SteamAPI_ISteamMatchmakingServers_CancelServerQuery SteamAPI_ISteamMatchmakingServers_CancelServerQuery;
}
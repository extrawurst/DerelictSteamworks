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
module derelict.steamworks.steamworks;

public
{
	import derelict.steamworks.types;
    import derelict.steamworks.funcs;
    import derelict.steamworks.interfaces;
}

private
{
    import derelict.util.loader;
    import derelict.util.system;

    static if(Derelict_OS_Windows)
        enum libNames = "steam_api.dll";    
    else static if (Derelict_OS_Mac)
        enum libNames = "libsteam_api.dylib";
    else static if (Derelict_OS_Linux)
        enum libNames = "libsteam_api.so";
    else
        static assert(0, "Need to implement imgui libNames for this operating system.");
}

final class DerelictSteamworksLoader : SharedLibLoader
{
    protected
    {
        override void loadSymbols()
        {
            bindFunc(cast(void**)&SteamAPI_Init, "SteamAPI_Init");
            bindFunc(cast(void**)&SteamAPI_Shutdown, "SteamAPI_Shutdown");
            bindFunc(cast(void**)&SteamAPI_IsSteamRunning, "SteamAPI_IsSteamRunning");
            bindFunc(cast(void**)&SteamClient, "SteamClient");
                
            bindFunc(cast(void**)&SteamAPI_ISteamClient_CreateSteamPipe, "SteamAPI_ISteamClient_CreateSteamPipe");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_BReleaseSteamPipe, "SteamAPI_ISteamClient_BReleaseSteamPipe");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_ConnectToGlobalUser, "SteamAPI_ISteamClient_ConnectToGlobalUser");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_CreateLocalUser, "SteamAPI_ISteamClient_CreateLocalUser");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_ReleaseUser, "SteamAPI_ISteamClient_ReleaseUser");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_GetISteamUser, "SteamAPI_ISteamClient_GetISteamUser");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_GetISteamGameServer, "SteamAPI_ISteamClient_GetISteamGameServer");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_SetLocalIPBinding, "SteamAPI_ISteamClient_SetLocalIPBinding");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_GetISteamFriends, "SteamAPI_ISteamClient_GetISteamFriends");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_GetISteamUtils, "SteamAPI_ISteamClient_GetISteamUtils");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_GetISteamMatchmaking, "SteamAPI_ISteamClient_GetISteamMatchmaking");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_GetISteamMatchmakingServers, "SteamAPI_ISteamClient_GetISteamMatchmakingServers");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_GetISteamGenericInterface, "SteamAPI_ISteamClient_GetISteamGenericInterface");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_GetISteamUserStats, "SteamAPI_ISteamClient_GetISteamUserStats");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_GetISteamGameServerStats, "SteamAPI_ISteamClient_GetISteamGameServerStats");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_GetISteamApps, "SteamAPI_ISteamClient_GetISteamApps");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_GetISteamNetworking, "SteamAPI_ISteamClient_GetISteamNetworking");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_GetISteamRemoteStorage, "SteamAPI_ISteamClient_GetISteamRemoteStorage");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_GetISteamScreenshots, "SteamAPI_ISteamClient_GetISteamScreenshots");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_RunFrame, "SteamAPI_ISteamClient_RunFrame");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_GetIPCCallCount, "SteamAPI_ISteamClient_GetIPCCallCount");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_SetWarningMessageHook, "SteamAPI_ISteamClient_SetWarningMessageHook");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_BShutdownIfAllPipesClosed, "SteamAPI_ISteamClient_BShutdownIfAllPipesClosed");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_GetISteamHTTP, "SteamAPI_ISteamClient_GetISteamHTTP");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_GetISteamUnifiedMessages, "SteamAPI_ISteamClient_GetISteamUnifiedMessages");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_GetISteamController, "SteamAPI_ISteamClient_GetISteamController");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_GetISteamUGC, "SteamAPI_ISteamClient_GetISteamUGC");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_GetISteamAppList, "SteamAPI_ISteamClient_GetISteamAppList");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_GetISteamMusic, "SteamAPI_ISteamClient_GetISteamMusic");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_GetISteamMusicRemote, "SteamAPI_ISteamClient_GetISteamMusicRemote");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_GetISteamHTMLSurface, "SteamAPI_ISteamClient_GetISteamHTMLSurface");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_Set_SteamAPI_CPostAPIResultInProcess, "SteamAPI_ISteamClient_Set_SteamAPI_CPostAPIResultInProcess");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_Remove_SteamAPI_CPostAPIResultInProcess, "SteamAPI_ISteamClient_Remove_SteamAPI_CPostAPIResultInProcess");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_Set_SteamAPI_CCheckCallbackRegisteredInProcess, "SteamAPI_ISteamClient_Set_SteamAPI_CCheckCallbackRegisteredInProcess");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_GetISteamInventory, "SteamAPI_ISteamClient_GetISteamInventory");
            bindFunc(cast(void**)&SteamAPI_ISteamClient_GetISteamVideo, "SteamAPI_ISteamClient_GetISteamVideo");
            
            bindFunc(cast(void**)&SteamAPI_ISteamUser_GetHSteamUser, "SteamAPI_ISteamUser_GetHSteamUser");
            bindFunc(cast(void**)&SteamAPI_ISteamUser_BLoggedOn, "SteamAPI_ISteamUser_BLoggedOn");
            bindFunc(cast(void**)&SteamAPI_ISteamUser_GetSteamID, "SteamAPI_ISteamUser_GetSteamID");
            bindFunc(cast(void**)&SteamAPI_ISteamUser_InitiateGameConnection, "SteamAPI_ISteamUser_InitiateGameConnection");
            bindFunc(cast(void**)&SteamAPI_ISteamUser_TerminateGameConnection, "SteamAPI_ISteamUser_TerminateGameConnection");
            bindFunc(cast(void**)&SteamAPI_ISteamUser_TrackAppUsageEvent, "SteamAPI_ISteamUser_TrackAppUsageEvent");
            bindFunc(cast(void**)&SteamAPI_ISteamUser_GetUserDataFolder, "SteamAPI_ISteamUser_GetUserDataFolder");
            bindFunc(cast(void**)&SteamAPI_ISteamUser_StartVoiceRecording, "SteamAPI_ISteamUser_StartVoiceRecording");
            bindFunc(cast(void**)&SteamAPI_ISteamUser_StopVoiceRecording, "SteamAPI_ISteamUser_StopVoiceRecording");
            bindFunc(cast(void**)&SteamAPI_ISteamUser_GetAvailableVoice, "SteamAPI_ISteamUser_GetAvailableVoice");
            bindFunc(cast(void**)&SteamAPI_ISteamUser_GetVoice, "SteamAPI_ISteamUser_GetVoice");
            bindFunc(cast(void**)&SteamAPI_ISteamUser_DecompressVoice, "SteamAPI_ISteamUser_DecompressVoice");
            bindFunc(cast(void**)&SteamAPI_ISteamUser_GetVoiceOptimalSampleRate, "SteamAPI_ISteamUser_GetVoiceOptimalSampleRate");
            bindFunc(cast(void**)&SteamAPI_ISteamUser_GetAuthSessionTicket, "SteamAPI_ISteamUser_GetAuthSessionTicket");
            bindFunc(cast(void**)&SteamAPI_ISteamUser_BeginAuthSession, "SteamAPI_ISteamUser_BeginAuthSession");
            bindFunc(cast(void**)&SteamAPI_ISteamUser_EndAuthSession, "SteamAPI_ISteamUser_EndAuthSession");
            bindFunc(cast(void**)&SteamAPI_ISteamUser_CancelAuthTicket, "SteamAPI_ISteamUser_CancelAuthTicket");
            bindFunc(cast(void**)&SteamAPI_ISteamUser_UserHasLicenseForApp, "SteamAPI_ISteamUser_UserHasLicenseForApp");
            bindFunc(cast(void**)&SteamAPI_ISteamUser_BIsBehindNAT, "SteamAPI_ISteamUser_BIsBehindNAT");
            bindFunc(cast(void**)&SteamAPI_ISteamUser_AdvertiseGame, "SteamAPI_ISteamUser_AdvertiseGame");
            bindFunc(cast(void**)&SteamAPI_ISteamUser_RequestEncryptedAppTicket, "SteamAPI_ISteamUser_RequestEncryptedAppTicket");
            bindFunc(cast(void**)&SteamAPI_ISteamUser_GetEncryptedAppTicket, "SteamAPI_ISteamUser_GetEncryptedAppTicket");
            bindFunc(cast(void**)&SteamAPI_ISteamUser_GetGameBadgeLevel, "SteamAPI_ISteamUser_GetGameBadgeLevel");
            bindFunc(cast(void**)&SteamAPI_ISteamUser_GetPlayerSteamLevel, "SteamAPI_ISteamUser_GetPlayerSteamLevel");
            bindFunc(cast(void**)&SteamAPI_ISteamUser_RequestStoreAuthURL, "SteamAPI_ISteamUser_RequestStoreAuthURL");

            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetPersonaName, "SteamAPI_ISteamFriends_GetPersonaName");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_SetPersonaName, "SteamAPI_ISteamFriends_SetPersonaName");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetPersonaState, "SteamAPI_ISteamFriends_GetPersonaState");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetFriendCount, "SteamAPI_ISteamFriends_GetFriendCount");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetFriendByIndex, "SteamAPI_ISteamFriends_GetFriendByIndex");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetFriendRelationship, "SteamAPI_ISteamFriends_GetFriendRelationship");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetFriendPersonaState, "SteamAPI_ISteamFriends_GetFriendPersonaState");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetFriendPersonaName, "SteamAPI_ISteamFriends_GetFriendPersonaName");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetFriendGamePlayed, "SteamAPI_ISteamFriends_GetFriendGamePlayed");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetFriendPersonaNameHistory, "SteamAPI_ISteamFriends_GetFriendPersonaNameHistory");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetFriendSteamLevel, "SteamAPI_ISteamFriends_GetFriendSteamLevel");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetPlayerNickname, "SteamAPI_ISteamFriends_GetPlayerNickname");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetFriendsGroupCount, "SteamAPI_ISteamFriends_GetFriendsGroupCount");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetFriendsGroupIDByIndex, "SteamAPI_ISteamFriends_GetFriendsGroupIDByIndex");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetFriendsGroupName, "SteamAPI_ISteamFriends_GetFriendsGroupName");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetFriendsGroupMembersCount, "SteamAPI_ISteamFriends_GetFriendsGroupMembersCount");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetFriendsGroupMembersList, "SteamAPI_ISteamFriends_GetFriendsGroupMembersList");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_HasFriend, "SteamAPI_ISteamFriends_HasFriend");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetClanCount, "SteamAPI_ISteamFriends_GetClanCount");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetClanByIndex, "SteamAPI_ISteamFriends_GetClanByIndex");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetClanName, "SteamAPI_ISteamFriends_GetClanName");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetClanTag, "SteamAPI_ISteamFriends_GetClanTag");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetClanActivityCounts, "SteamAPI_ISteamFriends_GetClanActivityCounts");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_DownloadClanActivityCounts, "SteamAPI_ISteamFriends_DownloadClanActivityCounts");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetFriendCountFromSource, "SteamAPI_ISteamFriends_GetFriendCountFromSource");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetFriendFromSourceByIndex, "SteamAPI_ISteamFriends_GetFriendFromSourceByIndex");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_IsUserInSource, "SteamAPI_ISteamFriends_IsUserInSource");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_SetInGameVoiceSpeaking, "SteamAPI_ISteamFriends_SetInGameVoiceSpeaking");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_ActivateGameOverlay, "SteamAPI_ISteamFriends_ActivateGameOverlay");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_ActivateGameOverlayToUser, "SteamAPI_ISteamFriends_ActivateGameOverlayToUser");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_ActivateGameOverlayToWebPage, "SteamAPI_ISteamFriends_ActivateGameOverlayToWebPage");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_ActivateGameOverlayToStore, "SteamAPI_ISteamFriends_ActivateGameOverlayToStore");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_SetPlayedWith, "SteamAPI_ISteamFriends_SetPlayedWith");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialog, "SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialog");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetSmallFriendAvatar, "SteamAPI_ISteamFriends_GetSmallFriendAvatar");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetMediumFriendAvatar, "SteamAPI_ISteamFriends_GetMediumFriendAvatar");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetLargeFriendAvatar, "SteamAPI_ISteamFriends_GetLargeFriendAvatar");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_RequestUserInformation, "SteamAPI_ISteamFriends_RequestUserInformation");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_RequestClanOfficerList, "SteamAPI_ISteamFriends_RequestClanOfficerList");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetClanOwner, "SteamAPI_ISteamFriends_GetClanOwner");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetClanOfficerCount, "SteamAPI_ISteamFriends_GetClanOfficerCount");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetClanOfficerByIndex, "SteamAPI_ISteamFriends_GetClanOfficerByIndex");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetUserRestrictions, "SteamAPI_ISteamFriends_GetUserRestrictions");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_SetRichPresence, "SteamAPI_ISteamFriends_SetRichPresence");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_ClearRichPresence, "SteamAPI_ISteamFriends_ClearRichPresence");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetFriendRichPresence, "SteamAPI_ISteamFriends_GetFriendRichPresence");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetFriendRichPresenceKeyCount, "SteamAPI_ISteamFriends_GetFriendRichPresenceKeyCount");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetFriendRichPresenceKeyByIndex, "SteamAPI_ISteamFriends_GetFriendRichPresenceKeyByIndex");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_RequestFriendRichPresence, "SteamAPI_ISteamFriends_RequestFriendRichPresence");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_InviteUserToGame, "SteamAPI_ISteamFriends_InviteUserToGame");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetCoplayFriendCount, "SteamAPI_ISteamFriends_GetCoplayFriendCount");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetCoplayFriend, "SteamAPI_ISteamFriends_GetCoplayFriend");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetFriendCoplayTime, "SteamAPI_ISteamFriends_GetFriendCoplayTime");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetFriendCoplayGame, "SteamAPI_ISteamFriends_GetFriendCoplayGame");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_JoinClanChatRoom, "SteamAPI_ISteamFriends_JoinClanChatRoom");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_LeaveClanChatRoom, "SteamAPI_ISteamFriends_LeaveClanChatRoom");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetClanChatMemberCount, "SteamAPI_ISteamFriends_GetClanChatMemberCount");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetChatMemberByIndex, "SteamAPI_ISteamFriends_GetChatMemberByIndex");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_SendClanChatMessage, "SteamAPI_ISteamFriends_SendClanChatMessage");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetClanChatMessage, "SteamAPI_ISteamFriends_GetClanChatMessage");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_IsClanChatAdmin, "SteamAPI_ISteamFriends_IsClanChatAdmin");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_IsClanChatWindowOpenInSteam, "SteamAPI_ISteamFriends_IsClanChatWindowOpenInSteam");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_OpenClanChatWindowInSteam, "SteamAPI_ISteamFriends_OpenClanChatWindowInSteam");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_CloseClanChatWindowInSteam, "SteamAPI_ISteamFriends_CloseClanChatWindowInSteam");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_SetListenForFriendsMessages, "SteamAPI_ISteamFriends_SetListenForFriendsMessages");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_ReplyToFriendMessage, "SteamAPI_ISteamFriends_ReplyToFriendMessage");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetFriendMessage, "SteamAPI_ISteamFriends_GetFriendMessage");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_GetFollowerCount, "SteamAPI_ISteamFriends_GetFollowerCount");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_IsFollowing, "SteamAPI_ISteamFriends_IsFollowing");
            bindFunc(cast(void**)&SteamAPI_ISteamFriends_EnumerateFollowingList, "SteamAPI_ISteamFriends_EnumerateFollowingList");
                
            bindFunc(cast(void**)&SteamAPI_ISteamUtils_GetSecondsSinceAppActive, "SteamAPI_ISteamUtils_GetSecondsSinceAppActive");
            bindFunc(cast(void**)&SteamAPI_ISteamUtils_GetSecondsSinceComputerActive, "SteamAPI_ISteamUtils_GetSecondsSinceComputerActive");
            bindFunc(cast(void**)&SteamAPI_ISteamUtils_GetConnectedUniverse, "SteamAPI_ISteamUtils_GetConnectedUniverse");
            bindFunc(cast(void**)&SteamAPI_ISteamUtils_GetServerRealTime, "SteamAPI_ISteamUtils_GetServerRealTime");
            bindFunc(cast(void**)&SteamAPI_ISteamUtils_GetIPCountry, "SteamAPI_ISteamUtils_GetIPCountry");
            bindFunc(cast(void**)&SteamAPI_ISteamUtils_GetImageSize, "SteamAPI_ISteamUtils_GetImageSize");
            bindFunc(cast(void**)&SteamAPI_ISteamUtils_GetImageRGBA, "SteamAPI_ISteamUtils_GetImageRGBA");
            bindFunc(cast(void**)&SteamAPI_ISteamUtils_GetCSERIPPort, "SteamAPI_ISteamUtils_GetCSERIPPort");
            bindFunc(cast(void**)&SteamAPI_ISteamUtils_GetCurrentBatteryPower, "SteamAPI_ISteamUtils_GetCurrentBatteryPower");
            bindFunc(cast(void**)&SteamAPI_ISteamUtils_GetAppID, "SteamAPI_ISteamUtils_GetAppID");
            bindFunc(cast(void**)&SteamAPI_ISteamUtils_SetOverlayNotificationPosition, "SteamAPI_ISteamUtils_SetOverlayNotificationPosition");
            bindFunc(cast(void**)&SteamAPI_ISteamUtils_IsAPICallCompleted, "SteamAPI_ISteamUtils_IsAPICallCompleted");
            bindFunc(cast(void**)&SteamAPI_ISteamUtils_GetAPICallFailureReason, "SteamAPI_ISteamUtils_GetAPICallFailureReason");
            bindFunc(cast(void**)&SteamAPI_ISteamUtils_GetAPICallResult, "SteamAPI_ISteamUtils_GetAPICallResult");
            bindFunc(cast(void**)&SteamAPI_ISteamUtils_RunFrame, "SteamAPI_ISteamUtils_RunFrame");
            bindFunc(cast(void**)&SteamAPI_ISteamUtils_GetIPCCallCount, "SteamAPI_ISteamUtils_GetIPCCallCount");
            bindFunc(cast(void**)&SteamAPI_ISteamUtils_SetWarningMessageHook, "SteamAPI_ISteamUtils_SetWarningMessageHook");
            bindFunc(cast(void**)&SteamAPI_ISteamUtils_IsOverlayEnabled, "SteamAPI_ISteamUtils_IsOverlayEnabled");
            bindFunc(cast(void**)&SteamAPI_ISteamUtils_BOverlayNeedsPresent, "SteamAPI_ISteamUtils_BOverlayNeedsPresent");
            bindFunc(cast(void**)&SteamAPI_ISteamUtils_CheckFileSignature, "SteamAPI_ISteamUtils_CheckFileSignature");
            bindFunc(cast(void**)&SteamAPI_ISteamUtils_ShowGamepadTextInput, "SteamAPI_ISteamUtils_ShowGamepadTextInput");
            bindFunc(cast(void**)&SteamAPI_ISteamUtils_GetEnteredGamepadTextLength, "SteamAPI_ISteamUtils_GetEnteredGamepadTextLength");
            bindFunc(cast(void**)&SteamAPI_ISteamUtils_GetEnteredGamepadTextInput, "SteamAPI_ISteamUtils_GetEnteredGamepadTextInput");
            bindFunc(cast(void**)&SteamAPI_ISteamUtils_GetSteamUILanguage, "SteamAPI_ISteamUtils_GetSteamUILanguage");
            bindFunc(cast(void**)&SteamAPI_ISteamUtils_IsSteamRunningInVR, "SteamAPI_ISteamUtils_IsSteamRunningInVR");
            bindFunc(cast(void**)&SteamAPI_ISteamUtils_SetOverlayNotificationInset, "SteamAPI_ISteamUtils_SetOverlayNotificationInset"); 

            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_GetFavoriteGameCount, "SteamAPI_ISteamMatchmaking_GetFavoriteGameCount");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_GetFavoriteGame, "SteamAPI_ISteamMatchmaking_GetFavoriteGame");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_AddFavoriteGame, "SteamAPI_ISteamMatchmaking_AddFavoriteGame");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_RemoveFavoriteGame, "SteamAPI_ISteamMatchmaking_RemoveFavoriteGame");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_RequestLobbyList, "SteamAPI_ISteamMatchmaking_RequestLobbyList");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_AddRequestLobbyListStringFilter, "SteamAPI_ISteamMatchmaking_AddRequestLobbyListStringFilter");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_AddRequestLobbyListNumericalFilter, "SteamAPI_ISteamMatchmaking_AddRequestLobbyListNumericalFilter");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_AddRequestLobbyListNearValueFilter, "SteamAPI_ISteamMatchmaking_AddRequestLobbyListNearValueFilter");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable, "SteamAPI_ISteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_AddRequestLobbyListDistanceFilter, "SteamAPI_ISteamMatchmaking_AddRequestLobbyListDistanceFilter");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_AddRequestLobbyListResultCountFilter, "SteamAPI_ISteamMatchmaking_AddRequestLobbyListResultCountFilter");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter, "SteamAPI_ISteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_GetLobbyByIndex, "SteamAPI_ISteamMatchmaking_GetLobbyByIndex");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_CreateLobby, "SteamAPI_ISteamMatchmaking_CreateLobby");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_JoinLobby, "SteamAPI_ISteamMatchmaking_JoinLobby");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_LeaveLobby, "SteamAPI_ISteamMatchmaking_LeaveLobby");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_InviteUserToLobby, "SteamAPI_ISteamMatchmaking_InviteUserToLobby");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_GetNumLobbyMembers, "SteamAPI_ISteamMatchmaking_GetNumLobbyMembers");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_GetLobbyMemberByIndex, "SteamAPI_ISteamMatchmaking_GetLobbyMemberByIndex");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_GetLobbyData, "SteamAPI_ISteamMatchmaking_GetLobbyData");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_SetLobbyData, "SteamAPI_ISteamMatchmaking_SetLobbyData");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_GetLobbyDataCount, "SteamAPI_ISteamMatchmaking_GetLobbyDataCount");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_GetLobbyDataByIndex, "SteamAPI_ISteamMatchmaking_GetLobbyDataByIndex");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_DeleteLobbyData, "SteamAPI_ISteamMatchmaking_DeleteLobbyData");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_GetLobbyMemberData, "SteamAPI_ISteamMatchmaking_GetLobbyMemberData");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_SetLobbyMemberData, "SteamAPI_ISteamMatchmaking_SetLobbyMemberData");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_SendLobbyChatMsg, "SteamAPI_ISteamMatchmaking_SendLobbyChatMsg");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_GetLobbyChatEntry, "SteamAPI_ISteamMatchmaking_GetLobbyChatEntry");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_RequestLobbyData, "SteamAPI_ISteamMatchmaking_RequestLobbyData");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_SetLobbyGameServer, "SteamAPI_ISteamMatchmaking_SetLobbyGameServer");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_GetLobbyGameServer, "SteamAPI_ISteamMatchmaking_GetLobbyGameServer");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_SetLobbyMemberLimit, "SteamAPI_ISteamMatchmaking_SetLobbyMemberLimit");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_GetLobbyMemberLimit, "SteamAPI_ISteamMatchmaking_GetLobbyMemberLimit");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_SetLobbyType, "SteamAPI_ISteamMatchmaking_SetLobbyType");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_SetLobbyJoinable, "SteamAPI_ISteamMatchmaking_SetLobbyJoinable");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_GetLobbyOwner, "SteamAPI_ISteamMatchmaking_GetLobbyOwner");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_SetLobbyOwner, "SteamAPI_ISteamMatchmaking_SetLobbyOwner");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmaking_SetLinkedLobby, "SteamAPI_ISteamMatchmaking_SetLinkedLobby");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingServerListResponse_ServerResponded, "SteamAPI_ISteamMatchmakingServerListResponse_ServerResponded");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingServerListResponse_ServerFailedToRespond, "SteamAPI_ISteamMatchmakingServerListResponse_ServerFailedToRespond");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingServerListResponse_RefreshComplete, "SteamAPI_ISteamMatchmakingServerListResponse_RefreshComplete");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingPingResponse_ServerResponded, "SteamAPI_ISteamMatchmakingPingResponse_ServerResponded");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingPingResponse_ServerFailedToRespond, "SteamAPI_ISteamMatchmakingPingResponse_ServerFailedToRespond");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingPlayersResponse_AddPlayerToList, "SteamAPI_ISteamMatchmakingPlayersResponse_AddPlayerToList");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingPlayersResponse_PlayersFailedToRespond, "SteamAPI_ISteamMatchmakingPlayersResponse_PlayersFailedToRespond");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingPlayersResponse_PlayersRefreshComplete, "SteamAPI_ISteamMatchmakingPlayersResponse_PlayersRefreshComplete");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingRulesResponse_RulesResponded, "SteamAPI_ISteamMatchmakingRulesResponse_RulesResponded");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingRulesResponse_RulesFailedToRespond, "SteamAPI_ISteamMatchmakingRulesResponse_RulesFailedToRespond");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingRulesResponse_RulesRefreshComplete, "SteamAPI_ISteamMatchmakingRulesResponse_RulesRefreshComplete");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingServers_RequestInternetServerList, "SteamAPI_ISteamMatchmakingServers_RequestInternetServerList");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingServers_RequestLANServerList, "SteamAPI_ISteamMatchmakingServers_RequestLANServerList");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingServers_RequestFriendsServerList, "SteamAPI_ISteamMatchmakingServers_RequestFriendsServerList");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingServers_RequestFavoritesServerList, "SteamAPI_ISteamMatchmakingServers_RequestFavoritesServerList");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingServers_RequestHistoryServerList, "SteamAPI_ISteamMatchmakingServers_RequestHistoryServerList");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingServers_RequestSpectatorServerList, "SteamAPI_ISteamMatchmakingServers_RequestSpectatorServerList");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingServers_ReleaseRequest, "SteamAPI_ISteamMatchmakingServers_ReleaseRequest");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingServers_GetServerDetails, "SteamAPI_ISteamMatchmakingServers_GetServerDetails");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingServers_CancelQuery, "SteamAPI_ISteamMatchmakingServers_CancelQuery");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingServers_RefreshQuery, "SteamAPI_ISteamMatchmakingServers_RefreshQuery");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingServers_IsRefreshing, "SteamAPI_ISteamMatchmakingServers_IsRefreshing");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingServers_GetServerCount, "SteamAPI_ISteamMatchmakingServers_GetServerCount");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingServers_RefreshServer, "SteamAPI_ISteamMatchmakingServers_RefreshServer");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingServers_PingServer, "SteamAPI_ISteamMatchmakingServers_PingServer");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingServers_PlayerDetails, "SteamAPI_ISteamMatchmakingServers_PlayerDetails");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingServers_ServerRules, "SteamAPI_ISteamMatchmakingServers_ServerRules");
            bindFunc(cast(void**)&SteamAPI_ISteamMatchmakingServers_CancelServerQuery, "SteamAPI_ISteamMatchmakingServers_CancelServerQuery");   

            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_RequestCurrentStats, "SteamAPI_ISteamUserStats_RequestCurrentStats");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_GetStat, "SteamAPI_ISteamUserStats_GetStat");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_GetStat0, "SteamAPI_ISteamUserStats_GetStat0");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_SetStat, "SteamAPI_ISteamUserStats_SetStat");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_SetStat0, "SteamAPI_ISteamUserStats_SetStat0");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_UpdateAvgRateStat, "SteamAPI_ISteamUserStats_UpdateAvgRateStat");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_GetAchievement, "SteamAPI_ISteamUserStats_GetAchievement");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_SetAchievement, "SteamAPI_ISteamUserStats_SetAchievement");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_ClearAchievement, "SteamAPI_ISteamUserStats_ClearAchievement");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_GetAchievementAndUnlockTime, "SteamAPI_ISteamUserStats_GetAchievementAndUnlockTime");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_StoreStats, "SteamAPI_ISteamUserStats_StoreStats");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_GetAchievementIcon, "SteamAPI_ISteamUserStats_GetAchievementIcon");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_GetAchievementDisplayAttribute, "SteamAPI_ISteamUserStats_GetAchievementDisplayAttribute");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_IndicateAchievementProgress, "SteamAPI_ISteamUserStats_IndicateAchievementProgress");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_GetNumAchievements, "SteamAPI_ISteamUserStats_GetNumAchievements");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_GetAchievementName, "SteamAPI_ISteamUserStats_GetAchievementName");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_RequestUserStats, "SteamAPI_ISteamUserStats_RequestUserStats");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_GetUserStat, "SteamAPI_ISteamUserStats_GetUserStat");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_GetUserStat0, "SteamAPI_ISteamUserStats_GetUserStat0");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_GetUserAchievement, "SteamAPI_ISteamUserStats_GetUserAchievement");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_GetUserAchievementAndUnlockTime, "SteamAPI_ISteamUserStats_GetUserAchievementAndUnlockTime");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_ResetAllStats, "SteamAPI_ISteamUserStats_ResetAllStats");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_FindOrCreateLeaderboard, "SteamAPI_ISteamUserStats_FindOrCreateLeaderboard");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_FindLeaderboard, "SteamAPI_ISteamUserStats_FindLeaderboard");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_GetLeaderboardName, "SteamAPI_ISteamUserStats_GetLeaderboardName");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_GetLeaderboardEntryCount, "SteamAPI_ISteamUserStats_GetLeaderboardEntryCount");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_GetLeaderboardSortMethod, "SteamAPI_ISteamUserStats_GetLeaderboardSortMethod");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_GetLeaderboardDisplayType, "SteamAPI_ISteamUserStats_GetLeaderboardDisplayType");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_DownloadLeaderboardEntries, "SteamAPI_ISteamUserStats_DownloadLeaderboardEntries");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_DownloadLeaderboardEntriesForUsers, "SteamAPI_ISteamUserStats_DownloadLeaderboardEntriesForUsers");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_GetDownloadedLeaderboardEntry, "SteamAPI_ISteamUserStats_GetDownloadedLeaderboardEntry");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_UploadLeaderboardScore, "SteamAPI_ISteamUserStats_UploadLeaderboardScore");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_AttachLeaderboardUGC, "SteamAPI_ISteamUserStats_AttachLeaderboardUGC");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_GetNumberOfCurrentPlayers, "SteamAPI_ISteamUserStats_GetNumberOfCurrentPlayers");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_RequestGlobalAchievementPercentages, "SteamAPI_ISteamUserStats_RequestGlobalAchievementPercentages");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_GetMostAchievedAchievementInfo, "SteamAPI_ISteamUserStats_GetMostAchievedAchievementInfo");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_GetNextMostAchievedAchievementInfo, "SteamAPI_ISteamUserStats_GetNextMostAchievedAchievementInfo");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_GetAchievementAchievedPercent, "SteamAPI_ISteamUserStats_GetAchievementAchievedPercent");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_RequestGlobalStats, "SteamAPI_ISteamUserStats_RequestGlobalStats");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_GetGlobalStat, "SteamAPI_ISteamUserStats_GetGlobalStat");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_GetGlobalStat0, "SteamAPI_ISteamUserStats_GetGlobalStat0");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_GetGlobalStatHistory, "SteamAPI_ISteamUserStats_GetGlobalStatHistory");
            bindFunc(cast(void**)&SteamAPI_ISteamUserStats_GetGlobalStatHistory0, "SteamAPI_ISteamUserStats_GetGlobalStatHistory0");
        }
    }

    public
    {
        this()
        {
            super(libNames);
        }
    }
}

__gshared DerelictSteamworksLoader DerelictSteamworks;

shared static this()
{
    DerelictSteamworks = new DerelictSteamworksLoader();
}

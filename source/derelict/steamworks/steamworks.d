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
    import derelict.steamworks.enums;
    import derelict.steamworks.structs;
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

            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_FileWrite, "SteamAPI_ISteamRemoteStorage_FileWrite");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_FileRead, "SteamAPI_ISteamRemoteStorage_FileRead");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_FileForget, "SteamAPI_ISteamRemoteStorage_FileForget");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_FileDelete, "SteamAPI_ISteamRemoteStorage_FileDelete");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_FileShare, "SteamAPI_ISteamRemoteStorage_FileShare");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_SetSyncPlatforms, "SteamAPI_ISteamRemoteStorage_SetSyncPlatforms");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_FileWriteStreamOpen, "SteamAPI_ISteamRemoteStorage_FileWriteStreamOpen");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_FileWriteStreamWriteChunk, "SteamAPI_ISteamRemoteStorage_FileWriteStreamWriteChunk");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_FileWriteStreamClose, "SteamAPI_ISteamRemoteStorage_FileWriteStreamClose");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_FileWriteStreamCancel, "SteamAPI_ISteamRemoteStorage_FileWriteStreamCancel");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_FileExists, "SteamAPI_ISteamRemoteStorage_FileExists");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_FilePersisted, "SteamAPI_ISteamRemoteStorage_FilePersisted");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_GetFileSize, "SteamAPI_ISteamRemoteStorage_GetFileSize");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_GetFileTimestamp, "SteamAPI_ISteamRemoteStorage_GetFileTimestamp");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_GetSyncPlatforms, "SteamAPI_ISteamRemoteStorage_GetSyncPlatforms");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_GetFileCount, "SteamAPI_ISteamRemoteStorage_GetFileCount");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_GetFileNameAndSize, "SteamAPI_ISteamRemoteStorage_GetFileNameAndSize");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_GetQuota, "SteamAPI_ISteamRemoteStorage_GetQuota");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_IsCloudEnabledForAccount, "SteamAPI_ISteamRemoteStorage_IsCloudEnabledForAccount");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_IsCloudEnabledForApp, "SteamAPI_ISteamRemoteStorage_IsCloudEnabledForApp");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_SetCloudEnabledForApp, "SteamAPI_ISteamRemoteStorage_SetCloudEnabledForApp");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_UGCDownload, "SteamAPI_ISteamRemoteStorage_UGCDownload");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_GetUGCDownloadProgress, "SteamAPI_ISteamRemoteStorage_GetUGCDownloadProgress");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_GetUGCDetails, "SteamAPI_ISteamRemoteStorage_GetUGCDetails");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_UGCRead, "SteamAPI_ISteamRemoteStorage_UGCRead");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_GetCachedUGCCount, "SteamAPI_ISteamRemoteStorage_GetCachedUGCCount");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_GetCachedUGCHandle, "SteamAPI_ISteamRemoteStorage_GetCachedUGCHandle");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_PublishWorkshopFile, "SteamAPI_ISteamRemoteStorage_PublishWorkshopFile");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_CreatePublishedFileUpdateRequest, "SteamAPI_ISteamRemoteStorage_CreatePublishedFileUpdateRequest");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_UpdatePublishedFileFile, "SteamAPI_ISteamRemoteStorage_UpdatePublishedFileFile");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_UpdatePublishedFilePreviewFile, "SteamAPI_ISteamRemoteStorage_UpdatePublishedFilePreviewFile");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_UpdatePublishedFileTitle, "SteamAPI_ISteamRemoteStorage_UpdatePublishedFileTitle");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_UpdatePublishedFileDescription, "SteamAPI_ISteamRemoteStorage_UpdatePublishedFileDescription");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_UpdatePublishedFileVisibility, "SteamAPI_ISteamRemoteStorage_UpdatePublishedFileVisibility");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_UpdatePublishedFileTags, "SteamAPI_ISteamRemoteStorage_UpdatePublishedFileTags");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_CommitPublishedFileUpdate, "SteamAPI_ISteamRemoteStorage_CommitPublishedFileUpdate");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_GetPublishedFileDetails, "SteamAPI_ISteamRemoteStorage_GetPublishedFileDetails");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_DeletePublishedFile, "SteamAPI_ISteamRemoteStorage_DeletePublishedFile");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_EnumerateUserPublishedFiles, "SteamAPI_ISteamRemoteStorage_EnumerateUserPublishedFiles");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_SubscribePublishedFile, "SteamAPI_ISteamRemoteStorage_SubscribePublishedFile");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_EnumerateUserSubscribedFiles, "SteamAPI_ISteamRemoteStorage_EnumerateUserSubscribedFiles");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_UnsubscribePublishedFile, "SteamAPI_ISteamRemoteStorage_UnsubscribePublishedFile");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_UpdatePublishedFileSetChangeDescription, "SteamAPI_ISteamRemoteStorage_UpdatePublishedFileSetChangeDescription");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_GetPublishedItemVoteDetails, "SteamAPI_ISteamRemoteStorage_GetPublishedItemVoteDetails");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_UpdateUserPublishedItemVote, "SteamAPI_ISteamRemoteStorage_UpdateUserPublishedItemVote");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_GetUserPublishedItemVoteDetails, "SteamAPI_ISteamRemoteStorage_GetUserPublishedItemVoteDetails");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_EnumerateUserSharedWorkshopFiles, "SteamAPI_ISteamRemoteStorage_EnumerateUserSharedWorkshopFiles");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_PublishVideo, "SteamAPI_ISteamRemoteStorage_PublishVideo");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_SetUserPublishedFileAction, "SteamAPI_ISteamRemoteStorage_SetUserPublishedFileAction");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_EnumeratePublishedFilesByUserAction, "SteamAPI_ISteamRemoteStorage_EnumeratePublishedFilesByUserAction");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_EnumeratePublishedWorkshopFiles, "SteamAPI_ISteamRemoteStorage_EnumeratePublishedWorkshopFiles");
            bindFunc(cast(void**)&SteamAPI_ISteamRemoteStorage_UGCDownloadToLocation, "SteamAPI_ISteamRemoteStorage_UGCDownloadToLocation");

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

            bindFunc(cast(void**)&SteamAPI_ISteamApps_BIsSubscribed, "SteamAPI_ISteamApps_BIsSubscribed");
            bindFunc(cast(void**)&SteamAPI_ISteamApps_BIsLowViolence, "SteamAPI_ISteamApps_BIsLowViolence");
            bindFunc(cast(void**)&SteamAPI_ISteamApps_BIsCybercafe, "SteamAPI_ISteamApps_BIsCybercafe");
            bindFunc(cast(void**)&SteamAPI_ISteamApps_BIsVACBanned, "SteamAPI_ISteamApps_BIsVACBanned");
            bindFunc(cast(void**)&SteamAPI_ISteamApps_GetCurrentGameLanguage, "SteamAPI_ISteamApps_GetCurrentGameLanguage");
            bindFunc(cast(void**)&SteamAPI_ISteamApps_GetAvailableGameLanguages, "SteamAPI_ISteamApps_GetAvailableGameLanguages");
            bindFunc(cast(void**)&SteamAPI_ISteamApps_BIsSubscribedApp, "SteamAPI_ISteamApps_BIsSubscribedApp");
            bindFunc(cast(void**)&SteamAPI_ISteamApps_BIsDlcInstalled, "SteamAPI_ISteamApps_BIsDlcInstalled");
            bindFunc(cast(void**)&SteamAPI_ISteamApps_GetEarliestPurchaseUnixTime, "SteamAPI_ISteamApps_GetEarliestPurchaseUnixTime");
            bindFunc(cast(void**)&SteamAPI_ISteamApps_BIsSubscribedFromFreeWeekend, "SteamAPI_ISteamApps_BIsSubscribedFromFreeWeekend");
            bindFunc(cast(void**)&SteamAPI_ISteamApps_GetDLCCount, "SteamAPI_ISteamApps_GetDLCCount");
            bindFunc(cast(void**)&SteamAPI_ISteamApps_BGetDLCDataByIndex, "SteamAPI_ISteamApps_BGetDLCDataByIndex");
            bindFunc(cast(void**)&SteamAPI_ISteamApps_InstallDLC, "SteamAPI_ISteamApps_InstallDLC");
            bindFunc(cast(void**)&SteamAPI_ISteamApps_UninstallDLC, "SteamAPI_ISteamApps_UninstallDLC");
            bindFunc(cast(void**)&SteamAPI_ISteamApps_RequestAppProofOfPurchaseKey, "SteamAPI_ISteamApps_RequestAppProofOfPurchaseKey");
            bindFunc(cast(void**)&SteamAPI_ISteamApps_GetCurrentBetaName, "SteamAPI_ISteamApps_GetCurrentBetaName");
            bindFunc(cast(void**)&SteamAPI_ISteamApps_MarkContentCorrupt, "SteamAPI_ISteamApps_MarkContentCorrupt");
            bindFunc(cast(void**)&SteamAPI_ISteamApps_GetInstalledDepots, "SteamAPI_ISteamApps_GetInstalledDepots");
            bindFunc(cast(void**)&SteamAPI_ISteamApps_GetAppInstallDir, "SteamAPI_ISteamApps_GetAppInstallDir");
            bindFunc(cast(void**)&SteamAPI_ISteamApps_BIsAppInstalled, "SteamAPI_ISteamApps_BIsAppInstalled");
            bindFunc(cast(void**)&SteamAPI_ISteamApps_GetAppOwner, "SteamAPI_ISteamApps_GetAppOwner");
            bindFunc(cast(void**)&SteamAPI_ISteamApps_GetLaunchQueryParam, "SteamAPI_ISteamApps_GetLaunchQueryParam");
            bindFunc(cast(void**)&SteamAPI_ISteamApps_GetDlcDownloadProgress, "SteamAPI_ISteamApps_GetDlcDownloadProgress");
            bindFunc(cast(void**)&SteamAPI_ISteamApps_GetAppBuildId, "SteamAPI_ISteamApps_GetAppBuildId");
            
            bindFunc(cast(void**)&SteamAPI_ISteamNetworking_SendP2PPacket, "SteamAPI_ISteamNetworking_SendP2PPacket");
            bindFunc(cast(void**)&SteamAPI_ISteamNetworking_IsP2PPacketAvailable, "SteamAPI_ISteamNetworking_IsP2PPacketAvailable");
            bindFunc(cast(void**)&SteamAPI_ISteamNetworking_ReadP2PPacket, "SteamAPI_ISteamNetworking_ReadP2PPacket");
            bindFunc(cast(void**)&SteamAPI_ISteamNetworking_AcceptP2PSessionWithUser, "SteamAPI_ISteamNetworking_AcceptP2PSessionWithUser");
            bindFunc(cast(void**)&SteamAPI_ISteamNetworking_CloseP2PSessionWithUser, "SteamAPI_ISteamNetworking_CloseP2PSessionWithUser");
            bindFunc(cast(void**)&SteamAPI_ISteamNetworking_CloseP2PChannelWithUser, "SteamAPI_ISteamNetworking_CloseP2PChannelWithUser");
            bindFunc(cast(void**)&SteamAPI_ISteamNetworking_GetP2PSessionState, "SteamAPI_ISteamNetworking_GetP2PSessionState");
            bindFunc(cast(void**)&SteamAPI_ISteamNetworking_AllowP2PPacketRelay, "SteamAPI_ISteamNetworking_AllowP2PPacketRelay");
            bindFunc(cast(void**)&SteamAPI_ISteamNetworking_CreateListenSocket, "SteamAPI_ISteamNetworking_CreateListenSocket");
            bindFunc(cast(void**)&SteamAPI_ISteamNetworking_CreateP2PConnectionSocket, "SteamAPI_ISteamNetworking_CreateP2PConnectionSocket");
            bindFunc(cast(void**)&SteamAPI_ISteamNetworking_CreateConnectionSocket, "SteamAPI_ISteamNetworking_CreateConnectionSocket");
            bindFunc(cast(void**)&SteamAPI_ISteamNetworking_DestroySocket, "SteamAPI_ISteamNetworking_DestroySocket");
            bindFunc(cast(void**)&SteamAPI_ISteamNetworking_DestroyListenSocket, "SteamAPI_ISteamNetworking_DestroyListenSocket");
            bindFunc(cast(void**)&SteamAPI_ISteamNetworking_SendDataOnSocket, "SteamAPI_ISteamNetworking_SendDataOnSocket");
            bindFunc(cast(void**)&SteamAPI_ISteamNetworking_IsDataAvailableOnSocket, "SteamAPI_ISteamNetworking_IsDataAvailableOnSocket");
            bindFunc(cast(void**)&SteamAPI_ISteamNetworking_RetrieveDataFromSocket, "SteamAPI_ISteamNetworking_RetrieveDataFromSocket");
            bindFunc(cast(void**)&SteamAPI_ISteamNetworking_IsDataAvailable, "SteamAPI_ISteamNetworking_IsDataAvailable");
            bindFunc(cast(void**)&SteamAPI_ISteamNetworking_RetrieveData, "SteamAPI_ISteamNetworking_RetrieveData");
            bindFunc(cast(void**)&SteamAPI_ISteamNetworking_GetSocketInfo, "SteamAPI_ISteamNetworking_GetSocketInfo");
            bindFunc(cast(void**)&SteamAPI_ISteamNetworking_GetListenSocketInfo, "SteamAPI_ISteamNetworking_GetListenSocketInfo");
            bindFunc(cast(void**)&SteamAPI_ISteamNetworking_GetSocketConnectionType, "SteamAPI_ISteamNetworking_GetSocketConnectionType");
            bindFunc(cast(void**)&SteamAPI_ISteamNetworking_GetMaxPacketSize, "SteamAPI_ISteamNetworking_GetMaxPacketSize");
            
            bindFunc(cast(void**)&SteamAPI_ISteamScreenshots_WriteScreenshot, "SteamAPI_ISteamScreenshots_WriteScreenshot");
            bindFunc(cast(void**)&SteamAPI_ISteamScreenshots_AddScreenshotToLibrary, "SteamAPI_ISteamScreenshots_AddScreenshotToLibrary");
            bindFunc(cast(void**)&SteamAPI_ISteamScreenshots_TriggerScreenshot, "SteamAPI_ISteamScreenshots_TriggerScreenshot");
            bindFunc(cast(void**)&SteamAPI_ISteamScreenshots_HookScreenshots, "SteamAPI_ISteamScreenshots_HookScreenshots");
            bindFunc(cast(void**)&SteamAPI_ISteamScreenshots_SetLocation, "SteamAPI_ISteamScreenshots_SetLocation");
            bindFunc(cast(void**)&SteamAPI_ISteamScreenshots_TagUser, "SteamAPI_ISteamScreenshots_TagUser");
            bindFunc(cast(void**)&SteamAPI_ISteamScreenshots_TagPublishedFile, "SteamAPI_ISteamScreenshots_TagPublishedFile");
            
            bindFunc(cast(void**)&SteamAPI_ISteamMusic_BIsEnabled, "SteamAPI_ISteamMusic_BIsEnabled");
            bindFunc(cast(void**)&SteamAPI_ISteamMusic_BIsPlaying, "SteamAPI_ISteamMusic_BIsPlaying");
            bindFunc(cast(void**)&SteamAPI_ISteamMusic_GetPlaybackStatus, "SteamAPI_ISteamMusic_GetPlaybackStatus");
            bindFunc(cast(void**)&SteamAPI_ISteamMusic_Play, "SteamAPI_ISteamMusic_Play");
            bindFunc(cast(void**)&SteamAPI_ISteamMusic_Pause, "SteamAPI_ISteamMusic_Pause");
            bindFunc(cast(void**)&SteamAPI_ISteamMusic_PlayPrevious, "SteamAPI_ISteamMusic_PlayPrevious");
            bindFunc(cast(void**)&SteamAPI_ISteamMusic_PlayNext, "SteamAPI_ISteamMusic_PlayNext");
            bindFunc(cast(void**)&SteamAPI_ISteamMusic_SetVolume, "SteamAPI_ISteamMusic_SetVolume");
            bindFunc(cast(void**)&SteamAPI_ISteamMusic_GetVolume, "SteamAPI_ISteamMusic_GetVolume");
            
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_RegisterSteamMusicRemote, "SteamAPI_ISteamMusicRemote_RegisterSteamMusicRemote");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_DeregisterSteamMusicRemote, "SteamAPI_ISteamMusicRemote_DeregisterSteamMusicRemote");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_BIsCurrentMusicRemote, "SteamAPI_ISteamMusicRemote_BIsCurrentMusicRemote");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_BActivationSuccess, "SteamAPI_ISteamMusicRemote_BActivationSuccess");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_SetDisplayName, "SteamAPI_ISteamMusicRemote_SetDisplayName");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_SetPNGIcon_64x64, "SteamAPI_ISteamMusicRemote_SetPNGIcon_64x64");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_EnablePlayPrevious, "SteamAPI_ISteamMusicRemote_EnablePlayPrevious");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_EnablePlayNext, "SteamAPI_ISteamMusicRemote_EnablePlayNext");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_EnableShuffled, "SteamAPI_ISteamMusicRemote_EnableShuffled");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_EnableLooped, "SteamAPI_ISteamMusicRemote_EnableLooped");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_EnableQueue, "SteamAPI_ISteamMusicRemote_EnableQueue");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_EnablePlaylists, "SteamAPI_ISteamMusicRemote_EnablePlaylists");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_UpdatePlaybackStatus, "SteamAPI_ISteamMusicRemote_UpdatePlaybackStatus");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_UpdateShuffled, "SteamAPI_ISteamMusicRemote_UpdateShuffled");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_UpdateLooped, "SteamAPI_ISteamMusicRemote_UpdateLooped");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_UpdateVolume, "SteamAPI_ISteamMusicRemote_UpdateVolume");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_CurrentEntryWillChange, "SteamAPI_ISteamMusicRemote_CurrentEntryWillChange");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_CurrentEntryIsAvailable, "SteamAPI_ISteamMusicRemote_CurrentEntryIsAvailable");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_UpdateCurrentEntryText, "SteamAPI_ISteamMusicRemote_UpdateCurrentEntryText");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_UpdateCurrentEntryElapsedSeconds, "SteamAPI_ISteamMusicRemote_UpdateCurrentEntryElapsedSeconds");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_UpdateCurrentEntryCoverArt, "SteamAPI_ISteamMusicRemote_UpdateCurrentEntryCoverArt");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_CurrentEntryDidChange, "SteamAPI_ISteamMusicRemote_CurrentEntryDidChange");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_QueueWillChange, "SteamAPI_ISteamMusicRemote_QueueWillChange");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_ResetQueueEntries, "SteamAPI_ISteamMusicRemote_ResetQueueEntries");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_SetQueueEntry, "SteamAPI_ISteamMusicRemote_SetQueueEntry");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_SetCurrentQueueEntry, "SteamAPI_ISteamMusicRemote_SetCurrentQueueEntry");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_QueueDidChange, "SteamAPI_ISteamMusicRemote_QueueDidChange");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_PlaylistWillChange, "SteamAPI_ISteamMusicRemote_PlaylistWillChange");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_ResetPlaylistEntries, "SteamAPI_ISteamMusicRemote_ResetPlaylistEntries");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_SetPlaylistEntry, "SteamAPI_ISteamMusicRemote_SetPlaylistEntry");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_SetCurrentPlaylistEntry, "SteamAPI_ISteamMusicRemote_SetCurrentPlaylistEntry");
            bindFunc(cast(void**)&SteamAPI_ISteamMusicRemote_PlaylistDidChange, "SteamAPI_ISteamMusicRemote_PlaylistDidChange");

            bindFunc(cast(void**)&SteamAPI_ISteamHTTP_CreateHTTPRequest, "SteamAPI_ISteamHTTP_CreateHTTPRequest");
            bindFunc(cast(void**)&SteamAPI_ISteamHTTP_SetHTTPRequestContextValue, "SteamAPI_ISteamHTTP_SetHTTPRequestContextValue");
            bindFunc(cast(void**)&SteamAPI_ISteamHTTP_SetHTTPRequestNetworkActivityTimeout, "SteamAPI_ISteamHTTP_SetHTTPRequestNetworkActivityTimeout");
            bindFunc(cast(void**)&SteamAPI_ISteamHTTP_SetHTTPRequestHeaderValue, "SteamAPI_ISteamHTTP_SetHTTPRequestHeaderValue");
            bindFunc(cast(void**)&SteamAPI_ISteamHTTP_SetHTTPRequestGetOrPostParameter, "SteamAPI_ISteamHTTP_SetHTTPRequestGetOrPostParameter");
            bindFunc(cast(void**)&SteamAPI_ISteamHTTP_SendHTTPRequest, "SteamAPI_ISteamHTTP_SendHTTPRequest");
            bindFunc(cast(void**)&SteamAPI_ISteamHTTP_SendHTTPRequestAndStreamResponse, "SteamAPI_ISteamHTTP_SendHTTPRequestAndStreamResponse");
            bindFunc(cast(void**)&SteamAPI_ISteamHTTP_DeferHTTPRequest, "SteamAPI_ISteamHTTP_DeferHTTPRequest");
            bindFunc(cast(void**)&SteamAPI_ISteamHTTP_PrioritizeHTTPRequest, "SteamAPI_ISteamHTTP_PrioritizeHTTPRequest");
            bindFunc(cast(void**)&SteamAPI_ISteamHTTP_GetHTTPResponseHeaderSize, "SteamAPI_ISteamHTTP_GetHTTPResponseHeaderSize");
            bindFunc(cast(void**)&SteamAPI_ISteamHTTP_GetHTTPResponseHeaderValue, "SteamAPI_ISteamHTTP_GetHTTPResponseHeaderValue");
            bindFunc(cast(void**)&SteamAPI_ISteamHTTP_GetHTTPResponseBodySize, "SteamAPI_ISteamHTTP_GetHTTPResponseBodySize");
            bindFunc(cast(void**)&SteamAPI_ISteamHTTP_GetHTTPResponseBodyData, "SteamAPI_ISteamHTTP_GetHTTPResponseBodyData");
            bindFunc(cast(void**)&SteamAPI_ISteamHTTP_GetHTTPStreamingResponseBodyData, "SteamAPI_ISteamHTTP_GetHTTPStreamingResponseBodyData");
            bindFunc(cast(void**)&SteamAPI_ISteamHTTP_ReleaseHTTPRequest, "SteamAPI_ISteamHTTP_ReleaseHTTPRequest");
            bindFunc(cast(void**)&SteamAPI_ISteamHTTP_GetHTTPDownloadProgressPct, "SteamAPI_ISteamHTTP_GetHTTPDownloadProgressPct");
            bindFunc(cast(void**)&SteamAPI_ISteamHTTP_SetHTTPRequestRawPostBody, "SteamAPI_ISteamHTTP_SetHTTPRequestRawPostBody");
            bindFunc(cast(void**)&SteamAPI_ISteamHTTP_CreateCookieContainer, "SteamAPI_ISteamHTTP_CreateCookieContainer");
            bindFunc(cast(void**)&SteamAPI_ISteamHTTP_ReleaseCookieContainer, "SteamAPI_ISteamHTTP_ReleaseCookieContainer");
            bindFunc(cast(void**)&SteamAPI_ISteamHTTP_SetCookie, "SteamAPI_ISteamHTTP_SetCookie");
            bindFunc(cast(void**)&SteamAPI_ISteamHTTP_SetHTTPRequestCookieContainer, "SteamAPI_ISteamHTTP_SetHTTPRequestCookieContainer");
            bindFunc(cast(void**)&SteamAPI_ISteamHTTP_SetHTTPRequestUserAgentInfo, "SteamAPI_ISteamHTTP_SetHTTPRequestUserAgentInfo");
            bindFunc(cast(void**)&SteamAPI_ISteamHTTP_SetHTTPRequestRequiresVerifiedCertificate, "SteamAPI_ISteamHTTP_SetHTTPRequestRequiresVerifiedCertificate");
            bindFunc(cast(void**)&SteamAPI_ISteamHTTP_SetHTTPRequestAbsoluteTimeoutMS, "SteamAPI_ISteamHTTP_SetHTTPRequestAbsoluteTimeoutMS");
            bindFunc(cast(void**)&SteamAPI_ISteamHTTP_GetHTTPRequestWasTimedOut, "SteamAPI_ISteamHTTP_GetHTTPRequestWasTimedOut");
            bindFunc(cast(void**)&SteamAPI_ISteamUnifiedMessages_SendMethod, "SteamAPI_ISteamUnifiedMessages_SendMethod");
            bindFunc(cast(void**)&SteamAPI_ISteamUnifiedMessages_GetMethodResponseInfo, "SteamAPI_ISteamUnifiedMessages_GetMethodResponseInfo");
            bindFunc(cast(void**)&SteamAPI_ISteamUnifiedMessages_GetMethodResponseData, "SteamAPI_ISteamUnifiedMessages_GetMethodResponseData");
            bindFunc(cast(void**)&SteamAPI_ISteamUnifiedMessages_ReleaseMethod, "SteamAPI_ISteamUnifiedMessages_ReleaseMethod");
            bindFunc(cast(void**)&SteamAPI_ISteamUnifiedMessages_SendNotification, "SteamAPI_ISteamUnifiedMessages_SendNotification");
            bindFunc(cast(void**)&SteamAPI_ISteamController_Init, "SteamAPI_ISteamController_Init");
            bindFunc(cast(void**)&SteamAPI_ISteamController_Shutdown, "SteamAPI_ISteamController_Shutdown");
            bindFunc(cast(void**)&SteamAPI_ISteamController_RunFrame, "SteamAPI_ISteamController_RunFrame");
            bindFunc(cast(void**)&SteamAPI_ISteamController_GetControllerState, "SteamAPI_ISteamController_GetControllerState");
            bindFunc(cast(void**)&SteamAPI_ISteamController_TriggerHapticPulse, "SteamAPI_ISteamController_TriggerHapticPulse");
            bindFunc(cast(void**)&SteamAPI_ISteamController_SetOverrideMode, "SteamAPI_ISteamController_SetOverrideMode");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_CreateQueryUserUGCRequest, "SteamAPI_ISteamUGC_CreateQueryUserUGCRequest");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_CreateQueryAllUGCRequest, "SteamAPI_ISteamUGC_CreateQueryAllUGCRequest");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_CreateQueryUGCDetailsRequest, "SteamAPI_ISteamUGC_CreateQueryUGCDetailsRequest");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_SendQueryUGCRequest, "SteamAPI_ISteamUGC_SendQueryUGCRequest");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_GetQueryUGCResult, "SteamAPI_ISteamUGC_GetQueryUGCResult");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_GetQueryUGCPreviewURL, "SteamAPI_ISteamUGC_GetQueryUGCPreviewURL");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_GetQueryUGCMetadata, "SteamAPI_ISteamUGC_GetQueryUGCMetadata");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_GetQueryUGCChildren, "SteamAPI_ISteamUGC_GetQueryUGCChildren");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_GetQueryUGCStatistic, "SteamAPI_ISteamUGC_GetQueryUGCStatistic");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_GetQueryUGCNumAdditionalPreviews, "SteamAPI_ISteamUGC_GetQueryUGCNumAdditionalPreviews");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_GetQueryUGCAdditionalPreview, "SteamAPI_ISteamUGC_GetQueryUGCAdditionalPreview");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_GetQueryUGCNumKeyValueTags, "SteamAPI_ISteamUGC_GetQueryUGCNumKeyValueTags");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_GetQueryUGCKeyValueTag, "SteamAPI_ISteamUGC_GetQueryUGCKeyValueTag");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_ReleaseQueryUGCRequest, "SteamAPI_ISteamUGC_ReleaseQueryUGCRequest");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_AddRequiredTag, "SteamAPI_ISteamUGC_AddRequiredTag");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_AddExcludedTag, "SteamAPI_ISteamUGC_AddExcludedTag");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_SetReturnKeyValueTags, "SteamAPI_ISteamUGC_SetReturnKeyValueTags");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_SetReturnLongDescription, "SteamAPI_ISteamUGC_SetReturnLongDescription");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_SetReturnMetadata, "SteamAPI_ISteamUGC_SetReturnMetadata");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_SetReturnChildren, "SteamAPI_ISteamUGC_SetReturnChildren");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_SetReturnAdditionalPreviews, "SteamAPI_ISteamUGC_SetReturnAdditionalPreviews");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_SetReturnTotalOnly, "SteamAPI_ISteamUGC_SetReturnTotalOnly");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_SetLanguage, "SteamAPI_ISteamUGC_SetLanguage");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_SetAllowCachedResponse, "SteamAPI_ISteamUGC_SetAllowCachedResponse");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_SetCloudFileNameFilter, "SteamAPI_ISteamUGC_SetCloudFileNameFilter");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_SetMatchAnyTag, "SteamAPI_ISteamUGC_SetMatchAnyTag");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_SetSearchText, "SteamAPI_ISteamUGC_SetSearchText");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_SetRankedByTrendDays, "SteamAPI_ISteamUGC_SetRankedByTrendDays");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_AddRequiredKeyValueTag, "SteamAPI_ISteamUGC_AddRequiredKeyValueTag");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_RequestUGCDetails, "SteamAPI_ISteamUGC_RequestUGCDetails");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_CreateItem, "SteamAPI_ISteamUGC_CreateItem");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_StartItemUpdate, "SteamAPI_ISteamUGC_StartItemUpdate");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_SetItemTitle, "SteamAPI_ISteamUGC_SetItemTitle");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_SetItemDescription, "SteamAPI_ISteamUGC_SetItemDescription");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_SetItemUpdateLanguage, "SteamAPI_ISteamUGC_SetItemUpdateLanguage");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_SetItemMetadata, "SteamAPI_ISteamUGC_SetItemMetadata");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_SetItemVisibility, "SteamAPI_ISteamUGC_SetItemVisibility");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_SetItemTags, "SteamAPI_ISteamUGC_SetItemTags");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_SetItemContent, "SteamAPI_ISteamUGC_SetItemContent");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_SetItemPreview, "SteamAPI_ISteamUGC_SetItemPreview");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_RemoveItemKeyValueTags, "SteamAPI_ISteamUGC_RemoveItemKeyValueTags");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_AddItemKeyValueTag, "SteamAPI_ISteamUGC_AddItemKeyValueTag");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_SubmitItemUpdate, "SteamAPI_ISteamUGC_SubmitItemUpdate");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_GetItemUpdateProgress, "SteamAPI_ISteamUGC_GetItemUpdateProgress");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_SetUserItemVote, "SteamAPI_ISteamUGC_SetUserItemVote");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_GetUserItemVote, "SteamAPI_ISteamUGC_GetUserItemVote");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_AddItemToFavorites, "SteamAPI_ISteamUGC_AddItemToFavorites");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_RemoveItemFromFavorites, "SteamAPI_ISteamUGC_RemoveItemFromFavorites");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_SubscribeItem, "SteamAPI_ISteamUGC_SubscribeItem");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_UnsubscribeItem, "SteamAPI_ISteamUGC_UnsubscribeItem");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_GetNumSubscribedItems, "SteamAPI_ISteamUGC_GetNumSubscribedItems");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_GetSubscribedItems, "SteamAPI_ISteamUGC_GetSubscribedItems");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_GetItemState, "SteamAPI_ISteamUGC_GetItemState");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_GetItemInstallInfo, "SteamAPI_ISteamUGC_GetItemInstallInfo");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_GetItemDownloadInfo, "SteamAPI_ISteamUGC_GetItemDownloadInfo");
            bindFunc(cast(void**)&SteamAPI_ISteamUGC_DownloadItem, "SteamAPI_ISteamUGC_DownloadItem");
            bindFunc(cast(void**)&SteamAPI_ISteamAppList_GetNumInstalledApps, "SteamAPI_ISteamAppList_GetNumInstalledApps");
            bindFunc(cast(void**)&SteamAPI_ISteamAppList_GetInstalledApps, "SteamAPI_ISteamAppList_GetInstalledApps");
            bindFunc(cast(void**)&SteamAPI_ISteamAppList_GetAppName, "SteamAPI_ISteamAppList_GetAppName");
            bindFunc(cast(void**)&SteamAPI_ISteamAppList_GetAppInstallDir, "SteamAPI_ISteamAppList_GetAppInstallDir");
            bindFunc(cast(void**)&SteamAPI_ISteamAppList_GetAppBuildId, "SteamAPI_ISteamAppList_GetAppBuildId");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_DestructISteamHTMLSurface, "SteamAPI_ISteamHTMLSurface_DestructISteamHTMLSurface");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_Init, "SteamAPI_ISteamHTMLSurface_Init");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_Shutdown, "SteamAPI_ISteamHTMLSurface_Shutdown");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_CreateBrowser, "SteamAPI_ISteamHTMLSurface_CreateBrowser");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_RemoveBrowser, "SteamAPI_ISteamHTMLSurface_RemoveBrowser");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_LoadURL, "SteamAPI_ISteamHTMLSurface_LoadURL");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_SetSize, "SteamAPI_ISteamHTMLSurface_SetSize");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_StopLoad, "SteamAPI_ISteamHTMLSurface_StopLoad");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_Reload, "SteamAPI_ISteamHTMLSurface_Reload");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_GoBack, "SteamAPI_ISteamHTMLSurface_GoBack");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_GoForward, "SteamAPI_ISteamHTMLSurface_GoForward");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_AddHeader, "SteamAPI_ISteamHTMLSurface_AddHeader");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_ExecuteJavascript, "SteamAPI_ISteamHTMLSurface_ExecuteJavascript");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_MouseUp, "SteamAPI_ISteamHTMLSurface_MouseUp");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_MouseDown, "SteamAPI_ISteamHTMLSurface_MouseDown");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_MouseDoubleClick, "SteamAPI_ISteamHTMLSurface_MouseDoubleClick");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_MouseMove, "SteamAPI_ISteamHTMLSurface_MouseMove");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_MouseWheel, "SteamAPI_ISteamHTMLSurface_MouseWheel");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_KeyDown, "SteamAPI_ISteamHTMLSurface_KeyDown");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_KeyUp, "SteamAPI_ISteamHTMLSurface_KeyUp");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_KeyChar, "SteamAPI_ISteamHTMLSurface_KeyChar");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_SetHorizontalScroll, "SteamAPI_ISteamHTMLSurface_SetHorizontalScroll");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_SetVerticalScroll, "SteamAPI_ISteamHTMLSurface_SetVerticalScroll");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_SetKeyFocus, "SteamAPI_ISteamHTMLSurface_SetKeyFocus");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_ViewSource, "SteamAPI_ISteamHTMLSurface_ViewSource");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_CopyToClipboard, "SteamAPI_ISteamHTMLSurface_CopyToClipboard");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_PasteFromClipboard, "SteamAPI_ISteamHTMLSurface_PasteFromClipboard");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_Find, "SteamAPI_ISteamHTMLSurface_Find");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_StopFind, "SteamAPI_ISteamHTMLSurface_StopFind");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_GetLinkAtPosition, "SteamAPI_ISteamHTMLSurface_GetLinkAtPosition");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_SetCookie, "SteamAPI_ISteamHTMLSurface_SetCookie");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_SetPageScaleFactor, "SteamAPI_ISteamHTMLSurface_SetPageScaleFactor");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_SetBackgroundMode, "SteamAPI_ISteamHTMLSurface_SetBackgroundMode");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_AllowStartRequest, "SteamAPI_ISteamHTMLSurface_AllowStartRequest");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_JSDialogResponse, "SteamAPI_ISteamHTMLSurface_JSDialogResponse");
            bindFunc(cast(void**)&SteamAPI_ISteamHTMLSurface_FileLoadDialogResponse, "SteamAPI_ISteamHTMLSurface_FileLoadDialogResponse");
            bindFunc(cast(void**)&SteamAPI_ISteamInventory_GetResultStatus, "SteamAPI_ISteamInventory_GetResultStatus");
            bindFunc(cast(void**)&SteamAPI_ISteamInventory_GetResultItems, "SteamAPI_ISteamInventory_GetResultItems");
            bindFunc(cast(void**)&SteamAPI_ISteamInventory_GetResultTimestamp, "SteamAPI_ISteamInventory_GetResultTimestamp");
            bindFunc(cast(void**)&SteamAPI_ISteamInventory_CheckResultSteamID, "SteamAPI_ISteamInventory_CheckResultSteamID");
            bindFunc(cast(void**)&SteamAPI_ISteamInventory_DestroyResult, "SteamAPI_ISteamInventory_DestroyResult");
            bindFunc(cast(void**)&SteamAPI_ISteamInventory_GetAllItems, "SteamAPI_ISteamInventory_GetAllItems");
            bindFunc(cast(void**)&SteamAPI_ISteamInventory_GetItemsByID, "SteamAPI_ISteamInventory_GetItemsByID");
            bindFunc(cast(void**)&SteamAPI_ISteamInventory_SerializeResult, "SteamAPI_ISteamInventory_SerializeResult");
            bindFunc(cast(void**)&SteamAPI_ISteamInventory_DeserializeResult, "SteamAPI_ISteamInventory_DeserializeResult");
            bindFunc(cast(void**)&SteamAPI_ISteamInventory_GenerateItems, "SteamAPI_ISteamInventory_GenerateItems");
            bindFunc(cast(void**)&SteamAPI_ISteamInventory_GrantPromoItems, "SteamAPI_ISteamInventory_GrantPromoItems");
            bindFunc(cast(void**)&SteamAPI_ISteamInventory_AddPromoItem, "SteamAPI_ISteamInventory_AddPromoItem");
            bindFunc(cast(void**)&SteamAPI_ISteamInventory_AddPromoItems, "SteamAPI_ISteamInventory_AddPromoItems");
            bindFunc(cast(void**)&SteamAPI_ISteamInventory_ConsumeItem, "SteamAPI_ISteamInventory_ConsumeItem");
            bindFunc(cast(void**)&SteamAPI_ISteamInventory_ExchangeItems, "SteamAPI_ISteamInventory_ExchangeItems");
            bindFunc(cast(void**)&SteamAPI_ISteamInventory_TransferItemQuantity, "SteamAPI_ISteamInventory_TransferItemQuantity");
            bindFunc(cast(void**)&SteamAPI_ISteamInventory_SendItemDropHeartbeat, "SteamAPI_ISteamInventory_SendItemDropHeartbeat");
            bindFunc(cast(void**)&SteamAPI_ISteamInventory_TriggerItemDrop, "SteamAPI_ISteamInventory_TriggerItemDrop");
            bindFunc(cast(void**)&SteamAPI_ISteamInventory_TradeItems, "SteamAPI_ISteamInventory_TradeItems");
            bindFunc(cast(void**)&SteamAPI_ISteamInventory_LoadItemDefinitions, "SteamAPI_ISteamInventory_LoadItemDefinitions");
            bindFunc(cast(void**)&SteamAPI_ISteamInventory_GetItemDefinitionIDs, "SteamAPI_ISteamInventory_GetItemDefinitionIDs");
            bindFunc(cast(void**)&SteamAPI_ISteamInventory_GetItemDefinitionProperty, "SteamAPI_ISteamInventory_GetItemDefinitionProperty");
            bindFunc(cast(void**)&SteamAPI_ISteamVideo_GetVideoURL, "SteamAPI_ISteamVideo_GetVideoURL");
            bindFunc(cast(void**)&SteamAPI_ISteamVideo_IsBroadcasting, "SteamAPI_ISteamVideo_IsBroadcasting");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_InitGameServer, "SteamAPI_ISteamGameServer_InitGameServer");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_SetProduct, "SteamAPI_ISteamGameServer_SetProduct");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_SetGameDescription, "SteamAPI_ISteamGameServer_SetGameDescription");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_SetModDir, "SteamAPI_ISteamGameServer_SetModDir");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_SetDedicatedServer, "SteamAPI_ISteamGameServer_SetDedicatedServer");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_LogOn, "SteamAPI_ISteamGameServer_LogOn");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_LogOnAnonymous, "SteamAPI_ISteamGameServer_LogOnAnonymous");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_LogOff, "SteamAPI_ISteamGameServer_LogOff");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_BLoggedOn, "SteamAPI_ISteamGameServer_BLoggedOn");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_BSecure, "SteamAPI_ISteamGameServer_BSecure");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_GetSteamID, "SteamAPI_ISteamGameServer_GetSteamID");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_WasRestartRequested, "SteamAPI_ISteamGameServer_WasRestartRequested");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_SetMaxPlayerCount, "SteamAPI_ISteamGameServer_SetMaxPlayerCount");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_SetBotPlayerCount, "SteamAPI_ISteamGameServer_SetBotPlayerCount");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_SetServerName, "SteamAPI_ISteamGameServer_SetServerName");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_SetMapName, "SteamAPI_ISteamGameServer_SetMapName");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_SetPasswordProtected, "SteamAPI_ISteamGameServer_SetPasswordProtected");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_SetSpectatorPort, "SteamAPI_ISteamGameServer_SetSpectatorPort");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_SetSpectatorServerName, "SteamAPI_ISteamGameServer_SetSpectatorServerName");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_ClearAllKeyValues, "SteamAPI_ISteamGameServer_ClearAllKeyValues");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_SetKeyValue, "SteamAPI_ISteamGameServer_SetKeyValue");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_SetGameTags, "SteamAPI_ISteamGameServer_SetGameTags");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_SetGameData, "SteamAPI_ISteamGameServer_SetGameData");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_SetRegion, "SteamAPI_ISteamGameServer_SetRegion");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_SendUserConnectAndAuthenticate, "SteamAPI_ISteamGameServer_SendUserConnectAndAuthenticate");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_CreateUnauthenticatedUserConnection, "SteamAPI_ISteamGameServer_CreateUnauthenticatedUserConnection");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_SendUserDisconnect, "SteamAPI_ISteamGameServer_SendUserDisconnect");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_BUpdateUserData, "SteamAPI_ISteamGameServer_BUpdateUserData");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_GetAuthSessionTicket, "SteamAPI_ISteamGameServer_GetAuthSessionTicket");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_BeginAuthSession, "SteamAPI_ISteamGameServer_BeginAuthSession");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_EndAuthSession, "SteamAPI_ISteamGameServer_EndAuthSession");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_CancelAuthTicket, "SteamAPI_ISteamGameServer_CancelAuthTicket");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_UserHasLicenseForApp, "SteamAPI_ISteamGameServer_UserHasLicenseForApp");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_RequestUserGroupStatus, "SteamAPI_ISteamGameServer_RequestUserGroupStatus");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_GetGameplayStats, "SteamAPI_ISteamGameServer_GetGameplayStats");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_GetServerReputation, "SteamAPI_ISteamGameServer_GetServerReputation");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_GetPublicIP, "SteamAPI_ISteamGameServer_GetPublicIP");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_HandleIncomingPacket, "SteamAPI_ISteamGameServer_HandleIncomingPacket");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_GetNextOutgoingPacket, "SteamAPI_ISteamGameServer_GetNextOutgoingPacket");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_EnableHeartbeats, "SteamAPI_ISteamGameServer_EnableHeartbeats");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_SetHeartbeatInterval, "SteamAPI_ISteamGameServer_SetHeartbeatInterval");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_ForceHeartbeat, "SteamAPI_ISteamGameServer_ForceHeartbeat");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_AssociateWithClan, "SteamAPI_ISteamGameServer_AssociateWithClan");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServer_ComputeNewPlayerCompatibility, "SteamAPI_ISteamGameServer_ComputeNewPlayerCompatibility");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServerStats_RequestUserStats, "SteamAPI_ISteamGameServerStats_RequestUserStats");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServerStats_GetUserStat, "SteamAPI_ISteamGameServerStats_GetUserStat");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServerStats_GetUserStat0, "SteamAPI_ISteamGameServerStats_GetUserStat0");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServerStats_GetUserAchievement, "SteamAPI_ISteamGameServerStats_GetUserAchievement");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServerStats_SetUserStat, "SteamAPI_ISteamGameServerStats_SetUserStat");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServerStats_SetUserStat0, "SteamAPI_ISteamGameServerStats_SetUserStat0");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServerStats_UpdateUserAvgRateStat, "SteamAPI_ISteamGameServerStats_UpdateUserAvgRateStat");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServerStats_SetUserAchievement, "SteamAPI_ISteamGameServerStats_SetUserAchievement");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServerStats_ClearUserAchievement, "SteamAPI_ISteamGameServerStats_ClearUserAchievement");
            bindFunc(cast(void**)&SteamAPI_ISteamGameServerStats_StoreUserStats, "SteamAPI_ISteamGameServerStats_StoreUserStats");
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

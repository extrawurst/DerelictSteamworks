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

public enum ESteamAPICallFailure
{
    k_ESteamAPICallFailureNone = -1,
    k_ESteamAPICallFailureSteamGone = 0,
    k_ESteamAPICallFailureNetworkFailure = 1,
    k_ESteamAPICallFailureInvalidHandle = 2,
    k_ESteamAPICallFailureMismatchedCallback = 3,
}

public enum EGamepadTextInputMode
{
    k_EGamepadTextInputModeNormal = 0,
    k_EGamepadTextInputModePassword = 1,
}

public enum EGamepadTextInputLineMode
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
};

alias CSteamID = uint64;
//align(1)struct CSteamID{uint64 dat;}
extern(C++) interface CGameID{}


module derelict.steamworks.osxHelpers;

version(OSX):

import derelict.steamworks.types;
import derelict.steamworks.interfaces;

@nogc nothrow extern(C):

uint64 osx_SteamAPI_ISteamFriends_GetFriendByIndex(intptr_t instancePtr, int iFriend, int iFriendFlags)
{
    ISteamFriends friends = cast(ISteamFriends)instancePtr;

    return friends.GetFriendByIndex(iFriend,iFriendFlags);
}

const(char)* osx_SteamAPI_ISteamFriends_GetFriendPersonaName(intptr_t instancePtr, CSteamID steamIDFriend)
{
    ISteamFriends friends = cast(ISteamFriends)instancePtr;
    
    return friends.GetFriendPersonaName(steamIDFriend);
}
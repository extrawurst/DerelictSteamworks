import std.stdio;
import std.conv;

import derelict.steamworks.steamworks;

nothrow extern(C) void warnCallback(int severity, const char * str)
{
    try writefln("WARN: %s",str);
    catch{}
}

void main()
{
	writeln("startup");
    scope(exit) writefln("steam was shutdown");

    DerelictSteamworks.load();

    writefln("steam running: %s",SteamAPI_IsSteamRunning());

    auto res = SteamAPI_Init();

    writefln("steam api init: %s",res);

    if(res)
    {
        auto client = SteamClient();

        auto pipe = SteamAPI_ISteamClient_CreateSteamPipe(client);

        assert(pipe != 0);

        {
            auto utils = SteamAPI_ISteamClient_GetISteamUtils(client, pipe, "");

            assert(utils);
            
            //utils.SetWarningMessageHook(&warnCallback);

            //writefln("seconds since start: %s(%s)",utils.GetSecondsSinceComputerActive(),utils.GetSecondsSinceAppActive());
            
            writefln("servertime: %s",SteamAPI_ISteamUtils_GetServerRealTime(utils));

            /+writefln("country: %s",to!string(utils.GetIPCountry()));
            
            writefln("battery: %s",utils.GetCurrentBatteryPower());

            writefln("universe: %s",utils.GetConnectedUniverse());
            +/
        }

        //{
            auto usrPipe = SteamAPI_ISteamClient_ConnectToGlobalUser(client, pipe);

            assert(usrPipe);

            auto usr = SteamAPI_ISteamClient_GetISteamUser(client, usrPipe, pipe, "");

            assert(usr);

            writefln("steam usr loggedIn: %s",SteamAPI_ISteamUser_BLoggedOn(usr));
            /+
            char[256] buff;
            res = usr.GetUserDataFolder(buff.ptr, 256);
            import std.c.string:strlen;
            writefln("steam usr path: (%s) '%s'",res,buff[0..strlen(buff.ptr)]);

            writefln("steam usr steamlevel: %s",usr.GetPlayerSteamLevel());
        }

        auto friends = SteamFriends();
        writefln("name: %s",to!string(friends.GetPersonaName()));
        auto state = friends.GetPersonaState();
        writefln("state: %s",state);

        auto friendCnt = friends.GetFriendCount(EFriendFlags.k_EFriendFlagAll);
        writefln("friends cnt: %s",friendCnt);
        foreach(i; 0..friendCnt)
        {
            auto steamId = SteamAPI_ISteamFriends_GetFriendByIndex(cast(void*)friends, i, EFriendFlags.k_EFriendFlagAll);

            auto nick = SteamAPI_ISteamFriends_GetFriendPersonaName(cast(void*)friends,steamId);

            /+auto friendRelation = friends.GetFriendRelationship(steamId);

            auto personState = friends.GetFriendPersonaState(steamId);

            auto level = friends.GetFriendSteamLevel(steamId);

            writefln("friends [%s]: %s,%s,%s,%s,'%s'",i, to!string(friends.GetFriendPersonaName(steamId)), friendRelation, personState, level, nick);+/

            writefln("friends [%s]: %s",i, to!string(nick));
        }
        +/
    }

    SteamAPI_Shutdown();
}

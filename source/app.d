import std.stdio;
import std.conv;

import derelict.steamworks.steamworks;

void main()
{
	writeln("startup");

    DerelictSteamworks.load();

    writefln("steam running: %s",SteamAPI_IsSteamRunning());

    auto res = SteamAPI_Init();
    if(res)
    {
        writefln("steam loaded: %s",res);

        auto usr = SteamUser();
        writefln("steam usr: %s",usr);

        writefln("steam usr loggedIn: %s",usr.BLoggedOn());

        char[256] buff;
        res = usr.GetUserDataFolder(buff.ptr, 256);
        writefln("steam usr path: (%s) '%s'",res,buff);

        writefln("steam usr steamlevel: %s",usr.GetPlayerSteamLevel());

        auto friends = SteamFriends();
        writefln("name: %s",to!string(friends.GetPersonaName()));
    }

    SteamAPI_Shutdown();

    writefln("steam was shutdown");
}

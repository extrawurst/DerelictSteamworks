import std.stdio;

import derelict.steamworks.steamworks;

void main()
{
	writeln("startup");

    DerelictSteamworks.load();

    writefln("steam running: %s",SteamAPI_IsSteamRunning());

    auto res = SteamAPI_Init();

    writefln("steam loaded: %s",res);

    auto usr = SteamUser();
    writefln("steam usr: %s",usr);

    writefln("steam usr loggedIn: %s",usr.BLoggedOn());

    SteamAPI_Shutdown();

    writefln("steam was shutdown");
}

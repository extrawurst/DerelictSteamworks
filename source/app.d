import std.stdio;

import derelict.steamworks.steamworks;

void main()
{
	writeln("startup");

    DerelictSteamworks.load();

    auto res = SteamAPI_Init();

    writefln("steam loaded: %s",res);

    auto usr = SteamUser();
    writefln("steam usr: %s",usr);

    writefln("steam running: %s",SteamAPI_IsSteamRunning());

    SteamAPI_Shutdown();

    writefln("steam was shutdown");
}

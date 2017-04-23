import std.stdio;
import std.conv;

import derelict.steamworks.steamworks;

nothrow extern(C) void warnCallback(int severity, const char * str)
{
    try writefln("WARN: %s",str);
    catch(Throwable){}
}

bool getApiCallResult(T)(ISteamUtils* utils, SteamAPICall_t apicall, ref T resultData, bool* failed)
{
    return SteamAPI_ISteamUtils_GetAPICallResult(utils, apicall, &resultData, resultData.sizeof, T.k_iCallback, failed);
}

void testInventory(intptr_t user, HSteamUser usrPipe, HSteamPipe pipe, uint64 userId)
{
    auto inventory = SteamAPI_ISteamClient_GetISteamInventory(user, usrPipe, pipe, STEAMINVENTORY_INTERFACE_VERSION);
            
    assert(inventory);

    auto apicall = SteamAPI_ISteamInventory_RequestEligiblePromoItemDefinitionsIDs(inventory,userId);

    assert(apicall);

    bool failed;
    while(!SteamAPI_ISteamUtils_IsAPICallCompleted(utils, apicall, &failed))
    {
        //writefln("[inventory] wait for api call to complete (%s)", failed);
    }

    writefln("[inventory] api call completed (failed: %s)", failed);

    SteamInventoryEligiblePromoItemDefIDs_t resultData;

    auto myres = getApiCallResult(utils, apicall, resultData, &failed);

    writefln("[inventory] res: %s", resultData);
}

ISteamUtils* utils;

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
        uint64 userId;

        auto client = SteamClient();

        auto pipe = SteamAPI_ISteamClient_CreateSteamPipe(client);

        assert(pipe != 0);

        utils = SteamAPI_ISteamClient_GetISteamUtils(client, pipe, STEAMUTILS_INTERFACE_VERSION);
        
        assert(utils);

        {
            SteamAPI_ISteamUtils_SetWarningMessageHook(utils, &warnCallback);

            writefln("appid: %s",SteamAPI_ISteamUtils_GetAppID(utils));

            writefln("seconds since start: %s(%s)",SteamAPI_ISteamUtils_GetSecondsSinceComputerActive(utils), SteamAPI_ISteamUtils_GetSecondsSinceAppActive(utils));
            
            writefln("servertime: %s",SteamAPI_ISteamUtils_GetServerRealTime(utils));

            writefln("country: %s",to!string(SteamAPI_ISteamUtils_GetIPCountry(utils)));
            
            writefln("battery: %s",SteamAPI_ISteamUtils_GetCurrentBatteryPower(utils));

            writefln("universe: %s",SteamAPI_ISteamUtils_GetConnectedUniverse(utils));
        }

        auto usrPipe = SteamAPI_ISteamClient_ConnectToGlobalUser(client, pipe);
        
        assert(usrPipe);

        {
            auto usr = SteamAPI_ISteamClient_GetISteamUser(client, usrPipe, pipe, STEAMUSER_INTERFACE_VERSION);
        
            assert(usr);

            writefln("steam usr loggedIn: %s",SteamAPI_ISteamUser_BLoggedOn(usr));

            userId = SteamAPI_ISteamUser_GetSteamID(usr);

            writefln("steam usr id: %s",SteamAPI_ISteamUser_GetSteamID(usr));

            char[256] buff;
            res = SteamAPI_ISteamUser_GetUserDataFolder(usr,buff.ptr, 256);
            import std.c.string:strlen;
            writefln("steam usr path: (%s) '%s'",res,buff[0..strlen(buff.ptr)]);

            writefln("steam usr steamlevel: %s",SteamAPI_ISteamUser_GetPlayerSteamLevel(usr));
        }

        {
            auto friends = SteamAPI_ISteamClient_GetISteamFriends(client, usrPipe, pipe, STEAMFRIENDS_INTERFACE_VERSION);

            assert(friends);

            writefln("name: %s",to!string(SteamAPI_ISteamFriends_GetPersonaName(friends)));

            auto state = SteamAPI_ISteamFriends_GetPersonaState(friends);
            writefln("state: %s",state);

            auto friendCnt = SteamAPI_ISteamFriends_GetFriendCount(friends, EFriendFlags.k_EFriendFlagAll);
            writefln("friends cnt: %s",friendCnt);

            foreach(i; 0..friendCnt)
            {
                auto steamId = SteamAPI_ISteamFriends_GetFriendByIndex(friends, i, EFriendFlags.k_EFriendFlagAll);

                auto nick = SteamAPI_ISteamFriends_GetFriendPersonaName(friends, steamId);

                auto friendRelation = SteamAPI_ISteamFriends_GetFriendRelationship(friends, steamId);

                auto personState = SteamAPI_ISteamFriends_GetFriendPersonaState(friends, steamId);

                auto level = SteamAPI_ISteamFriends_GetFriendSteamLevel(friends, steamId);

                writefln("friends [%s]: '%s',%s,%s,%s",
                    i, 
                    to!string(nick), 
                    friendRelation, personState, level);
            }
        }

        {
            auto matchmaking = SteamAPI_ISteamClient_GetISteamMatchmaking(client, usrPipe, pipe, STEAMMATCHMAKING_INTERFACE_VERSION);
            
            assert(matchmaking);

            auto cnt = SteamAPI_ISteamMatchmaking_GetFavoriteGameCount(matchmaking);

            writefln("[matchmaking] fave game cnt: %s",cnt);

            auto apicall = SteamAPI_ISteamMatchmaking_RequestLobbyList(matchmaking);

            assert(apicall);

            bool failed;
            while(!SteamAPI_ISteamUtils_IsAPICallCompleted(utils, apicall, &failed))
            {
                //writefln("[matchmaking] wait for api call to complete (%s)", failed);
            }

            writefln("[matchmaking] api call completed (failed: %s)", failed);

            LobbyMatchList_t resultData;

            auto myres = getApiCallResult(utils, apicall, resultData, &failed);

            writefln("[matchmaking] res: %s (failed: %s): %s", myres, failed, resultData);

            foreach(i; 0..resultData.m_nLobbiesMatching)
            {
                auto lobby = SteamAPI_ISteamMatchmaking_GetLobbyByIndex(matchmaking, i);
                
                auto memberCount = SteamAPI_ISteamMatchmaking_GetNumLobbyMembers(matchmaking, lobby);
                
                writefln("[matchmaking] lobby: [%s] %s members: %s", i, lobby, memberCount);
            }
        }

        {
            auto userstats = SteamAPI_ISteamClient_GetISteamUserStats(client, usrPipe, pipe, STEAMUSERSTATS_INTERFACE_VERSION);

            auto apicall = SteamAPI_ISteamUserStats_GetNumberOfCurrentPlayers(userstats);

            assert(apicall);

            bool failed;
            while(!SteamAPI_ISteamUtils_IsAPICallCompleted(utils, apicall, &failed))
            {
                //writefln("[matchmaking] wait for api call to complete (%s)", failed);
            }
            
            writefln("[userstats] api call completed (failed: %s)", failed);

            NumberOfCurrentPlayers_t resultData;
            
            auto myres = getApiCallResult(utils, apicall, resultData, &failed);
            
            writefln("[userstats] res: %s (failed: %s): %s", myres, failed, resultData);
        }

        {
            auto remotestore = SteamAPI_ISteamClient_GetISteamRemoteStorage(client, usrPipe, pipe, STEAMREMOTESTORAGE_INTERFACE_VERSION);

            assert(remotestore);

            uint64 total;
            uint64 avail;
            auto qres = SteamAPI_ISteamRemoteStorage_GetQuota(remotestore, &total, &avail);

            assert(qres);

            writefln("[RemoteStorage] GetQuota: %s/%s", avail, total);
        }

        {
            auto music = SteamAPI_ISteamClient_GetISteamMusic(client, usrPipe, pipe, STEAMMUSIC_INTERFACE_VERSION);

            assert(music);

            auto isEnabled = SteamAPI_ISteamMusic_BIsEnabled(music);

            writefln("[music] isenabled: %s", isEnabled);

            auto isPlaying = SteamAPI_ISteamMusic_BIsPlaying(music);

            writefln("[music] isPlaying: %s", isPlaying);

            if(!isPlaying)
            {
                SteamAPI_ISteamMusic_Play(music);
            }
        }

        {
            auto apps = SteamAPI_ISteamClient_GetISteamApps(client, usrPipe, pipe, STEAMAPPS_INTERFACE_VERSION);

            assert(apps);

            auto isSubscribed = SteamAPI_ISteamApps_BIsSubscribed(apps);

            writefln("[apps] isSubscribed: %s", isSubscribed);

            auto lang = SteamAPI_ISteamApps_GetCurrentGameLanguage(apps);

            writefln("[apps] CurrentGameLanguage: %s", to!string(lang));

            auto langsAvail = SteamAPI_ISteamApps_GetAvailableGameLanguages(apps);

            writefln("[apps] AvailableGameLanguages: %s", to!string(langsAvail));
        }

        testInventory(client,usrPipe,pipe,userId);
    }

    SteamAPI_Shutdown();
}
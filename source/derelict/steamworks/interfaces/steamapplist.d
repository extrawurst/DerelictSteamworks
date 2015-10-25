module derelict.steamworks.interfaces.steamapplist;

import derelict.steamworks.enums;
import derelict.steamworks.types;

static immutable const(char)* STEAMAPPLIST_INTERFACE_VERSION = "STEAMAPPLIST_INTERFACE_VERSION001";

mixin SteamAlignment;

struct SteamAppInstalled_t
{
    enum { k_iCallback = k_iSteamAppListCallbacks + 1 };
    AppId_t m_nAppID;
}
        
struct SteamAppUninstalled_t
{
    enum { k_iCallback = k_iSteamAppListCallbacks + 2 };
    AppId_t m_nAppID;
}
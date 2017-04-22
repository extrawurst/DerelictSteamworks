module derelict.steamworks.steamapps;

import derelict.steamworks.enums;
import derelict.steamworks.types;

static immutable int k_cubAppProofOfPurchaseKeyMax = 240;

struct AppProofOfPurchaseKeyResponse_t
{
    enum
    {
        k_iCallback = k_iSteamAppsCallbacks + 21
    }
    EResult m_eResult;
    uint32 m_nAppID;
    uint32 m_cchKeyLength;
    char[k_cubAppProofOfPurchaseKeyMax] m_rgchKey;
};

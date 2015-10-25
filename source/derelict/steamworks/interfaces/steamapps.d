module derelict.steamworks.interfaces.steamapps;

import derelict.steamworks.types;
import derelict.steamworks.enums;

static immutable int k_cubAppProofOfPurchaseKeyMax = 64;

static immutable const(char)* STEAMAPPS_INTERFACE_VERSION = "STEAMAPPS_INTERFACE_VERSION007";

mixin SteamAlignment;

struct DlcInstalled_t
{
    enum { k_iCallback = k_iSteamAppsCallbacks + 5 };
    AppId_t m_nAppID;       // AppID of the DLC
}

enum ERegisterActivationCodeResult
{
    k_ERegisterActivationCodeResultOK = 0,
    k_ERegisterActivationCodeResultFail = 1,
    k_ERegisterActivationCodeResultAlreadyRegistered = 2,
    k_ERegisterActivationCodeResultTimeout = 3,
    k_ERegisterActivationCodeAlreadyOwned = 4,
}

struct RegisterActivationCodeResponse_t
{
    enum { k_iCallback = k_iSteamAppsCallbacks + 8 };
    ERegisterActivationCodeResult m_eResult;
    uint32 m_unPackageRegistered;                       // package that was registered. Only set on success
}

struct AppProofOfPurchaseKeyResponse_t
{
    enum { k_iCallback = k_iSteamAppsCallbacks + 13 };
    EResult m_eResult;
    uint32  m_nAppID;
    char[k_cubAppProofOfPurchaseKeyMax]    m_rgchKey;
}

struct NewLaunchQueryParameters_t
{
    enum { k_iCallback = k_iSteamAppsCallbacks + 14 };
}

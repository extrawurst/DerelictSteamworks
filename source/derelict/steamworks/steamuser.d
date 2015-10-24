module derelict.steamworks.steamuser;

import derelict.steamworks.enums;
import derelict.steamworks.types;
import derelict.steamworks.steamclientpublic;

align(1):

struct SteamServersConnected_t
{
    enum { k_iCallback = k_iSteamUserCallbacks + 1 };
}

struct SteamServerConnectFailure_t
{
    enum { k_iCallback = k_iSteamUserCallbacks + 2 };
    EResult m_eResult;
    bool m_bStillRetrying;
}

struct SteamServersDisconnected_t
{
    enum { k_iCallback = k_iSteamUserCallbacks + 3 };
    EResult m_eResult;
}

struct ClientGameServerDeny_t
{
    enum { k_iCallback = k_iSteamUserCallbacks + 13 };
    
    uint32 m_uAppID;
    uint32 m_unGameServerIP;
    uint16 m_usGameServerPort;
    uint16 m_bSecure;
    uint32 m_uReason;
}

struct IPCFailure_t
{
    enum { k_iCallback = k_iSteamUserCallbacks + 17 };
    enum EFailureType 
    { 
        k_EFailureFlushedCallbackQueue, 
        k_EFailurePipeFail,
    }
    uint8 m_eFailureType;
}

struct LicensesUpdated_t
{
    enum { k_iCallback = k_iSteamUserCallbacks + 25 };
}

struct ValidateAuthTicketResponse_t
{
    enum { k_iCallback = k_iSteamUserCallbacks + 43 };
    CSteamID m_SteamID;
    EAuthSessionResponse m_eAuthSessionResponse;
    CSteamID m_OwnerSteamID; // different from m_SteamID if borrowed
}

struct MicroTxnAuthorizationResponse_t
{
    enum { k_iCallback = k_iSteamUserCallbacks + 52 };
    
    uint32 m_unAppID;           // AppID for this microtransaction
    uint64 m_ulOrderID;         // OrderID provided for the microtransaction
    uint8 m_bAuthorized;        // if user authorized transaction
}

struct EncryptedAppTicketResponse_t
{
    enum { k_iCallback = k_iSteamUserCallbacks + 54 };
    
    EResult m_eResult;
}

struct GetAuthSessionTicketResponse_t
{
    enum { k_iCallback = k_iSteamUserCallbacks + 63 };
    HAuthTicket m_hAuthTicket;
    EResult m_eResult;
}

struct GameWebCallback_t
{
    enum { k_iCallback = k_iSteamUserCallbacks + 64 };
    char[256] m_szURL;
}

struct StoreAuthURLResponse_t
{
    enum { k_iCallback = k_iSteamUserCallbacks + 65 };
    char[512] m_szURL;
}
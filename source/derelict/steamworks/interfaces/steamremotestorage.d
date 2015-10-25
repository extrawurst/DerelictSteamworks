module derelict.steamworks.interfaces.steamremotestorage;

import derelict.steamworks.enums;
import derelict.steamworks.types;

align(1):

struct RemoteStorageFileWriteAsyncComplete_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 31 };
    EResult m_eResult;                      // result
}

struct RemoteStorageFileReadAsyncComplete_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 32 };
    SteamAPICall_t m_hFileReadAsync;        // call handle of the async read which was made
    EResult m_eResult;                      // result
    uint32 m_nOffset;                       // offset in the file this read was at
    uint32 m_cubRead;                       // amount read - will the <= the amount requested
}

static immutable const(char)* STEAMREMOTESTORAGE_INTERFACE_VERSION = "STEAMREMOTESTORAGE_INTERFACE_VERSION013";
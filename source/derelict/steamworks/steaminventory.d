module derelict.steamworks.steaminventory;

import derelict.steamworks.enums;
import derelict.steamworks.types;

align(1) struct SteamInventoryEligiblePromoItemDefIDs_t
{
	enum { k_iCallback = k_iClientInventoryCallbacks + 3 };
	EResult m_result;
	CSteamID m_steamID;
	int m_numEligiblePromoItemDefs;
	bool m_bCachedData;	// indicates that the data was retrieved from the cache and not the server
}

static immutable const(char)* STEAMINVENTORY_INTERFACE_VERSION = "STEAMINVENTORY_INTERFACE_V001";
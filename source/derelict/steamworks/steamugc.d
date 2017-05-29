module derelict.steamworks.steamugc;

import derelict.steamworks.enums;
import derelict.steamworks.types;

enum EItemPreviewType
{
	k_EItemPreviewType_Image							= 0,	// standard image file expected (e.g. jpg, png, gif, etc.)
	k_EItemPreviewType_YouTubeVideo						= 1,	// video id is stored
	k_EItemPreviewType_Sketchfab						= 2,	// model id is stored
	k_EItemPreviewType_EnvironmentMap_HorizontalCross	= 3,	// standard image file expected - cube map in the layout
																// +---+---+-------+
																// |   |Up |       |
																// +---+---+---+---+
																// | L | F | R | B |
																// +---+---+---+---+
																// |   |Dn |       |
																// +---+---+---+---+
	k_EItemPreviewType_EnvironmentMap_LatLong			= 4,	// standard image file expected
	k_EItemPreviewType_ReservedMax						= 255,	// you can specify your own types above this value
}

enum EItemStatistic
{
	k_EItemStatistic_NumSubscriptions					 = 0,
	k_EItemStatistic_NumFavorites						 = 1,
	k_EItemStatistic_NumFollowers						 = 2,
	k_EItemStatistic_NumUniqueSubscriptions				 = 3,
	k_EItemStatistic_NumUniqueFavorites					 = 4,
	k_EItemStatistic_NumUniqueFollowers					 = 5,
	k_EItemStatistic_NumUniqueWebsiteViews				 = 6,
	k_EItemStatistic_ReportScore						 = 7,
	k_EItemStatistic_NumSecondsPlayed					 = 8,
	k_EItemStatistic_NumPlaytimeSessions				 = 9,
	k_EItemStatistic_NumComments						 = 10,
	k_EItemStatistic_NumSecondsPlayedDuringTimePeriod	 = 11,
	k_EItemStatistic_NumPlaytimeSessionsDuringTimePeriod = 12,
}

static immutable const(char)* STEAMUGC_INTERFACE_VERSION = "STEAMUGC_INTERFACE_VERSION010";

//-----------------------------------------------------------------------------
// Purpose: The result of a call to AddDependency
//-----------------------------------------------------------------------------
struct AddUGCDependencyResult_t
{
	enum { k_iCallback = k_iClientUGCCallbacks + 12 }
	EResult m_eResult;
	PublishedFileId_t m_nPublishedFileId;
	PublishedFileId_t m_nChildPublishedFileId;
}

//-----------------------------------------------------------------------------
// Purpose: The result of a call to RemoveDependency
//-----------------------------------------------------------------------------
struct RemoveUGCDependencyResult_t
{
	enum { k_iCallback = k_iClientUGCCallbacks + 13 }
	EResult m_eResult;
	PublishedFileId_t m_nPublishedFileId;
	PublishedFileId_t m_nChildPublishedFileId;
}
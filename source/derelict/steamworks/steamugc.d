module derelict.steamworks.steamugc;

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
};
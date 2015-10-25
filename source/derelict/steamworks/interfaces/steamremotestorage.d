module derelict.steamworks.interfaces.steamremotestorage;

import derelict.steamworks.enums;
import derelict.steamworks.types;

static immutable uint32 k_unMaxCloudFileChunkSize = 100 * 1024 * 1024;

alias UGCHandle_t = uint64;
alias PublishedFileUpdateHandle_t = uint64;
alias PublishedFileId_t = uint64;
static immutable PublishedFileId_t k_PublishedFileIdInvalid = 0;
static immutable UGCHandle_t k_UGCHandleInvalid = 0xffffffffffffffffUL;
static immutable PublishedFileUpdateHandle_t k_PublishedFileUpdateHandleInvalid = 0xffffffffffffffffUL;

alias UGCFileWriteStreamHandle_t = uint64;
static immutable UGCFileWriteStreamHandle_t k_UGCFileStreamHandleInvalid = 0xffffffffffffffffUL;

static immutable uint32 k_cchPublishedDocumentTitleMax = 128 + 1;
static immutable uint32 k_cchPublishedDocumentDescriptionMax = 8000;
static immutable uint32 k_cchPublishedDocumentChangeDescriptionMax = 8000;
static immutable uint32 k_unEnumeratePublishedFilesMaxResults = 50;
static immutable uint32 k_cchTagListMax = 1024 + 1;
static immutable uint32 k_cchFilenameMax = 260;
static immutable uint32 k_cchPublishedFileURLMax = 256;

enum EResolveConflict
{
    k_EResolveConflictKeepClient = 1,       // The local version of each file will be used to overwrite the server version
    k_EResolveConflictKeepServer = 2,       // The server version of each file will be used to overwrite the local version
}

enum ERemoteStoragePlatform
{
    k_ERemoteStoragePlatformNone        = 0,
    k_ERemoteStoragePlatformWindows     = (1 << 0),
    k_ERemoteStoragePlatformOSX         = (1 << 1),
    k_ERemoteStoragePlatformPS3         = (1 << 2),
    k_ERemoteStoragePlatformLinux       = (1 << 3),
    k_ERemoteStoragePlatformReserved2   = (1 << 4),
    
    k_ERemoteStoragePlatformAll = 0xffffffff
}

enum ERemoteStoragePublishedFileVisibility
{
    k_ERemoteStoragePublishedFileVisibilityPublic = 0,
    k_ERemoteStoragePublishedFileVisibilityFriendsOnly = 1,
    k_ERemoteStoragePublishedFileVisibilityPrivate = 2,
}

enum EWorkshopFileType
{
    k_EWorkshopFileTypeFirst = 0,
    
    k_EWorkshopFileTypeCommunity              = 0,      // normal Workshop item that can be subscribed to
    k_EWorkshopFileTypeMicrotransaction       = 1,      // Workshop item that is meant to be voted on for the purpose of selling in-game
    k_EWorkshopFileTypeCollection             = 2,      // a collection of Workshop or Greenlight items
    k_EWorkshopFileTypeArt                    = 3,      // artwork
    k_EWorkshopFileTypeVideo                  = 4,      // external video
    k_EWorkshopFileTypeScreenshot             = 5,      // screenshot
    k_EWorkshopFileTypeGame                   = 6,      // Greenlight game entry
    k_EWorkshopFileTypeSoftware               = 7,      // Greenlight software entry
    k_EWorkshopFileTypeConcept                = 8,      // Greenlight concept
    k_EWorkshopFileTypeWebGuide               = 9,      // Steam web guide
    k_EWorkshopFileTypeIntegratedGuide        = 10,     // application integrated guide
    k_EWorkshopFileTypeMerch                  = 11,     // Workshop merchandise meant to be voted on for the purpose of being sold
    k_EWorkshopFileTypeControllerBinding      = 12,     // Steam Controller bindings
    k_EWorkshopFileTypeSteamworksAccessInvite = 13,     // internal
    k_EWorkshopFileTypeSteamVideo             = 14,     // Steam video
    k_EWorkshopFileTypeGameManagedItem        = 15,     // managed completely by the game, not the user, and not shown on the web

    k_EWorkshopFileTypeMax = 16   
}

enum EWorkshopVote
{
    k_EWorkshopVoteUnvoted = 0,
    k_EWorkshopVoteFor = 1,
    k_EWorkshopVoteAgainst = 2,
    k_EWorkshopVoteLater = 3,
}

enum EWorkshopFileAction
{
    k_EWorkshopFileActionPlayed = 0,
    k_EWorkshopFileActionCompleted = 1,
}

enum EWorkshopEnumerationType
{
    k_EWorkshopEnumerationTypeRankedByVote = 0,
    k_EWorkshopEnumerationTypeRecent = 1,
    k_EWorkshopEnumerationTypeTrending = 2,
    k_EWorkshopEnumerationTypeFavoritesOfFriends = 3,
    k_EWorkshopEnumerationTypeVotedByFriends = 4,
    k_EWorkshopEnumerationTypeContentByFriends = 5,
    k_EWorkshopEnumerationTypeRecentFromFollowedUsers = 6,
}

enum EWorkshopVideoProvider
{
    k_EWorkshopVideoProviderNone = 0,
    k_EWorkshopVideoProviderYoutube = 1
}

enum EUGCReadAction
{
    k_EUGCRead_ContinueReadingUntilFinished = 0,
    k_EUGCRead_ContinueReading = 1,
    k_EUGCRead_Close = 2,   
}

static immutable const(char)* STEAMREMOTESTORAGE_INTERFACE_VERSION = "STEAMREMOTESTORAGE_INTERFACE_VERSION013";

mixin SteamAlignment;

struct SteamParamStringArray_t
{
    const(char)** m_ppStrings;
    int32 m_nNumStrings;
}

struct RemoteStorageAppSyncedClient_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 1 };
    AppId_t m_nAppID;
    EResult m_eResult;
    int m_unNumDownloads;
}

struct RemoteStorageAppSyncedServer_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 2 };
    AppId_t m_nAppID;
    EResult m_eResult;
    int m_unNumUploads;
}

struct RemoteStorageAppSyncProgress_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 3 };
    char[k_cchFilenameMax] m_rgchCurrentFile;               // Current file being transferred
    AppId_t m_nAppID;                           // App this info relates to
    uint32 m_uBytesTransferredThisChunk;        // Bytes transferred this chunk
    double m_dAppPercentComplete;               // Percent complete that this app's transfers are
    bool m_bUploading;                          // if false, downloading
}

//
// IMPORTANT! k_iClientRemoteStorageCallbacks + 4 is used, see iclientremotestorage.h
//

struct RemoteStorageAppSyncStatusCheck_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 5 };
    AppId_t m_nAppID;
    EResult m_eResult;
}

struct RemoteStorageConflictResolution_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 6 };
    AppId_t m_nAppID;
    EResult m_eResult;
}

struct RemoteStorageFileShareResult_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 7 };
    EResult m_eResult;          // The result of the operation
    UGCHandle_t m_hFile;        // The handle that can be shared with users and features
    char[k_cchFilenameMax] m_rgchFilename; // The name of the file that was shared
}

// k_iClientRemoteStorageCallbacks + 8 is deprecated! Do not reuse

struct RemoteStoragePublishFileResult_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 9 };
    EResult m_eResult;              // The result of the operation.
    PublishedFileId_t m_nPublishedFileId;
    bool m_bUserNeedsToAcceptWorkshopLegalAgreement;
}

struct RemoteStorageDeletePublishedFileResult_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 11 };
    EResult m_eResult;              // The result of the operation.
    PublishedFileId_t m_nPublishedFileId;
}

struct RemoteStorageEnumerateUserPublishedFilesResult_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 12 };
    EResult m_eResult;              // The result of the operation.
    int32 m_nResultsReturned;
    int32 m_nTotalResultCount;
    PublishedFileId_t[k_unEnumeratePublishedFilesMaxResults] m_rgPublishedFileId;
}

struct RemoteStorageSubscribePublishedFileResult_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 13 };
    EResult m_eResult;              // The result of the operation.
    PublishedFileId_t m_nPublishedFileId;
}

struct RemoteStorageEnumerateUserSubscribedFilesResult_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 14 };
    EResult m_eResult;              // The result of the operation.
    int32 m_nResultsReturned;
    int32 m_nTotalResultCount;
    PublishedFileId_t[ k_unEnumeratePublishedFilesMaxResults ] m_rgPublishedFileId;
    uint32[ k_unEnumeratePublishedFilesMaxResults ] m_rgRTimeSubscribed;
}

//static assert( RemoteStorageEnumerateUserSubscribedFilesResult_t.sizeof == (1 + 1 + 1 + 50 + 100) * 4 );

struct RemoteStorageUnsubscribePublishedFileResult_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 15 };
    EResult m_eResult;              // The result of the operation.
    PublishedFileId_t m_nPublishedFileId;
}

struct RemoteStorageUpdatePublishedFileResult_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 16 };
    EResult m_eResult;              // The result of the operation.
    PublishedFileId_t m_nPublishedFileId;
    bool m_bUserNeedsToAcceptWorkshopLegalAgreement;
}

struct RemoteStorageDownloadUGCResult_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 17 };
    EResult m_eResult;              // The result of the operation.
    UGCHandle_t m_hFile;            // The handle to the file that was attempted to be downloaded.
    AppId_t m_nAppID;               // ID of the app that created this file.
    int32 m_nSizeInBytes;           // The size of the file that was downloaded, in bytes.
    char[k_cchFilenameMax] m_pchFileName;       // The name of the file that was downloaded. 
    uint64 m_ulSteamIDOwner;        // Steam ID of the user who created this content.
}

struct RemoteStorageGetPublishedFileDetailsResult_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 18 };
    EResult m_eResult;              // The result of the operation.
    PublishedFileId_t m_nPublishedFileId;
    AppId_t m_nCreatorAppID;        // ID of the app that created this file.
    AppId_t m_nConsumerAppID;       // ID of the app that will consume this file.
    char[k_cchPublishedDocumentTitleMax] m_rgchTitle;       // title of document
    char[k_cchPublishedDocumentDescriptionMax] m_rgchDescription;   // description of document
    UGCHandle_t m_hFile;            // The handle of the primary file
    UGCHandle_t m_hPreviewFile;     // The handle of the preview file
    uint64 m_ulSteamIDOwner;        // Steam ID of the user who created this content.
    uint32 m_rtimeCreated;          // time when the published file was created
    uint32 m_rtimeUpdated;          // time when the published file was last updated
    ERemoteStoragePublishedFileVisibility m_eVisibility;
    bool m_bBanned;
    char[k_cchTagListMax] m_rgchTags;   // comma separated list of all tags associated with this file
    bool m_bTagsTruncated;          // whether the list of tags was too long to be returned in the provided buffer
    char[k_cchFilenameMax] m_pchFileName;       // The name of the primary file
    int32 m_nFileSize;              // Size of the primary file
    int32 m_nPreviewFileSize;       // Size of the preview file
    char[k_cchPublishedFileURLMax] m_rgchURL;   // URL (for a video or a website)
    EWorkshopFileType m_eFileType;  // Type of the file
    bool m_bAcceptedForUse;         // developer has specifically flagged this item as accepted in the Workshop
}

struct RemoteStorageEnumerateWorkshopFilesResult_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 19 };
    EResult m_eResult;
    int32 m_nResultsReturned;
    int32 m_nTotalResultCount;
    PublishedFileId_t[ k_unEnumeratePublishedFilesMaxResults ] m_rgPublishedFileId;
    float[ k_unEnumeratePublishedFilesMaxResults ] m_rgScore;
    AppId_t m_nAppId;
    uint32 m_unStartIndex;
}

struct RemoteStorageGetPublishedItemVoteDetailsResult_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 20 };
    EResult m_eResult;
    PublishedFileId_t m_unPublishedFileId;
    int32 m_nVotesFor;
    int32 m_nVotesAgainst;
    int32 m_nReports;
    float m_fScore;
}

struct RemoteStoragePublishedFileSubscribed_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 21 };
    PublishedFileId_t m_nPublishedFileId;   // The published file id
    AppId_t m_nAppID;                       // ID of the app that will consume this file.
}

struct RemoteStoragePublishedFileUnsubscribed_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 22 };
    PublishedFileId_t m_nPublishedFileId;   // The published file id
    AppId_t m_nAppID;                       // ID of the app that will consume this file.
}

struct RemoteStoragePublishedFileDeleted_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 23 };
    PublishedFileId_t m_nPublishedFileId;   // The published file id
    AppId_t m_nAppID;                       // ID of the app that will consume this file.
}

struct RemoteStorageUpdateUserPublishedItemVoteResult_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 24 };
    EResult m_eResult;              // The result of the operation.
    PublishedFileId_t m_nPublishedFileId;   // The published file id
}

struct RemoteStorageUserVoteDetails_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 25 };
    EResult m_eResult;              // The result of the operation.
    PublishedFileId_t m_nPublishedFileId;   // The published file id
    EWorkshopVote m_eVote;          // what the user voted
}

struct RemoteStorageEnumerateUserSharedWorkshopFilesResult_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 26 };
    EResult m_eResult;              // The result of the operation.
    int32 m_nResultsReturned;
    int32 m_nTotalResultCount;
    PublishedFileId_t[ k_unEnumeratePublishedFilesMaxResults ] m_rgPublishedFileId;
}

struct RemoteStorageSetUserPublishedFileActionResult_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 27 };
    EResult m_eResult;              // The result of the operation.
    PublishedFileId_t m_nPublishedFileId;   // The published file id
    EWorkshopFileAction m_eAction;  // the action that was attempted
}

struct RemoteStorageEnumeratePublishedFilesByUserActionResult_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 28 };
    EResult m_eResult;              // The result of the operation.
    EWorkshopFileAction m_eAction;  // the action that was filtered on
    int32 m_nResultsReturned;
    int32 m_nTotalResultCount;
    PublishedFileId_t[ k_unEnumeratePublishedFilesMaxResults ] m_rgPublishedFileId;
    uint32[ k_unEnumeratePublishedFilesMaxResults ] m_rgRTimeUpdated;
}

struct RemoteStoragePublishFileProgress_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 29 };
    double m_dPercentFile;
    bool m_bPreview;
}

struct RemoteStoragePublishedFileUpdated_t
{
    enum { k_iCallback = k_iClientRemoteStorageCallbacks + 30 };
    PublishedFileId_t m_nPublishedFileId;   // The published file id
    AppId_t m_nAppID;                       // ID of the app that will consume this file.
    UGCHandle_t m_hFile;                    // The new content
}

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

module derelict.steamworks.steamcontroller;

import derelict.steamworks.types;

enum STEAM_CONTROLLER_MAX_COUNT = 16;

enum STEAM_CONTROLLER_MAX_ANALOG_ACTIONS = 16;

enum STEAM_CONTROLLER_MAX_DIGITAL_ACTIONS = 128;

enum STEAM_CONTROLLER_MAX_ORIGINS = 8;

// When sending an option to a specific controller handle, you can send to all controllers via this command
enum STEAM_CONTROLLER_HANDLE_ALL_CONTROLLERS = uint64.max;

enum STEAM_CONTROLLER_MIN_ANALOG_ACTION_DATA = -1.0f;
enum STEAM_CONTROLLER_MAX_ANALOG_ACTION_DATA = 1.0f;

enum ESteamControllerPad
{
    k_ESteamControllerPad_Left,
    k_ESteamControllerPad_Right
}

enum EControllerSource
{
    k_EControllerSource_None,
    k_EControllerSource_LeftTrackpad,
    k_EControllerSource_RightTrackpad,
    k_EControllerSource_Joystick,
    k_EControllerSource_ABXY,
    k_EControllerSource_Switch,
    k_EControllerSource_LeftTrigger,
    k_EControllerSource_RightTrigger,
    k_EControllerSource_Gyro,
    k_EControllerSource_CenterTrackpad,		// PS4
    k_EControllerSource_RightJoystick,		// Traditional Controllers
    k_EControllerSource_DPad,
    k_EControllerSource_Count
}

enum EControllerSourceMode
{
    k_EControllerSourceMode_None,
    k_EControllerSourceMode_Dpad,
    k_EControllerSourceMode_Buttons,
    k_EControllerSourceMode_FourButtons,
    k_EControllerSourceMode_AbsoluteMouse,
    k_EControllerSourceMode_RelativeMouse,
    k_EControllerSourceMode_JoystickMove,
    k_EControllerSourceMode_JoystickMouse,
    k_EControllerSourceMode_JoystickCamera,
    k_EControllerSourceMode_ScrollWheel,
    k_EControllerSourceMode_Trigger,
    k_EControllerSourceMode_TouchMenu,
    k_EControllerSourceMode_MouseJoystick,
    k_EControllerSourceMode_MouseRegion,
    k_EControllerSourceMode_RadialMenu,
    k_EControllerSourceMode_SingleButton,
    k_EControllerSourceMode_Switches
}

enum EControllerActionOrigin
{
    k_EControllerActionOrigin_None,
    k_EControllerActionOrigin_A,
    k_EControllerActionOrigin_B,
    k_EControllerActionOrigin_X,
    k_EControllerActionOrigin_Y,
    k_EControllerActionOrigin_LeftBumper,
    k_EControllerActionOrigin_RightBumper,
    k_EControllerActionOrigin_LeftGrip,
    k_EControllerActionOrigin_RightGrip,
    k_EControllerActionOrigin_Start,
    k_EControllerActionOrigin_Back,
    k_EControllerActionOrigin_LeftPad_Touch,
    k_EControllerActionOrigin_LeftPad_Swipe,
    k_EControllerActionOrigin_LeftPad_Click,
    k_EControllerActionOrigin_LeftPad_DPadNorth,
    k_EControllerActionOrigin_LeftPad_DPadSouth,
    k_EControllerActionOrigin_LeftPad_DPadWest,
    k_EControllerActionOrigin_LeftPad_DPadEast,
    k_EControllerActionOrigin_RightPad_Touch,
    k_EControllerActionOrigin_RightPad_Swipe,
    k_EControllerActionOrigin_RightPad_Click,
    k_EControllerActionOrigin_RightPad_DPadNorth,
    k_EControllerActionOrigin_RightPad_DPadSouth,
    k_EControllerActionOrigin_RightPad_DPadWest,
    k_EControllerActionOrigin_RightPad_DPadEast,
    k_EControllerActionOrigin_LeftTrigger_Pull,
    k_EControllerActionOrigin_LeftTrigger_Click,
    k_EControllerActionOrigin_RightTrigger_Pull,
    k_EControllerActionOrigin_RightTrigger_Click,
    k_EControllerActionOrigin_LeftStick_Move,
    k_EControllerActionOrigin_LeftStick_Click,
    k_EControllerActionOrigin_LeftStick_DPadNorth,
    k_EControllerActionOrigin_LeftStick_DPadSouth,
    k_EControllerActionOrigin_LeftStick_DPadWest,
    k_EControllerActionOrigin_LeftStick_DPadEast,
    k_EControllerActionOrigin_Gyro_Move,
    k_EControllerActionOrigin_Gyro_Pitch,
    k_EControllerActionOrigin_Gyro_Yaw,
    k_EControllerActionOrigin_Gyro_Roll,

    // PS4 Dual Shock
    k_EControllerActionOrigin_PS4_X,
    k_EControllerActionOrigin_PS4_Circle,
    k_EControllerActionOrigin_PS4_Triangle,
    k_EControllerActionOrigin_PS4_Square,
    k_EControllerActionOrigin_PS4_LeftBumper,
    k_EControllerActionOrigin_PS4_RightBumper,
    k_EControllerActionOrigin_PS4_Options,  //Start
    k_EControllerActionOrigin_PS4_Share,	//Back
    k_EControllerActionOrigin_PS4_LeftPad_Touch,
    k_EControllerActionOrigin_PS4_LeftPad_Swipe,
    k_EControllerActionOrigin_PS4_LeftPad_Click,
    k_EControllerActionOrigin_PS4_LeftPad_DPadNorth,
    k_EControllerActionOrigin_PS4_LeftPad_DPadSouth,
    k_EControllerActionOrigin_PS4_LeftPad_DPadWest,
    k_EControllerActionOrigin_PS4_LeftPad_DPadEast,
    k_EControllerActionOrigin_PS4_RightPad_Touch,
    k_EControllerActionOrigin_PS4_RightPad_Swipe,
    k_EControllerActionOrigin_PS4_RightPad_Click,
    k_EControllerActionOrigin_PS4_RightPad_DPadNorth,
    k_EControllerActionOrigin_PS4_RightPad_DPadSouth,
    k_EControllerActionOrigin_PS4_RightPad_DPadWest,
    k_EControllerActionOrigin_PS4_RightPad_DPadEast,
    k_EControllerActionOrigin_PS4_CenterPad_Touch,
    k_EControllerActionOrigin_PS4_CenterPad_Swipe,
    k_EControllerActionOrigin_PS4_CenterPad_Click,
    k_EControllerActionOrigin_PS4_CenterPad_DPadNorth,
    k_EControllerActionOrigin_PS4_CenterPad_DPadSouth,
    k_EControllerActionOrigin_PS4_CenterPad_DPadWest,
    k_EControllerActionOrigin_PS4_CenterPad_DPadEast,
    k_EControllerActionOrigin_PS4_LeftTrigger_Pull,
    k_EControllerActionOrigin_PS4_LeftTrigger_Click,
    k_EControllerActionOrigin_PS4_RightTrigger_Pull,
    k_EControllerActionOrigin_PS4_RightTrigger_Click,
    k_EControllerActionOrigin_PS4_LeftStick_Move,
    k_EControllerActionOrigin_PS4_LeftStick_Click,
    k_EControllerActionOrigin_PS4_LeftStick_DPadNorth,
    k_EControllerActionOrigin_PS4_LeftStick_DPadSouth,
    k_EControllerActionOrigin_PS4_LeftStick_DPadWest,
    k_EControllerActionOrigin_PS4_LeftStick_DPadEast,
    k_EControllerActionOrigin_PS4_RightStick_Move,
    k_EControllerActionOrigin_PS4_RightStick_Click,
    k_EControllerActionOrigin_PS4_RightStick_DPadNorth,
    k_EControllerActionOrigin_PS4_RightStick_DPadSouth,
    k_EControllerActionOrigin_PS4_RightStick_DPadWest,
    k_EControllerActionOrigin_PS4_RightStick_DPadEast,
    k_EControllerActionOrigin_PS4_DPad_North,
    k_EControllerActionOrigin_PS4_DPad_South,
    k_EControllerActionOrigin_PS4_DPad_West,
    k_EControllerActionOrigin_PS4_DPad_East,
    k_EControllerActionOrigin_PS4_Gyro_Move,
    k_EControllerActionOrigin_PS4_Gyro_Pitch,
    k_EControllerActionOrigin_PS4_Gyro_Yaw,
    k_EControllerActionOrigin_PS4_Gyro_Roll,

    // XBox One
    k_EControllerActionOrigin_XBoxOne_A,
    k_EControllerActionOrigin_XBoxOne_B,
    k_EControllerActionOrigin_XBoxOne_X,
    k_EControllerActionOrigin_XBoxOne_Y,
    k_EControllerActionOrigin_XBoxOne_LeftBumper,
    k_EControllerActionOrigin_XBoxOne_RightBumper,
    k_EControllerActionOrigin_XBoxOne_Menu,  //Start
    k_EControllerActionOrigin_XBoxOne_View,  //Back
    k_EControllerActionOrigin_XBoxOne_LeftTrigger_Pull,
    k_EControllerActionOrigin_XBoxOne_LeftTrigger_Click,
    k_EControllerActionOrigin_XBoxOne_RightTrigger_Pull,
    k_EControllerActionOrigin_XBoxOne_RightTrigger_Click,
    k_EControllerActionOrigin_XBoxOne_LeftStick_Move,
    k_EControllerActionOrigin_XBoxOne_LeftStick_Click,
    k_EControllerActionOrigin_XBoxOne_LeftStick_DPadNorth,
    k_EControllerActionOrigin_XBoxOne_LeftStick_DPadSouth,
    k_EControllerActionOrigin_XBoxOne_LeftStick_DPadWest,
    k_EControllerActionOrigin_XBoxOne_LeftStick_DPadEast,
    k_EControllerActionOrigin_XBoxOne_RightStick_Move,
    k_EControllerActionOrigin_XBoxOne_RightStick_Click,
    k_EControllerActionOrigin_XBoxOne_RightStick_DPadNorth,
    k_EControllerActionOrigin_XBoxOne_RightStick_DPadSouth,
    k_EControllerActionOrigin_XBoxOne_RightStick_DPadWest,
    k_EControllerActionOrigin_XBoxOne_RightStick_DPadEast,
    k_EControllerActionOrigin_XBoxOne_DPad_North,
    k_EControllerActionOrigin_XBoxOne_DPad_South,
    k_EControllerActionOrigin_XBoxOne_DPad_West,
    k_EControllerActionOrigin_XBoxOne_DPad_East,

    // XBox 360
    k_EControllerActionOrigin_XBox360_A,
    k_EControllerActionOrigin_XBox360_B,
    k_EControllerActionOrigin_XBox360_X,
    k_EControllerActionOrigin_XBox360_Y,
    k_EControllerActionOrigin_XBox360_LeftBumper,
    k_EControllerActionOrigin_XBox360_RightBumper,
    k_EControllerActionOrigin_XBox360_Start,  //Start
    k_EControllerActionOrigin_XBox360_Back,  //Back
    k_EControllerActionOrigin_XBox360_LeftTrigger_Pull,
    k_EControllerActionOrigin_XBox360_LeftTrigger_Click,
    k_EControllerActionOrigin_XBox360_RightTrigger_Pull,
    k_EControllerActionOrigin_XBox360_RightTrigger_Click,
    k_EControllerActionOrigin_XBox360_LeftStick_Move,
    k_EControllerActionOrigin_XBox360_LeftStick_Click,
    k_EControllerActionOrigin_XBox360_LeftStick_DPadNorth,
    k_EControllerActionOrigin_XBox360_LeftStick_DPadSouth,
    k_EControllerActionOrigin_XBox360_LeftStick_DPadWest,
    k_EControllerActionOrigin_XBox360_LeftStick_DPadEast,
    k_EControllerActionOrigin_XBox360_RightStick_Move,
    k_EControllerActionOrigin_XBox360_RightStick_Click,
    k_EControllerActionOrigin_XBox360_RightStick_DPadNorth,
    k_EControllerActionOrigin_XBox360_RightStick_DPadSouth,
    k_EControllerActionOrigin_XBox360_RightStick_DPadWest,
    k_EControllerActionOrigin_XBox360_RightStick_DPadEast,
    k_EControllerActionOrigin_XBox360_DPad_North,
    k_EControllerActionOrigin_XBox360_DPad_South,
    k_EControllerActionOrigin_XBox360_DPad_West,
    k_EControllerActionOrigin_XBox360_DPad_East,	

    // SteamController V2
    k_EControllerActionOrigin_SteamV2_A,
    k_EControllerActionOrigin_SteamV2_B,
    k_EControllerActionOrigin_SteamV2_X,
    k_EControllerActionOrigin_SteamV2_Y,
    k_EControllerActionOrigin_SteamV2_LeftBumper,
    k_EControllerActionOrigin_SteamV2_RightBumper,
    k_EControllerActionOrigin_SteamV2_LeftGrip,
    k_EControllerActionOrigin_SteamV2_RightGrip,
    k_EControllerActionOrigin_SteamV2_LeftGrip_Upper,
    k_EControllerActionOrigin_SteamV2_RightGrip_Upper,
    k_EControllerActionOrigin_SteamV2_LeftBumper_Pressure,
    k_EControllerActionOrigin_SteamV2_RightBumper_Pressure,
    k_EControllerActionOrigin_SteamV2_LeftGrip_Pressure,
    k_EControllerActionOrigin_SteamV2_RightGrip_Pressure,
    k_EControllerActionOrigin_SteamV2_LeftGrip_Upper_Pressure,
    k_EControllerActionOrigin_SteamV2_RightGrip_Upper_Pressure,
    k_EControllerActionOrigin_SteamV2_Start,
    k_EControllerActionOrigin_SteamV2_Back,
    k_EControllerActionOrigin_SteamV2_LeftPad_Touch,
    k_EControllerActionOrigin_SteamV2_LeftPad_Swipe,
    k_EControllerActionOrigin_SteamV2_LeftPad_Click,
    k_EControllerActionOrigin_SteamV2_LeftPad_Pressure,
    k_EControllerActionOrigin_SteamV2_LeftPad_DPadNorth,
    k_EControllerActionOrigin_SteamV2_LeftPad_DPadSouth,
    k_EControllerActionOrigin_SteamV2_LeftPad_DPadWest,
    k_EControllerActionOrigin_SteamV2_LeftPad_DPadEast,
    k_EControllerActionOrigin_SteamV2_RightPad_Touch,
    k_EControllerActionOrigin_SteamV2_RightPad_Swipe,
    k_EControllerActionOrigin_SteamV2_RightPad_Click,
    k_EControllerActionOrigin_SteamV2_RightPad_Pressure,
    k_EControllerActionOrigin_SteamV2_RightPad_DPadNorth,
    k_EControllerActionOrigin_SteamV2_RightPad_DPadSouth,
    k_EControllerActionOrigin_SteamV2_RightPad_DPadWest,
    k_EControllerActionOrigin_SteamV2_RightPad_DPadEast,
    k_EControllerActionOrigin_SteamV2_LeftTrigger_Pull,
    k_EControllerActionOrigin_SteamV2_LeftTrigger_Click,
    k_EControllerActionOrigin_SteamV2_RightTrigger_Pull,
    k_EControllerActionOrigin_SteamV2_RightTrigger_Click,
    k_EControllerActionOrigin_SteamV2_LeftStick_Move,
    k_EControllerActionOrigin_SteamV2_LeftStick_Click,
    k_EControllerActionOrigin_SteamV2_LeftStick_DPadNorth,
    k_EControllerActionOrigin_SteamV2_LeftStick_DPadSouth,
    k_EControllerActionOrigin_SteamV2_LeftStick_DPadWest,
    k_EControllerActionOrigin_SteamV2_LeftStick_DPadEast,
    k_EControllerActionOrigin_SteamV2_Gyro_Move,
    k_EControllerActionOrigin_SteamV2_Gyro_Pitch,
    k_EControllerActionOrigin_SteamV2_Gyro_Yaw,
    k_EControllerActionOrigin_SteamV2_Gyro_Roll,
    
    k_EControllerActionOrigin_Count
}

enum ESteamControllerLEDFlag
{
	k_ESteamControllerLEDFlag_SetColor,
	k_ESteamControllerLEDFlag_RestoreUserDefault
}

struct ControllerMotionData_t
{
	// Sensor-fused absolute rotation; will drift in heading
	float rotQuatX;
	float rotQuatY;
	float rotQuatZ;
	float rotQuatW;
	
	// Positional acceleration
	float posAccelX;
	float posAccelY;
	float posAccelZ;

	// Angular velocity
	float rotVelX;
	float rotVelY;
	float rotVelZ;
}

// ControllerHandle_t is used to refer to a specific controller.
// This handle will consistently identify a controller, even if it is disconnected and re-connected
alias ControllerHandle_t = uint64;

// These handles are used to refer to a specific in-game action or action set
// All action handles should be queried during initialization for performance reasons
alias ControllerActionSetHandle_t = uint64;
alias ControllerDigitalActionHandle_t = uint64;
alias ControllerAnalogActionHandle_t = uint64;

align(1):

struct ControllerAnalogActionData_t
{
    // Type of data coming from this action, this will match what got specified in the action set
    EControllerSourceMode eMode;
    
    // The current state of this action; will be delta updates for mouse actions
    float x, y;
    
    // Whether or not this action is currently available to be bound in the active action set
    bool bActive;
}

struct ControllerDigitalActionData_t
{
    // The current state of this action; will be true if currently pressed
    bool bState;
    
    // Whether or not this action is currently available to be bound in the active action set
    bool bActive;
}

static immutable const(char)* STEAMCONTROLLER_INTERFACE_VERSION = "SteamController005";
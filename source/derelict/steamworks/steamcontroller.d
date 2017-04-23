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
    k_EControllerSourceMode_JoystickCamera,
    k_EControllerSourceMode_ScrollWheel,
    k_EControllerSourceMode_Trigger,
    k_EControllerSourceMode_TouchMenu,
    k_EControllerSourceMode_MouseJoystick,
    k_EControllerSourceMode_MouseRegion,
    k_EControllerSourceMode_RadialMenu,
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
    
    k_EControllerActionOrigin_Count
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

static immutable const(char)* STEAMCONTROLLER_INTERFACE_VERSION = "SteamController004";
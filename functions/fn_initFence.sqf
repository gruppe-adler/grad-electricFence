/*
 * Arguments:
 * 0: fence objects or game logic with synchronized fence objects <ARRAY / OBJECT>
 */


#include "script_component.hpp"

private _moduleConfig = missionConfigFile >> "CfgGradElectricFence";

params [
    ["_fenceParts",[]],
    ["_lockpickTime",[_moduleConfig,"lockpickTime",20] call BIS_fnc_returnConfigEntry],
    ["_lockpickSuccessChance",[_moduleConfig,"lockpickSuccessChance",50] call BIS_fnc_returnConfigEntry],
    ["_shockDamage",[_moduleConfig,"shockDamage",0.1] call BIS_fnc_returnConfigEntry],
    ["_shockUnconsciousTimeMinMax",[_moduleConfig,"shockUnconsciousTimeMinMax",[0.1,5]] call BIS_fnc_returnConfigEntry]
];


// progressbar can be buggy if time is too short
_lockpickTime = _lockpickTime max 2;

// in case gameLogic is used instead of fence array
if (_fenceParts isEqualType objNull) then {
    _fenceParts = synchronizedObjects _fenceParts;
};

// get all gates by checking for open door action
private _fenceGates = _fenceParts select {isClass (configfile >> "CfgVehicles" >> typeOf _x >> "UserActions" >> "OpenDoor_1")};

{[_x,_lockpickTime,_lockpickSuccessChance,_shockDamage,_shockUnconsciousTimeMinMax] call FUNC(initGate)} forEach _fenceGates;

if (isServer) then {
    [_fenceParts] call FUNC(sparksEffectServer);
    [_fenceParts] remoteExec ["QFUNC(sparksEffectClient)", [0,-2] select isDedicated, true];
};

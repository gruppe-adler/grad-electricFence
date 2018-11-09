#include "script_component.hpp"

params [["_fencePart",objNull],["_unit",objNull],["_shockDamage",0.1],["_shockUnconsciousTimeMinMax",[5,30]]];

if (!(_unit isKindOf "Man")) exitWith {};
if (!local _unit) exitWith {};
if (_unit getVariable ["ACE_isUnconscious", false]) exitWith {};

// todo uncommented for debug
// [_unit,true,_shockUnconsciousTimeMinMax call BIS_fnc_randomNum,true] call ace_medical_fnc_setUnconscious;

if (_shockDamage >= 1) then {
    _unit setDamage 1;
} else {
    [_unit,_shockDamage,selectRandom ["body","hand_l","hand_r"],"ropeburn"] call ace_medical_fnc_addDamageToUnit;
};

// [position _unit, _fencePart, 0.5] remoteExec ["GRAD_electricFence_fnc_fx_createSparkLightLocal", [0,-2] select isDedicated];

[_unit,"small",15] remoteExec [QFUNC(createSmoke),0,false];
[_unit] remoteExec [QFUNC(createShockSparks),0,false];

["GRAD_electricFence_fenceCut", [_unit, _fencePart]] call CBA_fnc_globalEvent;
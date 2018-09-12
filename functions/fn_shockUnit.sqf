#include "script_component.hpp"

params [["_fencePart",objNull],["_unit",objNull],"_shockDamage","_shockUnconsciousTimeMinMax"];

if (!(_unit isKindOf "Man")) exitWith {};
if (!local _unit) exitWith {};
if (_unit getVariable ["ACE_isUnconscious", false]) exitWith {};

[_unit,true,_shockUnconsciousTimeMinMax call BIS_fnc_randomNum,true] call ace_medical_fnc_setUnconscious;
[_unit,_shockDamage,selectRandom ["body","hand_l","hand_r"],"ropeburn"] call ace_medical_fnc_addDamageToUnit;

// [position _unit, _fencePart, 0.5] remoteExec ["GRAD_electricFence_fnc_fx_createSparkLightLocal", [0,-2] select isDedicated];

[_unit,"small",15] remoteExec [QFUNC(createSmoke),0,false];
[_fencePart] remoteExec [QFUNC(createShockSparks),0,false];

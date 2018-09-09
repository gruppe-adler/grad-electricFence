#include "script_component.hpp"

params [["_target",objNull],["_caller",objNull],["_actionParams",[]]];
_actionParams params ["_lockpickTime","_lockpickSuccessChance","_shockDamage","_shockUnconsciousTimeMinMax"];

private _failAtTime = switch (true) do {
    case (_target getVariable [QGVAR(isTurnedOff),false]): {9999999};
    case (random 100 > _lockpickSuccessChance): {[1,_lockpickTime] call BIS_fnc_randomNum};
    default {9999999};
};

private _fnc_onSuccess = {
    (_this select 0) params ["_target","_caller"];
    [_target,false] call FUNC(lockDoors);

    _target setVariable [QGVAR(isUnlocked),true,true];
    systemChat "onSuccess";
};

private _fnc_onFailure = {
    params ["_args","","","_errorCode"];
    _args params ["_target","_caller","","_shockDamage","_shockUnconsciousTimeMinMax"];

    // failure because of condition, not because player interruption
    if (_errorCode == 3) then {
        [_target,_caller,_shockDamage,_shockUnconsciousTimeMinMax] call FUNC(shockUnit);
    };
};

private _condition = {
    params ["_args","_elapsedTime"];
    _args params ["","","_failAtTime"];
    _elapsedTime < _failAtTime
};

[
    _lockpickTime,
    [_target,_caller,_failAtTime,_shockDamage,_shockUnconsciousTimeMinMax],
    _fnc_onSuccess,
    _fnc_onFailure,
    "Picking lock...",
    _condition,
    ["isNotInside", "isNotSwimming"]
] call ace_common_fnc_progressBar;

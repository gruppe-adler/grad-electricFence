#include "script_component.hpp"

params [["_fenceGate",objNull],"_lockpickTime","_lockpickSuccessChance","_shockDamage","_shockUnconsciousTimeMinMax"];

if (isNull _fenceGate) exitWith {};
if (damage _fenceGate == 1) exitWith {};
if (_fenceGate getVariable [QGVAR(lockpicked),false]) exitWith {};


if (isServer) then {
    [_fenceGate,true] call FUNC(lockDoors);
};


if (hasInterface) then {
    private _lockpickAction = [QGVAR(lockpickAction),"Lockpick","",FUNC(onActionLockpick),FUNC(canLockpick),{},[_lockpickTime,_lockpickSuccessChance,_shockDamage,_shockUnconsciousTimeMinMax]] call ace_interact_menu_fnc_createAction;
    [_fenceGate,0,["ACE_MainActions"],_lockpickAction] call ace_interact_menu_fnc_addActionToObject;

    private _peeAction = [QGVAR(peeAction),"Pee on","",FUNC(onActionPee),FUNC(canPeeOn)] call ace_interact_menu_fnc_createAction;
    [_fenceGate,0,["ACE_MainActions"],_peeAction] call ace_interact_menu_fnc_addActionToObject;
};

/*

	dedicated to init fields of objects 

*/

#include "script_component.hpp"


[] remoteExec [QFUNC(sparksEffectClient), [0,-2] select isDedicated, true];


if (!isServer) exitWith {};

private _idCount = missionNamespace getVariable ["GRAD_electricFence_idCount", 0];

for "_i" from 0 to _idCount do {

	private _identifier = format ["GRAD_electricFenceParts_%1", _i];
	private _fenceParts = missionNamespace getVariable [_identifier, []];

    // sort fences
    private _fenceTypes = [];
    {
        _fenceTypes pushBackUnique (typeOf _x);
    } forEach _fenceParts;

    private _fencesSorted = [];
    {
        private _closestFences = nearestObjects [_x, _fenceTypes, 50];

        switch (count _closestFences) do {
            case 0 : {  systemChat "fence itself is no fence"; }; 
            case 1 : {  systemChat "deadEnd"; };
            case 2 : {
                _fencesSorted pushBackUnique (_closestFences select 1);
                (_closestFences select 1) setVariable ["GRAD_electricFenceNumber", count _fencesSorted];
            };
            default {
                _fencesSorted pushBackUnique (_closestFences select 1);
                _fencesSorted pushBackUnique (_closestFences select 2);

                (_closestFences select 2) setVariable ["GRAD_electricFenceNumber", count _fencesSorted];
            };            
        };
    } forEach _fenceParts;

    {
        diag_log format ["%1", _x getVariable ["GRAD_electricFenceNumber", -1]];
        systemChat format ["%1", _x getVariable ["GRAD_electricFenceNumber", -1]];
    } forEach _fenceParts;

	[_fenceParts, _i] call FUNC(initFence);

};


["ace_wireCuttingStarted", {
	params ["_unit", "_fence"];

	// raise event
	["GRAD_electricFence_alarmRaised", [_fence]] call CBA_fnc_globalEvent;

    // params [["_fencePart",objNull],["_unit",objNull],["_shockDamage",0.1],["_shockUnconsciousTimeMinMax",[5,30]]];
    [_fence, _unit, 0.1, [0.1,0.2]] call FUNC(shockUnit);
    [_fence, getPosASL _fence vectorAdd [0, 0, 1.25]] spawn FUNC(sparkLarge);

}] call CBA_fnc_addEventHandler;
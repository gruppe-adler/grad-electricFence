#include "script_component.hpp"

params [["_fenceParts",[]], ["_generator", objNull]];

// find out all used fence types
private _classnames = [];
{
  _classnames pushBackUnique (typeOf _x);
} forEach _fenceParts;

/*
systemChat str _classnames;
diag_log str _classnames;
*/


if (count _fenceParts < 1) exitWith { diag_log "no fence parts found"; };

[{
    params ["_args", "_handle"];
    _args params ["_fenceParts", "_generator", "_classnames"];

    private _fenceActive = _generator getVariable ["GRAD_electricFence_fenceActive", true];
    private _generatorActive = _generator getVariable ["GRAD_electricFence_generatorActive", true];

    // if one fence is damaged, power does not circulate
    if (_fenceActive && _generatorActive) then {

        // get all fences in range of any player
        private _fences = [];
        {
            private _nearestFences = nearestObjects [_x, _classnames, 200];
            if (count _nearestFences > 0) then {

                // take randomly one of the 100m near a player
                private _nearestFence = selectRandom _nearestFences;

                // check if actually part of the fence
                if ((_fenceParts find _nearestFence) > -1) then {
                    _fences pushBackUnique _nearestFence;
                };
            };
        } forEach playableUnits + switchableUnits;


        // if any fences found, select one randomly
        if (count _fences > 0) then {
            // systemChat str _fences + _classnames;
    	    private _fence = selectRandom _fences;
            // systemChat str _fence;
            // diag_log str _fence;
            private _position = [_fence] call FUNC(sparksGetPos);

            // systemChat format ["position is %1", _position];
            // diag_log format ["position is %1", _position];
            // send spark position to clients
            ["GRAD_electricFence_sparkSmall", [_fence, _position]] call CBA_fnc_globalEvent;
        };

	};

}, 2, [_fenceParts, _generator, _classnames]] call CBA_fnc_addPerFrameHandler;
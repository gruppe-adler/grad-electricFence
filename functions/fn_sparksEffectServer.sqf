params [["_fenceParts",[]], ["_generator", objNull]];

// find out all used fence types
private _classnames = [];
{
  _classnames pushBackUnique (typeOf _x);
} forEach _fenceParts;


if (count _fenceParts < 1) exitWith { diag_log "no fence parts found"; };
private _fenceMaster = _fenceParts select 0;
// serial to identify different fence segments/generator dependencies

[{
    params ["_args", "_handle"];
    _args params ["_fenceParts", "_fenceMaster", "_generator", "_classnames"];

    private _fenceActive = _fenceMaster getVariable ["GRAD_electricFence_isActive", true];
    private _generatorActive = _generator getVariable ["GRAD_electricFence_isActive", true];

    // if one fence is damaged, power does not circulate
    if (_fenceActive && _generatorActive) then {

        // get all fences in range of any player
        private _fences = [];
        {
            _fences pushBackUnique (_x nearEntities [_classnames, 100]);
        } forEach playableUnits + switchableUnits;

        // if any fences found, select one rndomly
        if (count _fences > 0) then {
    	    private _currentSelection = floor (random _currentCount);
    	    private _fence = _fences select _currentSelection;
            private _position = [_fence] call GRAD_electricFence_fnc_sparksGetPos;

            // send spark position to clients
            ["GRAD_electricFence_sparkSmall", [_position]] call CBA_fnc_globalEvent;
        };

	};

}, 1, [_fenceParts, _fenceMaster, _generator, _classnames]] call CBA_fnc_addPerFrameHandler;
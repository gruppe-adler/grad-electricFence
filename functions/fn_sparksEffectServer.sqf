params [["_fenceParts",[]]];

missionNamespace setVariable ["GRAD_ELECTRIC_FENCE_SPARKPOS", [], true];

// todo generate serial to identify different fence segments/generator dependencies

[{
    params ["_args", "_handle"];
    _args params ["_fenceParts"];

    private _currentCount = count _fenceParts; // todo get actual current non destroyed fences

    if (_currentCount > 0) then {
    	private _currentSelection = floor (random _currentCount);
    	private _fence = _fenceParts select _currentSelection;
        private _position = [_fence] call GRAD_electricFence_fnc_sparksGetPos;

    	missionNamespace setVariable ["GRAD_ELECTRIC_FENCE_SPARKPOS", _position, true];
    } else {
    	missionNamespace setVariable ["GRAD_ELECTRIC_FENCE_SPARKPOS", [], true];
	};

}, 1, [_fenceParts]] call CBA_fnc_addPerFrameHandler;

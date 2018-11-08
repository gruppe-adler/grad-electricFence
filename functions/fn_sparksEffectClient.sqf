params [["_fenceParts",[]]];

systemChat "sparksEffect";


[{
    params ["_args", "_handle"];
    _args params ["_fenceParts"];

    private _selection = missionNamespace getVariable ["GRAD_ELECTRIC_FENCE_SPARKPOS", [0,0,0]];
    
    if (count _selection > 0) then {
        [_position] call GRAD_electricFence_fnc_sparkSmall;
    };

}, 1, [_fenceParts]] call CBA_fnc_addPerFrameHandler;
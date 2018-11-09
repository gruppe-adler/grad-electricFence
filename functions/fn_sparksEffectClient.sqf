#include "script_component.hpp"

["GRAD_electricFence_sparkSmall", {
	params ["_fence", "_position"];
    
	[_fence, _position] spawn FUNC(sparkSmall);

}] call CBA_fnc_addEventHandler;
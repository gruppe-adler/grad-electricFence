["GRAD_electricFence_sparkSmall", {
	 params ["_position"];

	 [_position] call GRAD_electricFence_fnc_sparkSmall;

	 systemChat "sparksEffect"; // todo remove debug

}] call CBA_fnc_addEventHandler;
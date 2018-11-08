["GRAD_electricFence_sparkSmall", {
	 params ["_position"];

	 [_position] call FUNC(sparkSmall);

	 systemChat "sparksEffect"; // todo remove debug

}] call CBA_fnc_addEventHandler;
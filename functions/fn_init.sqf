/*

	dedicated to init fields of objects 

*/


private _idCount = missionNamespace getVariable ["GRAD_electricFence_idCount", 0];

for "_i" from 0 to _idCount do {

	private _identifier = format ["GRAD_electricFenceParts_%1", _i];
	private _fenceParts = missionNamespace getVariable [_identifier, []];

	[_fenceParts] call FUNC(initFence);

};


["ace_wireCuttingStarted", {
	 params ["_unit", "_fence"];

	 // raise event
	 ["GRAD_electricFence_alarmRaised", [_fence]] call CBA_fnc_globalEvent;

}] call CBA_fnc_addEventHandler;
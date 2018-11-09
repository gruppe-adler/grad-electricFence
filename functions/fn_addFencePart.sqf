/*
	// put in init of fence object, different ID (number) for different segments
	
	[this, 2] call GRAD_electricFence_fnc_addFencePart;
	
*/

params ["_fencePart", ["_id", 0]];

if (!isServer) exitWith {};

private _maximumID = (missionNamespace getVariable ["GRAD_electricFence_idCount", 0]) max _id;
missionNamespace setVariable ["GRAD_electricFence_idCount", _maximumID];

// get identifier for public var
private _identifier = format ["GRAD_electricFenceParts_%1", _id];

// check for existing parts, empty array if nothing there
private _existingParts = missionNamespace getVariable [_identifier, []];
_existingParts pushBackUnique _fencePart;

// save new array
missionNamespace setVariable [_identifier, _existingParts];

diag_log format ["adding fence parts: %1", _existingParts];
systemChat format ["adding fence parts: %1", _existingParts];
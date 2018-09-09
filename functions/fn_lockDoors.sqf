#include "script_component.hpp"

params [["_fenceGate",objNull],["_lock",true]];


private _numberOfDoors = _fenceGate getVariable [QGVAR(numberOfDoors),-1];
if (_numberOfDoors < 0) then {
    _numberOfDoors = {_x find "OpenDoor" >= 0} count (("true" configClasses (configfile >> "CfgVehicles" >> typeOf _fenceGate >> "UserActions")) apply {configName _x});
    _fenceGate setVariable [QGVAR(numberOfDoors),_numberOfDoors];
};

// lock / unlock
for [{_i = 1},{_i <= _numberOfDoors},{_i = _i + 1}] do {
    _fenceGate setVariable [format ["BIS_disabled_door_%1",_i],[0,1] select _lock,true];
};

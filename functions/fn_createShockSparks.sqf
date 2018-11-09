#include "script_component.hpp"

params ["_unit"];

if (!hasInterface) exitWith {};

private _effects = [];
private _duration = 1;
private _amount = 0.001;
private _lifetime = 0.05;

_unit setUnconscious true;

private _brightness = 0.2;
private _light = "#lightpoint" createVehicleLocal (position _unit);
_light setLightBrightness _brightness;
_light setLightAmbient [1.0, 0.75, 0.75];
_light setLightColor [1.0, 0.75, 0.75];

{
    private _position = _unit modelToWorld (_unit selectionPosition _x);

    
   
    private _spark = "#particlesource" createVehicleLocal _position;
    _spark attachTo [_unit,[0,0,0],_x];
    _spark setParticleCircle [0, [0, 0, 0]];
    _spark setParticleRandom [0.5, [0.1, 0.1, 0.1], [0.5, 0.5, 1], 0, 0.0025, [0, 0, 0, 0], 0, 0];
    _spark setParticleParams [
        ["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject",
        1, _lifetime, [0, 0, 0], [0, 0, -0.1], 0, 20, 7.9, 0, 
        [0.3,0.3,0.05], [[1, 1, 1, 1], [1, 0.5, 0.5, 1], [0.5, 0, 0, 0]], [0.08], 1, 0, "", "", _spark,0,true,0.2,[[1,0.25,0.25,1]]
    ];
    _spark setDropInterval _amount; 
    _effects pushBackUnique _spark;

} forEach selectionNames _unit;

_unit say3D ["GRAD_electricFence_sound_buzz",150];
_unit say3D ["GRAD_electricFence_sound_argl",100];

for "_i" from 0 to 10 do {
    _unit setVelocityModelSpace [random 1 - random 2, random 1 - random 2, 0];
    sleep _duration/10;

    _brightness = _brightness/2;
    _light setLightBrightness _brightness;
};


{
     deleteVehicle _x;
} forEach _effects;

deleteVehicle _light;

_unit setUnconscious false;
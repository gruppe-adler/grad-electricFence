/* A Handy-Dandy Smoke Column Generator
 * For all your smoke column generation needs!
 * Author: {C9}Jester
 * With special thanks to ColonelSandersLite for the templates found here: http://community.bistudio.com/wiki/ParticleTemplates
 * Questions? Problems? Find me in #cloud-9 on Gamesurge (irc.gamesurge.net:6667)
 *
 * ----------------------------------------------------------------------------------
 *
 * Parameters
 *
 * 0: (object) Object to attach the smoke column to
 * 1: (string) Type of smoke: "oil", "wood", "mixed" (optional; default mixed)
 * 2: (string) Size of column: "small", "medium", "large" (optional; default medium)
 *
 * Returns: true on success (but exits if there's errors)
 *
 * Side note: You should always pass an array, even if it's only one param
 *
 * ----------------------------------------------------------------------------------
 */


// PIMPED BY nomisum: this select 3 should be false to delete again

private["_position", "_source1"];
params ["_object", "_size", "_duration"];

if (!hasInterface) exitWith {};

_position = getPos _object;

_source1 = "#particlesource" createVehicleLocal [_position select 0, _position select 1, 0];

if(_size == "small") then
{
    _source1 setParticleCircle [0, [0, 0, 0]];
    _source1 setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
    _source1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 3, 1], "", "Billboard", 1, _duration, [0, 0, 0], [0, 0, 0.01], 0, 10, 7.9, 10, [3, 4, 5], [[0.5, 0.5, 0.5, 0.15], [0.75, 0.75, 0.75, 0.075], [1, 1, 1, 0]], [0.125], 1, 0, "", "", _object];
    _source1 setDropInterval 0.05;
};
if(_size == "medium") then
{
    _source1 setParticleCircle [0, [0, 0, 0]];
    _source1 setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
    _source1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 3, 1], "", "Billboard", 1, _duration, [0, 0, 0], [0, 0, 0.1], 0, 10, 7.9, 1.066, [2, 6, 12], [[0.5, 0.5, 0.5, 0.3], [0.75, 0.75, 0.75, 0.15], [1, 1, 1, 0]], [0.125], 1, 0, "", "", _object];
    _source1 setDropInterval 0.1;
};
if(_size == "large") then
{
    _source1 setParticleCircle [0, [0, 0, 0]];
    _source1 setParticleRandom [0, [0.5, 0.5, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
    _source1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 3, 1], "", "Billboard", 1, _duration, [0, 0, 0], [0, 0, 0.1], 0, 10, 7.9, 0.5, [4, 12, 20], [[0.5, 0.5, 0.5, 0.5], [0.75, 0.75, 0.75, 0.25], [1, 1, 1, 0]], [0.125], 1, 0, "", "", _object];
    _source1 setDropInterval 0.1;
};

sleep 1;
deleteVehicle _source1;

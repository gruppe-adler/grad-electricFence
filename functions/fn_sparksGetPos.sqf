params ["_fence"];

private _boundingBox = boundingBoxReal _fence;

/*
diag_log format ["_boundingBox %1", _boundingBox];
*/

_boundingBox params ["_bottomCorner", "_upperCorner"];
_bottomCorner params ["_cx", "_cy", "_cz"];
_upperCorner params ["_ux", "_uy", "_uz"];

private _maxWidth = abs (_ux - _cx);
private _maxLength = abs (_uy - _cy);
private _maxHeight = abs (_uz - _cz);

/*
diag_log format ["_maxWidth %1", _maxWidth];
diag_log format ["_maxLength %1", _maxLength];
diag_log format ["_maxHeight %1", _maxHeight];
*/

private _spawnPosition = _fence modelToWorld [
    _cx + random _maxWidth, 
    _cy + random _maxLength,
    (_cz + random _maxHeight) max 0.4
];

/*
diag_log format ["_spawnPosition %1", _spawnPosition];
*/

_spawnPosition
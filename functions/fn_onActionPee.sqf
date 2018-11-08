#include "script_component.hpp"

params [["_target",objNull],["_caller",objNull],["_actionParams",[]]];

systemChat "onActionPee";

_caller playMove "Acts_AidlPercMstpSlowWrflDnon_pissing";
[_caller] remoteExec [QFUNC(peeEffect),0,false];

[_target,_caller,1,[60,120]] spawn {
    sleep 3;
    _this call FUNC(shockUnit);
};
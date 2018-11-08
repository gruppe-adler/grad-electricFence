#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY node_modules
#endif

class grad_electricFence {
    class electricFence {
        file = MODULES_DIRECTORY\grad-electricFence\functions;

        class addFencePart;
        class addGenerator;
        class canLockpick;
        class canPeeOn;
        class createShockSparks;
        class createSmoke;
        class generateSerial;
        class init { postInit = 1; };
        class initFence;
        class initGate;
        class lockDoors;
        class onActionLockpick;
        class onActionPee;
        class peeEffect;
        class shockUnit;
        class sparksEffectClient;
        class sparksEffectServer;
        class sparksGetPos;
    };
};
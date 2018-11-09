#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY node_modules
#endif

#define SOUNDPATH(var1,var2) ##var1##\##var2
#define VOLUME 5
#define DISTANCE 15

class GRAD_electricFence_sound_hum
{
    name = "GRAD_electricFence_sound_hum";
    sound[] = {SOUNDPATH(MODULES_DIRECTORY,grad-electricFence\sounds\hum.ogg), VOLUME, 1, DISTANCE};
    titles[] = {0, ""};
};

class GRAD_electricFence_sound_buzz
{
    name = "GRAD_electricFence_sound_buzz";
    sound[] = {SOUNDPATH(MODULES_DIRECTORY,grad-electricFence\sounds\buzz.ogg), VOLUME, 1, 250};
    titles[] = {0, ""};
};

class GRAD_electricFence_sound_spark1
{
    name = "GRAD_electricFence_sound_spark1";
    sound[] = {SOUNDPATH(MODULES_DIRECTORY,grad-electricFence\sounds\spark1.ogg), VOLUME, 1, DISTANCE};
    titles[] = {0, ""};
};

class GRAD_electricFence_sound_spark2
{
    name = "GRAD_electricFence_sound_spark2";
    sound[] = {SOUNDPATH(MODULES_DIRECTORY,grad-electricFence\sounds\spark2.ogg), VOLUME, 1, DISTANCE};
    titles[] = {0, ""};
};

class GRAD_electricFence_sound_spark3
{
    name = "GRAD_electricFence_sound_spark3";
    sound[] = {SOUNDPATH(MODULES_DIRECTORY,grad-electricFence\sounds\spark3.ogg), VOLUME, 1, DISTANCE};
    titles[] = {0, ""};
};

class GRAD_electricFence_sound_argl
{
    name = "GRAD_electricFence_sound_argl";
    sound[] = {SOUNDPATH(MODULES_DIRECTORY,grad-electricFence\sounds\argl.ogg), VOLUME, 1, DISTANCE};
    titles[] = {0, ""};
};
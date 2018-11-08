#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY node_modules
#endif

#define SOUNDPATH(var1,var2) ##var1##\##var2
#define VOLUME 0.9
#define DISTANCE 5

class GRAD_electricFence_sound_hum
{
    name = "GRAD_electricFence_sound_hum";
    sound[] = {SOUNDPATH(MODULES_DIRECTORY,GRAD-electricFence\sounds\hum.ogg), VOLUME, 1, DISTANCE};
    titles[] = {0, ""};
};

class GRAD_electricFence_sound_buzz
{
    name = "GRAD_electricFence_sound_buzz";
    sound[] = {SOUNDPATH(MODULES_DIRECTORY,GRAD-electricFence\sounds\buzz.ogg), VOLUME, 1, 250};
    titles[] = {0, ""};
};
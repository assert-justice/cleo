#ifndef AUDIO
#define AUDIO
#include "../extern/miniaudio/miniaudio.h"

typedef struct AudioSystem
{
    ma_engine engine;
    int numSounds;
    ma_sound* sounds;
} AudioSystem;

int initAudioSystem();
void freeAudioSystem();

int addAudioSource();
int getNumAudioSources();
int getMaxAudioSources();
int loadAudioSource(int idx, const char* fname);
void playAudioSource(int idx);
void pauseAudioSource(int idx);
void stopAudioSource(int idx);
int audioSourceIsPlaying(int idx);
void setVolumeAudioSource(int idx, double volume);
double getVolumeAudioSource(int idx);
void loopAudioSource(int idx, int shouldLoop);
int audioSourceIsLooping(int idx);

#endif

#ifndef _UTILITY_H_
#define _UTILITY_H_

#include "ff.h"

Bool LESS( float a, float b );
float PLUS( float a, float b );
float MAX( float a, float b);
float MIN( float a, float b);
float get_cost(int effect);
void print_state( State *S );
Bool effect_deletes_fact(int effect, int fact);
Bool effect_adds_fact(int effect, int fact);
void add_fact( State *S, int fact );
void remove_fact( State *S, int fact );

typedef enum {
  SG_AT_COLLECT_REWARD,
  SG_AT_FORGO_REWARD,
  SG_AT_OTHER
} SG_ACTION_TYPE;

SG_ACTION_TYPE get_action_type(int effect);

#endif

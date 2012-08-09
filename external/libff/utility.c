#include <string.h>

#include "utility.h"
#include "ff.h"
#include "output.h"

extern Bool artificial_gtt;

float MAX( float a, float b) {

  if( (a == INFINITY) || (b == INFINITY)) return INFINITY;
  if( a > b ) return a;
  return b;
}

float MIN( float a, float b) {
  
  if(a == INFINITY) return b;
  if(b == INFINITY) return a;
  if(a < b) return a;
  return b;

}

float PLUS( float a, float b )

{

  if (( a == INFINITY ) || ( b == INFINITY )) {
    return INFINITY;
  }
 
  return ( a + b );
}

float get_cost(int effect) {
	return gef_conn[effect].cost + gtt;
/*
  if ( artificial_gtt ) {
    return gop_conn[gef_conn[effect].op].cost;
  }
  else {
    return gop_conn[gef_conn[effect].op].cost + gtt;
  }
*/
}

void print_state( State *S )

{

  int i;

  printf("\n{");

  for ( i = 0; i < S->num_F; i++ ) {
    print_ft_name( S->F[i] );
    printf(", ");
  }
  printf("}\n");

}

char *COLLECT_REWARD_STRING = "COLLECT";
char *FORGO_REWARD_STRING = "FORGO";

SG_ACTION_TYPE get_action_type(int op) {

  Action *a = gop_conn[op].action;

  if(strcmp(a->name, COLLECT_REWARD_STRING) == SAME) {
    return SG_AT_COLLECT_REWARD;
  }
  else if(strcmp(a->name, FORGO_REWARD_STRING) == SAME) {
    return SG_AT_FORGO_REWARD;
  }
  return SG_AT_OTHER;
}

Bool effect_deletes_fact(int effect, int fact) {
  int i;
  for(i = 0; i < gef_conn[effect].num_D; i++) {
    if(gef_conn[effect].D[i] == fact)
      return TRUE;
  }
  return FALSE;
}

Bool effect_adds_fact(int effect, int fact) {
  int i;
  for(i = 0; i < gef_conn[effect].num_A; i++) {
    if(gef_conn[effect].A[i] == fact)
      return TRUE;
  }
  return FALSE;
}

void add_fact(State *S, int fact) {

  int i;

  for(i = 0; i < S->num_F; i++) {
    if (S->F[i] == fact) {
      return;
    }
  }

  S->F[S->num_F++] = fact;
}

void remove_fact(State *S, int fact) {
  
  int i, j;

  for(i = 0; i < S->num_F; i++) {
    if (S->F[i] == fact) {
      for (j = i; j + 1 < S->num_F; j++) {
	S->F[j] = S->F[j + 1];
      }
      S->num_F--;
      return;
    }
  }
}

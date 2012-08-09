/*
    Miguel Ramirez, Nir Lipovetzky, Hector Geffner
    C^3: A planner for the sequential, satisficing track of the IPC-6
    Copyright (C) 2008  

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef __UNSIGNED_VEC_HASH_SET__
#define __UNSIGNED_VEC_HASH_SET__

#include <stdlib.h>
#include "jenkins_c_version.h"

#include "ff.h"

typedef struct Item {
  unsigned len;
  unsigned *elems;
  Bool pos, neg, use;
  /* below field only specified if using as hashtable rather than
     set */
  int value;
} Item;

void print_item(Item *a) {

  unsigned i;

  printf("Item length %d, entries ", a->len);

  for ( i = 0; i < a->len; i++ ) {
    printf("%d, ", a->elems[i]);
  }
}

Bool items_equal(Item *a, Item *b) {

  unsigned i;

  if(a->len != b->len)
    return FALSE;

  for(i = 0; i < a->len; i++) {
    if(a->elems[i] != b->elems[i])
      return FALSE;
  }

  return TRUE;
}

typedef struct Bucket {
  unsigned size;
  unsigned capacity;
  Item **items;
} Bucket;

typedef struct Table {
  unsigned size;
  Bucket *buckets;
} Table;

#define INITIAL_CAPACITY 16

Table* new_table ( unsigned hash_sz ) {
  unsigned i;

  Table *t = malloc(sizeof(Table));

  t->size = hash_sz;
  t->buckets = calloc(hash_sz, sizeof(Bucket));

  for(i = 0; i < hash_sz; i++) {
    t->buckets[i].size = 0;
    t->buckets[i].capacity = INITIAL_CAPACITY;
    t->buckets[i].items = malloc(t->buckets[i].capacity * sizeof(Item*));
  }

  return t;
}

void clear( Table* t ) {
  unsigned i, j;

  for( i = 0; i < t->size; i++ ) {
    t->buckets[i].size = 0;
  }
}

void free_table ( Table *t ) {
  unsigned i, j;

  for( i = 0; i < t->size; i++ ) {
    free(t->buckets[i].items);
  }
  free(t->buckets);
  free(t);
}

unsigned compute_hash( Item *item ) {

  unsigned i;
  unsigned h = 0;

  for ( i = 0; i < item->len; i++ ) {
    h = jenkins_hash( (ub1*)(&(item->elems[i])), sizeof(unsigned), h );
  }

  return h;
}

Item* contains_item_w_hash( Table *t, Item *i, unsigned h ) {
  unsigned j;
  unsigned address = (t->size - 1) & h;

  for(j = 0; j < t->buckets[address].size; j++) {
    if (items_equal(i, t->buckets[address].items[j])) {
      return t->buckets[address].items[j];
    }
  }
  return NULL;
}

Item* contains_item( Table *t, Item *i) {
  return contains_item_w_hash( t, i, compute_hash(i) );
}

void add_item_w_hash( Table *t, Item *i, unsigned h ) {

  unsigned j;
  unsigned address = (t->size - 1) & h;

  for(j = 0; j < t->buckets[address].size; j++) {
    if (items_equal(i, t->buckets[address].items[j])) {
      return;
    }
  }
  
  if(t->buckets[address].capacity == t->buckets[address].size) {
    t->buckets[address].capacity *= 2;
    t->buckets[address].items = 
    realloc(t->buckets[address].items, (t->buckets[address].capacity * sizeof(Item *)) );
  }

  t->buckets[address].items[t->buckets[address].size++] = i;
}

void add_item( Table *t, Item *i ) {
  add_item_w_hash(t, i, compute_hash(i));
}

void remove_item( unsigned h, Item *i ) {
  printf(" REMOVE ITEM IN HASH TABLE NOT IMPLEMENTED!!!! " );
  exit(0);
  return;
}

#endif // unsigned_vec_hash_set.h

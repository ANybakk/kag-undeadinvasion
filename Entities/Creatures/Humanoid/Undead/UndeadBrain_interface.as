/*
 * Undead brain interface.
 
 * Author: ANybakk
 */

#define SERVER_ONLY

#include "UndeadBrain.as";
#include "UndeadVariables.as";



void onInit(CBrain@ this) {

  UndeadInvasion::UndeadBrain::onInit(this);
  
}

void onTick(CBrain@ this) {

  UndeadInvasion::UndeadBrain::onTick(this);

}
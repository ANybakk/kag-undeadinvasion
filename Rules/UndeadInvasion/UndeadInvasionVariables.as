/*
 * UndeadInvasion game mode variables
 * 
 * This script contains any variables associated with the game mode.
 * 
 * NOTE: To simply tweak variables on a server, create a new mod containing a 
 *       copy of this file with the same name.
 * 
 * NOTE: Scripts may rely on these variables. When overriding 
 *       these values or creating new entities based on this one, bundle this 
 *       file, or a derived version, together with any scripts used.
 * 
 * Author: ANybakk
 */

#include "EntitySpawn.as";


 
namespace UndeadInvasionVariables {
  
  //Define a minimum number of -1 (disabled) for players on each team for the game to start
  const s8 PLAYER_COUNT_START_MINIMUM = -1;
  
  //Define a minimum number of 1 for survivors for the game to start
  const u8 SURVIVOR_COUNT_START_MINIMUM = 1;

  //Define a maximum number of undead of 125
  const u8 UNDEAD_SPAWN_MAX_COUNT = 125;
  
  //Define a spawning interval of 4 seconds for top quarter of spawn site health
  const u8 UNDEAD_SPAWN_INTERVAL_1 = 4;
  
  //Define a spawning interval of 3 seconds for third quarter of spawn site health
  const u8 UNDEAD_SPAWN_INTERVAL_2 = 3;
  
  //Define a spawning interval of 2 seconds for second quarter of spawn site health
  const u8 UNDEAD_SPAWN_INTERVAL_3 = 2;
  
  //Define a spawning interval of 1 second for first quarter of spawn site health
  const u8 UNDEAD_SPAWN_INTERVAL_4 = 1;
  
  //Define an undead spawning factor during daytime of 2 (double interval)
  const u8 UNDEAD_SPAWN_DAYTIMEFACTOR = 2;
  
  //Define an undead spawning factor during daytime of 2 (base interval)
  const u8 UNDEAD_SPAWN_NIGHTTIMEFACTOR = 1;
  
  //Define an array of Undead entities to spawn
  const UndeadInvasion::EntitySpawn[] UNDEAD_ENTITY_SPAWN_MIX = {
    UndeadInvasion::EntitySpawn("Zombie", 60),          //Zombie 60% chance
    UndeadInvasion::EntitySpawn("Skeleton", 35),        //Skeleton 35% chance
    UndeadInvasion::EntitySpawn("Devilish Zombie", 5)   //Devilish Zombie 5% chance
  };
  
}
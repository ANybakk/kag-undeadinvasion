/*
 * Undead variables.
 * 
 * Author: ANybakk
 */

 
 
namespace UndeadVariables {

  //Define a rotting time of 5 seconds
  const u8 ROTTING_TIME = 5;
  
  //Define an attack damage of 0.5, which is normally half a heart (game mode attack modifier of 0.5)
  const f32 ATTACK_DAMAGE = 0.5f;

  //Define a collateral (tile) attack damage of 0.1 seconds
  const f32 COLLATERAL_ATTACK_DAMAGE = 0.1f;

  //Define a collateral (tile) attack frequency of 1 second
  const f32 COLLATERAL_ATTACK_FREQUENCY = 1.0f;
  
  //Define an amount of 2 coins to drop on death
  const u8 DROP_COIN_AMOUNT = 1;
  
  //Define a delay of 5 frames
  const u8 BRAIN_DELAY = 5; //TODO: Define in terms of seconds (float)

  //Define a detection radius of 32.0 (approximately 2 tiles in-between)
  const f32 BRAIN_DETECT_RADIUS = 32.0f;

  //Define a chasing radius of 48.0 (approximately 3 tiles in-between). Should be longer than detection radius 
  const f32 BRAIN_CHASE_RADIUS = 48.0f;

  //Define an attack frequency of 2 seconds
  const f32 BRAIN_ATTACK_FREQUENCY = 2;
  
  //Define a factor for movement in water of 0.5 horizontal, 1.0 vertical
	const Vec2f MOVEMENT_FACTOR_WATER(0.5f, 1.0f);
  
  //Define a factor for slowing down of 2.0 horizontal, 0.0 vertical
	const Vec2f MOVEMENT_FACTOR_SLOWDOWN(2.0f, 0.0f);
  
  //Define a maximum velocity of 0.5
	const f32 MOVEMENT_MAX_VELOCITY = 0.5f;
  
  //Define a walking acceleration of 3.0 horizontal, 0.0 vertical
  const Vec2f MOVEMENT_WALK_ACCELERATION(3.0f, 0.0f);
  
  //Define a running acceleration of 5.0 horizontal, 0.0 vertical
	const Vec2f MOVEMENT_RUN_ACCELERATION(5.0f, 0.0f);
  
  //Define a jumping acceleration of 0.0 horizontal, -2.4 vertical
	const Vec2f MOVEMENT_JUMP_ACCELERATION(0.0f, -2.4f);
  
}
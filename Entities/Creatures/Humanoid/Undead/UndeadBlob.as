/* 
 * Undead blob.
 * 
 * Author: ANybakk
 */
 
#include "Blob.as";
#include "HumanoidBlob.as";



namespace UndeadInvasion {

  namespace UndeadBlob {
  
  
  
    void onInit(CBlob@ this) { //Override
      
      UndeadInvasion::HumanoidBlob::onInit(this);
      
      setTags(this);
      
      //Set to not be in a usual player team (and not the same team as animals either)
      this.server_setTeamNum(-2);
      
      //Activate brain
      this.getBrain().server_SetActive(true);
      
    }
    
    
    
    void setTags(CBlob@ this) { //Override
      
      this.Tag("isUndead");
      
    }
    
    
    
    /**
     * Pickup check function
     */
    bool canBePickedUp(CBlob@ this, CBlob@ other) {
      
      //Finished, tell that this cannot be picked up
      return false;
      
    }
    
    
    
    /**
     * Collision check function
     */
    bool doesCollideWithBlob(CBlob@ this, CBlob@ other) {
      
      //Finished, tell that this collides
      return true;
      
    }
    
    
    
    /**
     * Collision event function
     * 
     * COMMENT: Is only called once per collision.
     * TODO: Consider if collision should cause a stumbling effect or something
     */
    void onCollision(CBlob@ this, CBlob@ other, bool solid, Vec2f normal, Vec2f point1) {
    
      //Check if debug mode
      if(g_debug > 0) {
      
        //Store position of collision
        this.set_Vec2f("collidedWithPosition", point1);
        
      }

      //Determine if collision has a left component
      bool collidedLeft = normal.x > 0.0f;
      
      //Determine if collision has a right component
      bool collidedRight = normal.x < 0.0f;
      
      bool collidedFacingDirection = (this.isFacingLeft() && collidedLeft) || (!this.isFacingLeft() && collidedRight);
      //Check if valid blob reference
      if(other !is null) {

        //Check if tagged as undead
        if(other.hasTag("isUndead")) {
        
          //Check if collision was in the facing direction
          if(collidedFacingDirection) {
          
            //Set undead in front collision flag
            this.Tag("collidedWithUndeadInFront");
          
          }
          
        }
        
      }
      
      /* This does not really work. Collision is quite random, and the function is only called once
      //Check if solid block
      if(solid) {
      
        //Retrieve a reference to the map object
        CMap@ map = this.getMap();
        
        //Obtain a tile object
        Tile tile = map.getTile(point1);
        
        //Check if tile type is wood
        if(tile.type == CMap::tile_wood) {
        
          //Initiate tile destruction
          map.server_DestroyTile(point1, 0.1f, this);
          
        }
      
      }
      */

      //Finished
      return;
      
    }
    
    
    
    /**
     * Hit event function
     * 
     * COMMENT: Damage received is normally 0.5 from builder, 1.0 from knight stab, 2.0 from knight slash
     */
    f32 onHit(CBlob@ this, Vec2f worldPoint, Vec2f velocity, f32 damage, CBlob@ hitterBlob, u8 customData) {
      
      if(g_debug > 0) { print("[UndeadBlob:onHit]: name=" + this.getName() + ", damage=" + damage + ", from=" + hitterBlob.getName()); }
      
      //Finished, return all damage (no damage reduction)
      //COMMENT: The actual damage going to be dealt is affected by the game mode's "attackdamage_modifier" value
      return damage;
      
    }
    
    
    
    /**
     * Death event function
     */
    void onDie(CBlob@ this) {

      //Drop coin(s) slightly above current position
      server_DropCoins(this.getPosition() + Vec2f(0,-3.0f), UndeadVariables::DROP_COIN_AMOUNT);
      
      //Initiate gibbing
      this.getSprite().Gib();
      
      //Finished
      return;

    }
    
    
    
    /**
     * Checks if a target is within chasing range.
     * 
     * @param   this            a blob reference.
     * @param   target          the target blob.
     */
    bool isWithinChasingRange(CBlob@ this, CBlob@ target) {
      
      //Finished, return true if distance is within the combined radius
      return UndeadInvasion::Blob::getDistance(this, target) <= UndeadVariables::BRAIN_CHASE_RADIUS;
      
    }
    
    
    
    /**
     * Checks if a target is within detection range.
     * 
     * @param   this            a blob reference.
     * @param   target          the target blob.
     */
    bool isWithinDetectionRange(CBlob@ this, CBlob@ target) {
      
      //Finished, return true if distance is within the combined radius
      return UndeadInvasion::Blob::getDistance(this, target) <= UndeadVariables::BRAIN_DETECT_RADIUS;
      
    }
  
  
  
    /**
     * Presses the correct movement keys to reach a target blob.
     * 
     * @param   this            a blob reference.
     * @param   target          the target blob.
     */
    void pressMovementKeys(CBlob@ this, CBlob@ target) {
    
      //Obtain this blob's position
      Vec2f position = this.getPosition();
      
      Vec2f targetPosition = target.getPosition();
      
      //Check if on ground or in water, and horizontal position is the same or target is within range
      if((this.isOnGround() || this.isInWater()) && (targetPosition.x == position.x || isWithinChasingRange(this, target))) {
      
        //Check if target is above
        if(targetPosition.y < position.y) {
        
          //Press up key
          this.setKeyPressed(key_up, true);
          
        }
        
        //Otherwise, check if target is below
        else if(targetPosition.y > position.y) {
        
          //Press down key
          this.setKeyPressed(key_down, true);
          
        }
        
      }
      
      //Check if target is to the left
      if(targetPosition.x < position.x) {
        
        //Press left key
        this.setKeyPressed(key_left, true);
        
      }
      
      //Otherwise, check if target is to the right
      else if(targetPosition.x > position.x) {
        
        //Press right key
        this.setKeyPressed(key_right, true);
        
      }
      
      //Finished
      return;
      
    }
    
    
    
  }
  
}
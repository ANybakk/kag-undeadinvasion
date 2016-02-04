/* 
 * This script holds everything associated with the blob aspect of the Zombie 
 * entity. That excludes things related to AI brains, AI movement etc.
 * 
 * NOTE:  This script relies on the variables set in "ZombieVariables.as", and 
 *        must therefore be bundled together with it, or a derived version, 
 *        within the same name-space(s).
 * 
 * Author: ANybakk
 */
 
#include "UndeadBlob.as";



namespace UndeadInvasion {

  namespace ZombieBlob {
  
  
  
    /**
     * Initializes this entity
     */
    void onInit(CBlob@ this) {
      
      UndeadInvasion::UndeadBlob::onInit(this);
      
      setTags(this);
      
    }
  
    
    
    /**
     * Sets various tags for this entity type. Inheriting types should call this.
     * 
     * @param   this            a blob reference.
     */
    void setTags(CBlob@ this) {
    
      this.Tag("isZombie");
      
    }
    
    
    
  }
  
}
#include "AudioSoundtrack.as";
#include "AmbienceSoundtrack.as";
#include "UndergroundSoundtrack.as";
#include "HighSoundtrack.as";



namespace ANybakk {

  namespace AudioVariables {
  
    const string[] MUSIC_TRACKS_DEFAULT = {
      "Sounds/Music/KAGWorld1-1a.ogg",
      "Sounds/Music/KAGWorld1-2a.ogg",
      "Sounds/Music/KAGWorld1-3a.ogg",
      "Sounds/Music/KAGWorld1-4a.ogg",
      "Sounds/Music/KAGWorld1-9a.ogg"
    };
  
    const string[] AMBIENCE_TRACKS_DEFAULT = {
      "Sounds/Music/ambient_forrest.ogg"
    };
  
    const string[] AMBIENCE_TRACKS_UNDERGROUND = {
      "Sounds/Music/ambient_cavern.ogg"
    };
  
    const string[] AMBIENCE_TRACKS_HIGH = {
      "Sounds/Music/ambient_mountain.ogg"
    };
    
    //Define an array of music tracks (subtypes can be used, generic should be earlier in the list)
    const ANybakk::AudioSoundtrack@[] SOUND_TRACKS = {
    
      ANybakk::AudioSoundtrack(
        "Default Music",        //name
        "Music",                //groupName
        MUSIC_TRACKS_DEFAULT,   //filePaths
        true,                   //stopOnCriteriaNotMet
        4.0f,                   //fadeoutTime
        4.0f                    //fadeinTime
      ),
    
      ANybakk::AmbienceSoundtrack(
        "Default Ambience",
        "Ambience",
        AMBIENCE_TRACKS_DEFAULT,
        true,
        4.0f,
        4.0f
      ),
    
      ANybakk::UndergroundSoundtrack(
        "Underground Ambience",
        "Ambience",
        AMBIENCE_TRACKS_UNDERGROUND,
        true,
        4.0f,
        4.0f
      ),
    
      ANybakk::HighSoundtrack(
        "High Ambience",
        "Ambience",
        AMBIENCE_TRACKS_HIGH,
        true,
        4.0f,
        4.0f
      )
      
    };
    
    const string MATCH_START_SOUND = "/ResearchComplete.ogg";
    
  }
  
}
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!other.portalgun) {
    sound_play_auto("portalgun_powerup1")
    other.portalgun=true
}

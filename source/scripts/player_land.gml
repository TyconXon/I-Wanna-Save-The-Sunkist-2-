///player_land(platform)
//called when the player lands on the floor or on a platform

var landed_on_platform;landed_on_platform=argument0

if (!landed_on_platform) vspeed=0

walljumpboost=0
djump=1
if (!onGround) {
   if landed_on_platform or instance_place(x+hspeed,y+1,Ladder) sound_play_auto("wood"+string(irandom(3)+1))
   else if instance_place(x+hspeed,y+1,ShootBlock) sound_play_auto("glassstep")
   else if instance_place(x+hspeed,y+1, StickyBlock) sound_play_auto("rubber_tire_impact_soft1")
   else if instances_place(x+hspeed,y+1, Pauser, Conveyor, MovingSolid) sound_play_auto("metal"+string(irandom(3)+1))
   else if instance_place(x+hspeed,y+1,SlipBlock) sound_play_auto("mud"+string(irandom(3)+1))
   else sound_play_auto("concrete"+string(irandom(3)+1))
}
onGround=true
coyoteTime=global.coyote_time

if (onfire) kill_player()

with (JumpRefresher) active=1

//jump buffering checks
if (jump_timer && key_jump()) {
    player_jump()
    //this correction is necessary to avoid making 4.5s too easy
    vspeed+=gravity
}

///player_hitwall(hspeed)
//called when the player hits a wall

hitthing = instance_place(x+hspeed,y,Block)
hanging = false

if(theendisnigh and hitthing != noone){
    if(!key_jump() and instance_place(x+hspeed,hitthing.bbox_top-15,Block) == noone){
        if(bbox_top < hitthing.bbox_top){
            y=hitthing.y
            vspeed = 0
            djump=1
            hanging = true
            facing *= -1
        }
    }
}

if(hitthing) with(instance_place(hitthing.x,hitthing.y,TimedBreakable)) event_perform(ev_collision,Player)

if(instance_place(x+hspeed,y,StickyBlock)){
    //other.vsp = vkUp?0:Math.min(other.vsp, 1);
    if key_jump() {vspeed = 0}
    else {vspeed = min(vspeed, 1)}
}
with(instance_place(x,y,IceField)){
   if(wallstop) savedhspeed=0
}

hspeed=0
with (AlignIndicator) {
    image_index=(other.bbox_left+2 = x || other.bbox_right+1 = x)
}

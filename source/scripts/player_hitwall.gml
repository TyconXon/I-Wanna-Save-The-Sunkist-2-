///player_hitwall(hspeed)
//called when the player hits a wall

hitthing = instance_place(x+hspeed,y,Block)
hanging = false

if(theendisnigh){
    if(!key_jump() and instance_place(x+hspeed,hitthing.bbox_top-16,Block) == noone){
        if(bbox_top < hitthing.bbox_top){
            y=hitthing.y
            vspeed = 0
            djump=1
            hanging = true
            facing *= -1
        }
    }
}

if(instance_place(x+hspeed,y,StickyBlock)){
    //other.vsp = vkUp?0:Math.min(other.vsp, 1);
    if key_jump() {vspeed = 0}
    else {vspeed = min(vspeed, 1)}
}

hspeed=0
with (AlignIndicator) {
    image_index=(other.bbox_left+2 = x || other.bbox_right+1 = x)
}

///player_hitceiling()
//called when the player bonks

vspeed=0

with(instance_place(x,y,IceField)) {

    other.djump=max(1,other.djump-1)
    if(wallstop) savedvspeed=0
}



// reset gravity to normal from antigrav cherry
if (cherried_antigrav) player_uncherry("antigrav")

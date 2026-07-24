///player_hitceiling()
//called when the player bonks

var potential;
potential=instance_place(x,y-1,MovingSolid)
if(potential!=noone) with(potential) {other.vspeed=min(0,vspeed)}
else vspeed=0



with(instance_place(x,y,IceField)) {

    other.djump=max(1,other.djump-1)
    if(wallstop) savedvspeed=0
}
with(instance_place(x,y-1,TimedBreakable)) event_perform(ev_collision,Player)


// reset gravity to normal from antigrav cherry
if (cherried_antigrav) player_uncherry("antigrav")

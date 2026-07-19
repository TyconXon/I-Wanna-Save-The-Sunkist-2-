#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
growdistance = 64
initialsize = 1
growspeed = 0.1
theStart = false
birthed = false
chosenx=0
choseny=0
thenew=noone

image_xscale = 0
image_yscale = 0

color=c_black
sizedecrement=0.5
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if(distance_to_object(Player) < growdistance){
  //grow
  if(image_xscale <= initialsize) image_xscale+=growspeed

  if(image_xscale >= initialsize and !instance_exists(thenew) and !Player.dead and !(image_xscale <= sizedecrement+0.1)) {
                  birthed = true
                  chosenx=approach(x,Player.x,sprite_width/4)
                  choseny=approach(y,Player.y,sprite_width/4)
                  thenew = instance_create(chosenx,choseny,AshGrowthChild)
                  thenew.initialsize = initialsize - sizedecrement
                  thenew.growdistance = growdistance - sizedecrement
                  thenew.growspeed = growspeed
                  thenew.sizedecrement = sizedecrement
  }
}else if(!instance_exists(thenew)){
  //shrink
  if(image_xscale > 0) image_xscale-=growspeed
  birthed=false
}

image_yscale = image_xscale
if(image_xscale <= 0) instance_destroy()
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!Player.dead) kill_player()

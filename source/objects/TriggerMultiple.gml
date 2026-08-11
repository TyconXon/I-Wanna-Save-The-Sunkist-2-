#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
mylock=noone
mytrig=noone

instStart=noone
instWhile=noone
instStop=noone

objFilter=Player

trap_is_triggered=noone

wasTouching=false
call_deactivation=false

conditionals = false
mustBeOnGround = "dont care"
mustBeTouchingWall = "dont care"
mustDoubleJumpState = "dont care"
customConditional = ""

destroyAfter = false

image_speed=0
image_index=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_place(x,y,TriggerLock)) exit
if (!instance_place(x,y,objFilter)) {
   if(wasTouching) {
      with (instStop)  {
         if(other.call_deactivation){ event_trigger(tr_trapuntriggered)} else {event_trigger(tr_traptriggered)}
      }
      if(destroyAfter) instance_destroy();
   }
   wasTouching=false
   image_index = wasTouching
   exit
}
if(conditionals){
   if(mustBeOnGround != "dont care"){
     if(objFilter==Player) {if(Player.onGround != (mustBeOnGround=="yes")) exit}
     else if(place_free(objFilter.x,objFilter.y+1)) exit
   }
   if(mustBeTouchingWall != "dont care"){
     with(objFilter) if(place_free(x+hspeed,y)) exit
   }
   if(mustDoubleJumpState != "dont care"){
     if((Player.djump==2) != (mustDoubleJumpState=="yes")) exit
   }
   if(customConditional!=""){
     if(!execute_string(customConditional)) exit
   }
}

if(!wasTouching) /*if(instWhile!=noone)*/ with (instStart) event_trigger(tr_traptriggered)
if(wasTouching) /*if(instWhile!=noone)*/ with (instWhile) event_trigger(tr_traptriggered)

wasTouching = true
image_index = wasTouching
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=n
*/
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field instStart: instance - begin touch
//field instWhile: instance - every frame while touching
//field instStop: instance - end touch
        //field call_deactivation: false - deactivate instead of activation
//field objFilter: object - Default: Player
//field conditionals: false
        //field mustBeOnGround: enum("dont care", "no", "yes")
        // field mustBeTouchingWall: enum("dont care", "no", "yes")
        // field mustDoubleJumpState: enum("dont care", "no", "yes")
        //field customConditional: string
//field retriggerDelay: number - delay in frames until this can be activated again
//field destroyAfter: false - After stop has been called. Could make this closer to a more traditional trigger
//field visible: false
//field sprite_index: sprite

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
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_place(x,y,TriggerLock)) exit
if (!instance_place(x,y,Player)) {
   if(wasTouching) with (instStop) event_trigger(tr_traptriggered)
   exit
}

if(!wasTouching) if(instWhile!=noone) with (instStart) event_trigger(tr_traptriggered)
if(wasTouching) if(instWhile!=noone) with (instWhile) event_trigger(tr_traptriggered)

wasTouching = true
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field instStart: instance - begin touch
//field instWhile: instance - every frame while touching
//field instStop: instance - end touch
//field objFilter: object - Default: Player
//field visible: false
//field sprite_index: sprite

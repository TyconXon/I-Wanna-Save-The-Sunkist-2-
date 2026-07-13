#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///instructions & init

/*
    Gizmos are the general parent for any object that will react to triggers.
    They will receive a Trap is Triggered event whenever a triggerbomb detonates on them.

    look in custom_traps() for more information.
*/

dir=0
spd=0
hsp=0
vsp=0
grav=0
grav_dir=noone
path=noone
path_endaction=path_action_stop
path_speed=0
path_absolute=true
path_scaling=1
path_xstart=x
path_ystart=y
sound=""

scaleh=0
scalev=0
scaling=0

rotate=0
rotating=0

no_destroy_outside=0
trigger_on_create=0
trigger_on_touch = false

trap_redir_index=0
trap_stop_index=0
trap_destroy_index=0

move_to_xy[0]=noone
move_to_xy[1]=noone
move_spd=1
move_time=0
move_t=0
move_relative=0
move_easing="EaseLinear"

move_to_xy_grav[0]=noone
move_to_xy_grav[1]=noone
move_grav=0

execute_code=""
execute_code_timer=0
execute_code_t=0
executed=0

triggerOnDeath = noone
weld_parent=noone
followCoordinate = "none"

preactiveMovement = false

trap_delay=0

trg=0
em = 0

variables_defined=true

xOffset = 0
yOffset = 0

lastGridX=0
lastGridY=0

notVisibleTillThen=false
extWithDimen[0] = 0
extWithDimen[1] = 0
extCreatePos[0] = 0
extCreatePos[1] = 0
extMiddle[0] = 0
extMiddle[1] = 0
extendingDontCopy=false

trap_shake=false
trigger_on_view=false

extFollowerer = noone
explodeOnDeath=false
allowChaining=false
trigger_on_bullet=false
trigger_on_view=false
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (triggerOnDeath) {event_trigger(tr_traptriggered)}
if(explodeOnDeath) explode_me()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if(variable_local_exists("weld_parent")){
    with (weld_parent) {
        other.x = self.x - other.xOffset
        other.y = self.y - other.yOffset
    }
}
if(variable_local_exists("followCoordinate")){
    if(followCoordinate == "offlineX"){
        with(Player){other.x = x}
    }
    if(followCoordinate == "offlineY"){
        with(Player){other.y = y}
    }
}

if (!trg) exit
else if (trap_delay) {
    if(trap_shake){
        if (trap_delay mod 4 < 2) {
            if(vsp) x=xstart-1
            if(hsp) y=ystart-1
        } else {
            if(vsp) x=xstart+1
            if(hsp) y=ystart+1
        }
    }
    trap_delay-=1
    if (trap_delay<=0) event_trigger(tr_traptriggered)
    exit
}
if(variable_local_exists("followCoordinate")){
    if(followCoordinate == "onlineX"){
        with(Player){other.x = x}
    }
    if(followCoordinate == "onlineY"){
        with(Player){other.y = y}
    }
    if(followCoordinate == "onceX"){
        with(Player){other.x = x}
        followCoordinate = "none"
    }
    if(followCoordinate == "onceY"){
        with(Player){other.y = y}
        followCoordinate = "none"
    }
}

if (scaling) {
    sw=sprite_get_width(sprite_index)
    sh=sprite_get_height(sprite_index)

    if (scaleh>0) {image_xscale+=(scaleh*dt)/sw x+=scaleh*(sprite_xoffset/sw/image_xscale)}
    if (scalev>0) {image_yscale+=(scalev*dt)/sh y+=scalev*(sprite_yoffset/sh/image_yscale)}

    if (scaleh<0) {image_xscale+=-(scaleh*dt)/sw x+=scaleh*(1-sprite_xoffset/sw/image_xscale)}
    if (scalev<0) {image_yscale+=-(scalev*dt)/sh y+=scalev*(1-sprite_yoffset/sh/image_yscale)}
}

if (rotating) {
    image_angle+=rotate*dt
}
if(variable_local_exists("notVisibleTillThen")) visible=true
if(variable_local_exists("extending")) {

    if(variable_local_exists("extendingMiddle")){

       if (vsp) extCreatePos[0] = x - extMiddle[0] - (extWithDimen[0])
       else extCreatePos[0] = x

       if (hsp) extCreatePos[1] = y - extMiddle[1] - (extWithDimen[1])
       else extCreatePos[1] = y
    }else{
       extCreatePos[0] = x; extCreatePos[1] = y
    }
    extCreatePos[0] -= (extWithDimen[0]*sign(hsp)) - hspeed
    extCreatePos[1] -= (extWithDimen[1]*sign(vsp)) - vspeed


     extFollowerer.x = extCreatePos[0]
     extFollowerer.y = extCreatePos[1]
     if(hspeed!=0 and lastGridX != roundto_unbiased(extCreatePos[0],extWithDimen[0]) ){
                  lastGridX=roundto_unbiased(extCreatePos[0],extWithDimen[0])

                   with(instance_create(extCreatePos[0],extCreatePos[1],extendingWith)){
                       if(!other.extendingDontCopy){
                           image_blend = other.image_blend
                           image_xscale = other.image_xscale
                           image_yscale = other.image_yscale
                           image_angle = other.image_angle
                       }
                       depth = other.depth+1
                       if(variable_local_exists("childCreationCode")) execute_string(childCreationCode)
                   }

     }
     if (vspeed!=0 and lastGridY != roundto_unbiased(extCreatePos[1],extWithDimen[1]) ){
                   lastGridY=roundto_unbiased(extCreatePos[1],extWithDimen[1])
                with(instance_create(extCreatePos[0],extCreatePos[1],extendingWith)){
                    if(!other.extendingDontCopy){
                       image_blend = other.image_blend
                       image_xscale = other.image_xscale
                       image_yscale = other.image_yscale
                       image_angle = other.image_angle
                   }
                   depth = other.depth+1
                   if(variable_local_exists("childCreationCode")) execute_string(childCreationCode)
               }

     }
}

if (execute_code!="") {
    if (execute_code_timer==0) {
        if (!executed) {executed=1 execute_string(execute_code)}
    } else if (execute_code_t mod execute_code_timer==0) execute_string(execute_code)
    execute_code_t+=1
}

if (move_to_xy[0]!=noone && move_to_xy[1]!=noone && move_spd!=0 && trg) {
    move_t=approach(move_t,move_time,1)
    if (!move_relative) {
        x=ease(move_t,0,move_time,xstart,move_to_xy[0],move_easing)
        y=ease(move_t,0,move_time,ystart,move_to_xy[1],move_easing)
    } else {
        x=ease(move_t,0,move_time,xstart,xstart+move_to_xy[0],move_easing)
        y=ease(move_t,0,move_time,ystart,ystart+move_to_xy[1],move_easing)
    }
}

if (move_to_xy_grav[0]!=noone && move_to_xy_grav[1]!=noone && move_grav>0) {
    if (point_distance(x,y,move_to_xy_grav[0],move_to_xy_grav[1])<=speed) {
        x=move_to_xy_grav[0]
        y=move_to_xy_grav[1]
        hspeed=0
        vspeed=0
        gravity=0
    }
}

with (TrapStop) if (other.trap_stop_index==index) if (instance_place(x-other.hspeed*dt,y-other.vspeed*dt,other.id)) with (other) {
    x+=hspeed*dt y+=vspeed*dt
    if (hspeed>0) repeat (ceil( hspeed)) {x-=1 if (!instance_place(x,y,other.id)) break}
    if (hspeed<0) repeat (ceil(-hspeed)) {x+=1 if (!instance_place(x,y,other.id)) break}
    if (vspeed>0) repeat (ceil( vspeed)) {y-=1 if (!instance_place(x,y,other.id)) break}
    if (vspeed<0) repeat (ceil(-vspeed)) {y+=1 if (!instance_place(x,y,other.id)) break}

    speed=0

    if (scaling) {
        sw=sprite_get_width(sprite_index)
        sh=sprite_get_height(sprite_index)

        if (scaleh>0) repeat (ceil( scaleh)) {x-=1*(  sprite_xoffset/sw/image_xscale) image_xscale-=1/sw if (!instance_place(x,y,coll)) break}
        if (scalev>0) repeat (ceil( scalev)) {y-=1*(  sprite_yoffset/sh/image_yscale) image_yscale-=1/sh if (!instance_place(x,y,coll)) break}
        if (scaleh<0) repeat (ceil(-scaleh)) {x-=-1*(1-sprite_xoffset/sw/image_xscale) image_xscale-=1/sw if (!instance_place(x,y,coll)) break}
        if (scalev<0) repeat (ceil(-scalev)) {y-=-1*(1-sprite_yoffset/sh/image_yscale) image_yscale-=1/sh if (!instance_place(x,y,coll)) break}

        scaling=false
    }

    if (rotating) {
        image_angle-=rotate
        rotating=false
    }

    if (other.sound!=""){
        sound_play_auto(other.sound)
        if (other.soundPlayOnce){
            other.sound=""
        }
    }
}

with (TrapRedirect) if (other.trap_redir_index==index) if (instance_place(x-other.hspeed,y-other.vspeed,other.id)) with (other) {
    x+=hspeed*dt y+=vspeed*dt
    if (hspeed>0) repeat (ceil( hspeed)) {x-=1 if (!instance_place(x,y,other.id)) break}
    if (hspeed<0) repeat (ceil(-hspeed)) {x+=1 if (!instance_place(x,y,other.id)) break}
    if (vspeed>0) repeat (ceil( vspeed)) {y-=1 if (!instance_place(x,y,other.id)) break}
    if (vspeed<0) repeat (ceil(-vspeed)) {y+=1 if (!instance_place(x,y,other.id)) break}

    gravity=other.grav*dt
    if (other.hsp==0 && other.vsp==0 && other.spd==0 && other.dir==0) {
        hspeed*=-1
        vspeed*=-1
    } else if (other.spd==0 && other.dir==0) {
        hspeed=other.hsp*dt
        vspeed=other.vsp*dt
    } else if (other.hsp==0 && other.vsp==0) {
        speed=other.spd*dt
        direction=other.dir
    } else {
        speed=other.spd*dt
        direction=other.dir
        hspeed+=other.hsp*dt
        vspeed+=other.vsp*dt
    }

    if (other.sound!=""){
        sound_play_auto(other.sound)
        if (other.soundPlayOnce){
            other.sound=""
        }
    }
}
if(variable_local_exists("bounceOffWalls")){
    if (hspeed!=0) if (!place_free(x+hspeed,y)){ hspeed=-hspeed }
    if (vspeed!=0) if (!place_free(x,y+vspeed)){ vspeed=-vspeed }
}


with (TrapDestroy) if (other.trap_destroy_index==index) if (instance_place(x-other.hspeed,y-other.vspeed,other.id)) with (other) {
    if (other.sound!=""){
        sound_play_auto(other.sound)
        if (other.soundPlayOnce){
            other.sound=""
        }
    }
    instance_destroy()
}

if(variable_local_exists("weld_parent")){
    with (weld_parent) {
        other.xOffset = self.x - other.x
        other.yOffset = self.y - other.y
    }
}
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!variable_local_exists("trigger_on_touch") or !trigger_on_touch)exit;
event_trigger(tr_traptriggered)
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!variable_local_exists("trigger_on_bullet") or !trigger_on_bullet)exit;
event_trigger(tr_traptriggered)
#define Collision_Explosion
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!allowChaining) exit
instance_destroy()
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!no_destroy_outside && trg) {
    if (x>room_width and hspeed>0)
    or (x<0 and hspeed<0)
    or (y>room_height and vspeed>0)
    or (y<0 and vspeed<0) {
        instance_destroy()
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///fields definition

//field sound: string
//field preactiveMovement: false - Will move before activation.
    //field hspeed: number
    //field vspeed: number
//field movement: false
    //field dir: angle
    //field spd: number
    //field hsp: number
    //field vsp: number
    //field grav: number - Use low numbers, like 0.2
        //field grav_dir: angle - is defined by default.
//field scaling_rotation: false
    //field scaleh: number - scales from corner
    //field scalev: number - scales from corner
    //field rotate: number - tip: direction is influenced by rotation
//field advanced_movement: false
    //field path: path
        //field path_endaction: enum(path_action_continue,path_action_restart,path_action_reverse,path_action_stop)
        //field path_absolute: true
        //field guess_position: false
                //field path_position: number - 0 through 1
        //field path_scaling: number
        //field path_speed: number - remember to set this!
    //field move_to_xy: xy
        //field move_spd: number
        //field move_relative: false
        //field move_easing: enum("EaseLinear","EaseInSine","EaseOutSine","EaseInOutSine","EaseInQuad","EaseOutQuad","EaseInOutQuad","EaseInCubic","EaseOutCubic","EaseInOutCubic","EaseInQuart","EaseOutQuart","EaseInOutQuart","EaseInQuint","EaseOutQuint","EaseInOutQuint","EaseInCirc","EaseOutCirc","EaseInOutCirc","EaseInBack","EaseOutBack","EaseInOutBack")
    //field move_to_xy_grav: xy
        //field move_grav: number
//field control: false
    //field no_destroy_outside: false
    //field trigger_on_create: false
    //field trigger_on_view: false
    //field trigger_on_bullet: false
    //field trigger_on_touch: false
    //field trap_delay: number
            //field trap_shake: false
    //field trap_redir_index: number
    //field trap_stop_index: number
    //field trap_destroy_index: number
    //field execute_code: string
        //field         execute_code_timer: number - (0=once, 1=every frame, 2=every 2 frames, etc)
//field sunkist: false
    //field weld_parent: instance - Follows this instance as if it were welded from this position
    //field triggerOnDeath: instance - When this instance dies, the selected instance will activate
    //field followCoordinate: enum("offlineX","offlineY","onlineX","onlineY","onceX","onceY")
    //field sprite_index: sprite
    //field bounceOffWalls: false
    //field extending: false - Make sure to define extendingWith too. Continously yet efficiently create a trail of objects.
            //field extendingWith: object
            //field extendingDontCopy: false - The objects don't copy the properties of the parent.
            //field extendingMiddle: false - Attempts to center objects.
    //field childCreationCode: string - Code to be executed upon all children created from this instance.
    //field deathMessage: string - If the player is killed by this, show this message.
    //field notVisibleTillThen: false - Visible is false until activation.
    //field explodeOnDeath: false
    //field allowChaining: false
    //field emotion: enum(em_suprise,em_question,em_sing,em_love,em_mad,em_sad,em_bad,em_dots,em_idea,em_sleep)
    //field randomize_field: string - Numeric field to randomize
            //field rand_range: xy - The limites of said field

if (!variable_local_exists("variables_defined")) {
    show_error("Error in instance "+string(id)+" of object "+object_get_name(object_index)+": Gizmo parent variables are not defined. Please use event_inherited()/Call Event on your object's Create event to correctly set up "+object_get_name(object_get_parent(object_index))+" inheritance.",1)
    exit
}
if (variable_local_exists("randomize_field") && variable_local_exists("rand_range")){
   variable_local_set(randomize_field,random_range(rand_range[0],rand_range[1]))
}
if(variable_local_exists("extendingWith")){
                extWithDimen[0] = sprite_get_width(object_get_sprite(extendingWith))*image_xscale
                extWithDimen[1] = sprite_get_height(object_get_sprite(extendingWith))*image_yscale
                if(image_angle == 90||image_angle=270) {
                               extMiddle[1] = ( (image_xscale * sprite_get_width(image_index))  )
                               extMiddle[0] = ( (image_yscale * sprite_get_height(image_index))  )
                }else{
                               extMiddle[1] = ( (image_yscale * sprite_get_height(image_index))  )
                               extMiddle[0] = ( (image_xscale * sprite_get_width(image_index))  )
                }
}

if (move_to_xy[0]!=noone && move_to_xy[1]!=noone && move_spd) {
    move_time=round_unbiased(point_distance(xstart,ystart,move_to_xy[0],move_to_xy[1])/move_spd)
    move_time=max(move_time,1)
}

if(variable_local_exists("weld_parent")){
    with (weld_parent) {
        other.xOffset = self.x - other.x
        other.yOffset = self.y - other.y
    }
}
if(notVisibleTillThen) visible=false
if (trigger_on_create) sound=""

trap_delay/=dt

if (trigger_on_create and object_index!=AddTrigger) event_trigger(tr_traptriggered)
#define Other_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (path_position>1) {
    path_position=0
    x=path_get_x(path_index,path_position)
    y=path_get_y(path_index,path_position)
    if (!path_absolute) {
        x+=path_xstart
        y+=path_ystart
    }
}
#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///get movin'

trg=1

if (trap_delay>0) exit

move_t=0

if (sound!="") sound_play_auto(sound)

if(variable_local_exists("emotion")){
   em = instance_create(x,y,Emotion)
   em.image_index = emotion
}

if (path!=noone) {
    path_start(path,path_speed*dt,path_endaction,path_absolute)
    path_scale=path_scaling
    if(variable_local_exists("guess_position")) if(guess_position==true){
       path_position = 1-(point_distance(xstart,ystart,path_get_x(path_index,1),path_get_y(path_index,1))/point_distance(path_get_x(path_index,0),path_get_y(path_index,0),path_get_x(path_index,1),path_get_y(path_index,1)))
    }
    path_xstart=x
    path_ystart=y
} else {
    speed=spd*dt
    direction=dir
    hspeed+=hsp*dt
    vspeed+=vsp*dt
}

if (scaleh!=0 || scalev!=0) {
    scaling=1
}

if (rotate!=0) {
    rotating=1
}

if (grav!=0) {
    gravity=grav*dt*dt
}

if (grav_dir!=noone) {
    gravity_direction=grav_dir
}

if(variable_local_exists("extending")){
    if(variable_local_exists("extendingMiddle")){
       
       if (vsp) extCreatePos[0] = x - extMiddle[0] - (extWithDimen[0]/2)
       else extCreatePos[0] = x
       
       if (hsp) extCreatePos[1] = y - extMiddle[1] - (extWithDimen[1]/2)
       else extCreatePos[1] = y
    }else{
       extCreatePos[0] = x; extCreatePos[1] = y
    }
    extCreatePos[0] -= (extWithDimen[0]*sign(hsp)) - hspeed
    extCreatePos[1] -= (extWithDimen[1]*sign(vsp)) - vspeed
    
    extFollowerer = instance_create(extCreatePos[0],extCreatePos[1],extendingWith)
    with(extFollowerer){
        if(!other.extendingDontCopy){
           image_blend = other.image_blend
           image_xscale = other.image_xscale
           image_yscale = other.image_yscale
           image_angle = other.image_angle
        }
       depth = other.depth-1
       if(variable_local_exists("childCreationCode")) execute_string(childCreationCode)
   }
}

if (move_to_xy_grav[0]!=noone && move_to_xy_grav[1]!=noone && move_grav>0) {
    move_towards_gravity(move_to_xy_grav[0],move_to_xy_grav[1],move_grav)
    vspeed-=gravity/2
}

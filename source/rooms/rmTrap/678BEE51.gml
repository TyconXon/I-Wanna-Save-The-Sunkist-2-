//gm82 fields begin
movement=true
dir=90
spd=5
vsp=-4
grav=0.2
control=true
trap_delay=500
trap_shake=true
when_shake=100
trap_stop_index=3
execute_code="if(vspeed>1 and truthy("+chr(34)+"applesauce"+chr(34)+",true)){applesauce=false;dir=direction_to_object(Player);image_angle=dir-90;direction=dir;speed=4}"
execute_code_timer=1
sunkist=true
stopOnDeath=true
//gm82 fields end

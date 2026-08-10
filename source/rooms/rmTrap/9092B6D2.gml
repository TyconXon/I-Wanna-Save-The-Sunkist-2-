//gm82 fields begin
movement=true
dir=90
spd=3
vsp=-3.5
grav=0.1
control=true
trap_delay=400
trap_shake=true
when_shake=100
trap_stop_index=3
execute_code="if(truthy("+chr(34)+"applesauce"+chr(34)+",true) and vspeed>1){applesauce=false;dir=random_range(0,360);image_angle=dir-90;direction=dir;speed=4}"
execute_code_timer=3
sunkist=true
explodeOnDeath=true
stopOnDeath=true
//gm82 fields end

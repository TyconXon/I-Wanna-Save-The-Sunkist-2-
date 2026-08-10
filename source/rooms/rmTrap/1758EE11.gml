//gm82 fields begin
instance=rmTrap_5BE35433
control=true
trap_delay=100
execute_code="if(image_xscale<3){image_xscale+=0.1*dt;x=993-((image_xscale-1)*32)}else{image_xscale=3;x=992-64;execute_code_timer=0}"
execute_code_timer=1
//gm82 fields end

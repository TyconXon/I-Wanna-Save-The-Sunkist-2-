var anderson;
anderson = instance_create(x+(sprite_width/2),y+(sprite_height/2),Explosion)
sound_play_auto("snd_badexplosion")
anderson.image_xscale=image_xscale+1
anderson.image_yscale=anderson.image_xscale
anderson.depth = depth - 1
if(variable_local_exists("deathMessage")) anderson.deathMessage=deathMessage

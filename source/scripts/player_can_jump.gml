//returns whether the player is considered to be standing on the ground
if (!object_is_child_of(Player) and object_index != KidGhost) with (Player) return player_can_jump()
if (instance_place(x,y+1,StickyBlock)) return false;
else return (onGround || onPlatform || hanging)

return false

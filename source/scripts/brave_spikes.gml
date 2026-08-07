object_set_sprite(SpikeD,sprSpikeDownVHard)
object_set_sprite(SpikeL,sprSpikeLeftVHard)
object_set_sprite(SpikeR,sprSpikeRightVHard)
object_set_sprite(SpikeU,sprSpikeUpVHard)
with(SpikeD){ if(sprite_index = sprSpike) sprite_index = sprSpikeDownVHard}
with(SpikeL){ if(sprite_index = sprSpikeLeft) sprite_index = sprSpikeLeftVHard}
with(SpikeR){ if(sprite_index = sprSpikeRight) sprite_index = sprSpikeRightVHard}
with(SpikeU){ if(sprite_index = sprSpikeUp) sprite_index = sprSpikeUpVHard}

savedatap("brave",true)

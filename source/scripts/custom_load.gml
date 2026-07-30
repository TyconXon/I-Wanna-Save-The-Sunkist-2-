//load gimmicks

with (Player) {
    dot_hitbox=savedata("whitedot")
    dotkid=savedata("dotkid")
    telekid=savedata("telekid")
    maxjumps=savedata("numjumps")
    vvvvvv=savedata("vvvvvv")
    theendisnigh=savedata("theendisnigh")
    beamstate=savedata("beamstate")
    fox=savedata("fox")
    portalgun=savedata("portalgun")
    //levelcoins=savedata("levelcoins")
    if(global.player_skin == skin_ash and !theendisnigh) global.player_skin = skin_default

}


de_load(savedata("dialog"))

//add your custom load code here

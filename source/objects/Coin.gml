#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
type = "Temporary"
value = 1
collection_trigger = noone

counter=0
collected=0
gottem=0
message=0
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!collected) {
    if(type!="Temporary") persist_hash(1)

    collected=1
    gottem=1
    sound_play_auto("CP_Gain", random_range(0.8,1.2))
    image_blend=$404040
    image_alpha=0.2

    if (type=="Permanent") {
        savedatap("coins", savedatap("coins") + value   )
    } else if(type!="Temporary") {
        Player.levelcoins += value

    } else {
        Player.temporarycoins+=value
        image_alpha=0.05
    }
    trigger_broadcast(tr_coin)
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
A modular collectible.
*/
//field type: enum("Temporary", "Saved", "Permanent")
//field value: number
//field collection_trigger: instance - Instance to trigger once collected
//field sprite_index: sprite
//field sound: string

if(type!="Temporary") collected = persist_hash(0, (type == "Permanent"))
if(type=="Saved" and collected) Player.levelcoins+=value

if(collected){
   image_blend=$404040
   image_alpha=0.2
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(gottem) exit
switch (counter mod 60) {
    case  0: {y-=1}break
    case 10: {y-=2}break
    case 20: {y-=1}break
    case 30: {y+=1}break
    case 40: {y+=2}break
    case 50: {y+=1}break
}
counter=(counter+1) mod 600
draw_self()
#define Trigger_Draw End
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (gottem) {
    y=(y*9+ystart-24)/10
    draw_set_halign(1)
    draw_set_font(fntSignpost)
    draw_set_alpha(1-(counter/-50))

    var txt;
    txt = "+"
    if(type=="Permanent") txt += "¢"
    else if (type=="Saved") txt += "*"
    txt += string(value)
    if(type=="Permanent") txt += " (" + string(savedatap("coins")) +" )"

    draw_text(Player.x,Player.y-32,txt)
    draw_set_halign(0)
    draw_set_alpha(1)
    counter=min(0,counter-1)
    if (counter<-50) instance_destroy()
} //else if (message==2) draw_sign_text(Player.x,Player.y,fntFileSmall,$ffffff,lang("item save"),1)

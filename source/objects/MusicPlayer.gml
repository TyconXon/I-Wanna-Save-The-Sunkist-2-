#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
BGM=""
loop=1
deathSong=""
unsyncedDeathSong=""
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (MusicPlayerSection) if (inside_view()) {
    exit
}

sound_play_music(BGM,loop)
if(MusicPlayer.deathSong!="" and variable_global_exists("formerPosition") and global.wasDead){
        sound_set_pos(global.music_instance,global.formerPosition)
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
    this will play when the room is entered
*/

//field BGM: string
//field deathSong: string
//field unsyncedDeathSong: string
//field loop: true

alarm[0]=1

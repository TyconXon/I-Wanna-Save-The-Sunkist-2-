#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
backgroundNumber=0

selectiveHandling=false
alpha= false
blend= false
xscale= false
yscale= false
positionx= false
positiony= false
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
i=backgroundNumber

if(!selectiveHandling or alpha) background_alpha[i]=image_alpha
if(!selectiveHandling or blend) background_blend[i]=image_blend
if(!selectiveHandling or xscale) background_xscale[i]=image_xscale
if(!selectiveHandling or yscale) background_yscale[i]=image_yscale
if(!selectiveHandling or positionx) background_x[i]=x
if(!selectiveHandling or positiony) background_y[i]=y
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
    Moves the selected background with this...
*/

//field backgroundNumber: number
//field selectiveHandling: false - only handle selected values
        //field alpha: false
        //field blend: false
        //field xscale: false
        //field yscale: false
        //field positionx: false
        //field positiony: false
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/

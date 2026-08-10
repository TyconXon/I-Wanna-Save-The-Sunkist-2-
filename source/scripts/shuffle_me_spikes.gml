
var ogPositions;
ogPositions[0]=1216;
ogPositions[1]=1264;
ogPositions[2]=1312;
ogPositions[3]=1360;
ogPositions[4]=1408;



var thePositions;
thePositions = ds_list_create()

ds_list_add(thePositions,ogPositions[0]);
ds_list_add(thePositions,ogPositions[1]);
ds_list_add(thePositions,ogPositions[2]);
ds_list_add(thePositions,ogPositions[3]);
ds_list_add(thePositions,ogPositions[4]);

var theDelays;
theDelays = ds_list_create()

ds_list_add(theDelays,100);
ds_list_add(theDelays,300);
ds_list_add(theDelays,450);
ds_list_add(theDelays,600);
ds_list_add(theDelays,750);

ds_list_shuffle(theDelays)
ds_list_shuffle(thePositions)

for (i=0; i<ds_list_size(thePositions); i+=1)
{
     pos = ds_list_find_value(thePositions,i)+1
     del = ds_list_find_value(theDelays,i)
     ogpos = ogPositions[i]

     with(instance_position(ogpos,1808,SpikeU)){
         x=other.pos
         xstart=x
         trap_delay=other.del

     }
};

ds_list_destroy(thePositions);
ds_list_destroy(theDelays);

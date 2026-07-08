with(SunkistHimself) image_xscale = 1

if (de_dialog(sprSunk,"dog",0.5,"Hey, Kid. Enjoying the party?#Would you mind fetching me a soda?",false)) {
    if (de_choice("Let me go get it!")) {
        if (de_dialog(sprSunk,"dog",0.5,"Alrighty! Be quick, I'm expecting a visitor!")) de_end()
    }
    if (de_choice("Who are you?")) {
        if (de_dialog(sprSunk,"dog",0.5,"It's me, Sunkist! Did you forget?")) {
            if (de_dialog(sprSunk,"dog",0.5,"I run this place, the Sunkist's Palace.#This place uses me like a battery to power itself!")) {
               if (de_dialog(sprSunk,"dog",0.5,"Now go fetch me that soda, will ya?")) de_end()
            }
        }
    }
}

with(SunkistHimself) image_xscale = -1

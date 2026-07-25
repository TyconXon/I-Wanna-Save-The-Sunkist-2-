///song_name(file)
switch (argument0)
{
    //case "a": return "a - b, c"; break;

    //misc
    case "kikky_upgrade": return "kikky_upgrade - Toby Fox, Deltarune ch5"; break;
    case "rem": return "Rem's theme - Valve, Deadlock"; break;
    case "musGuyRock":case "musMegaman": return "You should know this song."; break;
    case "sploder": return "Some song from Sploder"; break;
    case "zengarden": return "Zen Garden from PvZ"; break;

    //castle crashers
    case "cc_barracks": return "Barracks theme - Castle Crashers"; break;
    case "Dark Skies":case "Spanish Waltz":case "Winterbliss":
        return argument0+" - Castle Crashers"; break;
    case "cc_creepyfrog": return "Creepy frog - Castle Crashers"; break;
    case "INTRO": return "TOAASTTYYYY - Castle Crashers"; break;

    //changed
    case "changed2": return "Black Goo Zone - Shizi, (redacted)"; break;
    case "changed5": return "Vent Pipe - Shizi, (redacted)"; break;
    case "changed6chase": return "White Tail Chase 1 - Shizi, (redacted)"; break;
    case "changed7chase": return "Whit Tail chase 2 - Shizi, (redacted)"; break;
    case "changed17": return "Cat Chase - Shizi, not mewgenics"; break;

    //edmund
    case "cartmenu": return "Cart menu - Ridiculon, The End is Nigh"; break;
    case "isolatedshowers": return "Isolated Showers - Justin Karpel, Time Fcuk"; break;
    case "learningcurve": return "Learning Curve - Justin Karpel, Time Fcuk"; break;
    case "musAsAbove": return "As Above - Ridiculon, The End is Nigh"; break;
    case "spewer": return "Spewer theme - Danny Baranowsky, Spewer"; break;

    //isaac
    case "apostate": return "Apostate - Danny Baranowsky, Isaac (flash)"; break;
    case "darkroom": return "Morphine - Mudeth, Isaac (antibirth)"; break;
    case "esc": return "ESC - Mudeth, Isaac (antibirth)"; break;
    case "lullaby": return "Forgotten Lullaby - Mudeth, Isaac (antibirth)"; break;
    case "peace": return "Peace Be With You - Danny Baranowsky, Isaac (flash)"; break;
    case "sheol": return "Sheol - Ridiculon, Isaac (rebirth)"; break;

    case "caves_battle": case "caves_boss": return "Crystalline Dreams - Ridiculon, Mewgenics"; break;
    case "theend_battle": case "theend_boss": return "We're Dead! - Ridiculon, Mewgenics"; break;
    case "steven": return "Steven - Ridiculon, Mewgenics"; break;

    case "coma": return "Stay in your Coma - Alias Conrad Coldwood, OFF"; break;
    case "logosfx": return "'logosfx' - Valve, Half-Life"; break;
    case "Music_postgame_155bpm": return "Post game - Valve, Deadlock"; break;
    case "Music_stinger_rejuv_drop_7s": return "Rejuv - Valve, Deadlock"; break;
    case "peper": return "Peper [sic] Steak - Alias Conrad Coldwood, OFF"; break;

    case "off_in": return "Rainy Day (in) - Alias Conrad Coldwood, OFF"; break;
    case "off_meat": return "Rainy Day (and meat) - Alias Conrad Coldwood, OFF"; break;
    case "off_out": return "Rainy Day (out) - Alias Conrad Coldwood, OFF"; break;
    case "peppersteak": return "Pepper Steak, looped - Alias Conrad Coldwood, OFF"; break;
    case "worst": return "Today is Worst - Alias Conrad Coldwood, OFF"; break;

    case "song4": case "song5": case "song10": case "song11": return argument0+" - Tag: Power of Paint"; break;

    default: return argument0;
}

///coins(theType)
theType=argument0
switch (theType)
{
    case "Permanent": return savedatap("coins") break;
    case "Temporary": return Player.temporarycoins break;
    default: return Player.levelcoins;
}

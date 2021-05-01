package network;

/**
 * @author Kaelan
 */

typedef OpenLRPacket = {
	var action:NetAction;
	var peername:String;
	var data:Array<Dynamic>;
	var localecho:Bool;
	var globalecho:Bool;
	var echoinfo:Array<String>;
}
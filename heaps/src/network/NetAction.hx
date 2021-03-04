package network;

/**
 * @author Kaelan
 */
enum abstract NetAction(String) from String {
	var joinRequest:String;
	var relayEcho:String;
	var relayChat:String;
	var lineDownload:String;
	var deleteLine:String;
	var addNewCursor:String;
	var updateCursor:String;
	var addRider:String;
	var removeRider:String;
	var spectateRequest:String;
	var spectateData:String;
}
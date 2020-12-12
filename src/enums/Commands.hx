package enums;

/**
 * @author Kaelan
 */
enum abstract Commands(String) from String
{
	var addCanvasPosition:String;
	
	var drawLine:String;
	
	var gridSizeDec:String;
	var gridSizeInc:String;
	
	var pauseTrack:String;
	var playTrack:String;
	
	var setTool:String;
	var stopTrack:String;
	
	var zoomIn:String;
	var zoomOut:String;
}
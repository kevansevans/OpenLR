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
	
	var setGridSize:String;
	var setLineColor:String;
	var setPosition:String;
	var setScale:String;
	var setTool:String;
	var showGrid:String;
	var stopTrack:String;
	
	var version:String;
	
	var zoomIn:String;
	var zoomOut:String;
}
package enums;

/**
 * @author Kaelan
 */
enum abstract Commands(String) from String
{
	var addCanvasPosition:String;
	var addNewRider:String;
	
	var drawLine:String;
	
	var gridSizeDec:String;
	var gridSizeInc:String;
	
	var listRiderInfo:String;
	
	var pauseTrack:String;
	var playTrack:String;
	
	var recordFlagPoint:String;
	var recordSimState:String;
	var rewindSimulation:String;
	
	var setCanvasPosition:String;
	var setGridSize:String;
	var setLineColor:String;
	var setRiderStart:String;
	var setScale:String;
	var setTool:String;
	var showGrid:String;
	var stepSimForward:String;
	var stepSimBackward:String;
	var stopTrack:String;
	
	var trackInfo:String;
	
	var version:String;
	
	var zoomIn:String;
	var zoomOut:String;
}
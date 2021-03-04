package enums;

/**
 * @author Kaelan
 */
enum abstract Commands(String) from String
{
	//commands in brackets [] are optional with default value if there is one. IE [x, 0.0] means the x argument is optional and has a default value of 0.0
	
	var addCanvasPosition:String; //x, y, adds to the current existing canvas position
	var addNewRider:String; //name, [x, 0.0], [y, 0.0], [enable frame], [disableFrame] creates a new rider with specified name, and sets it's start point to given x y values
	
	var disconnect:String; //Leave current server;
	var drawLine:String; //[type, current active color], [x1, mouse x], [y1, mouse y], [x2, x1 + 10], [y2, same as y1], [shifted, false], [limmode], creates a new line
	
	var enableCamera:String; //toggle camera
	
	var github:String; //Print github page
	var gridSizeDec:String; //Change the ruler dimensions by -1
	var gridSizeInc:String; //Change the ruler dimensions by +1
	
	var importSave:String;
	var importJSONSave:String;
	var importTRKSave:String;
	
	var listRiderInfo:String; //Show all riders and their names
	var listSavedTracks:String; //Show all saved tracks
	var loadAudio:String;
	var loadTrack:String; //name, Load track with given name
	
	var newTrack:String; //Reset to blank canvas. THIS WILL NOT PROMPT YOU IF YOU WANT TO SAVE.
	
	var pauseTrack:String; //Pause track
	var playTrack:String; //Play track
	
	var recordFlagPoint:String; //Set flag at frame
	var recordSimState:String; //Record state
	var removeLine:String; //Remove a line
	var removeRider:String; //name, deletes specified rider
	var renameRider:String; //name, new name, rename rider
	var rewindSimulation:String; //true/false, toggle rewinding
	
	var saveTrack:String; //[name, will default to current track name] Save track. If track name is not provided and track name is unset, it will not save.
	var say:String; //Relay a chat message to console
	var setAudioOffset:String; //seconds, set the starting offset of the audio when playing
	var setAuthorName:String = "name"; //name, sets author name for track info
	var setCanvasPosition:String; //x, y, Sets exact position of canvas
	var setGridSize:String; //value, Sets exact ruler width and height
	var setLineColor:String; //type, sets color type. Many values are supported.
	var setRiderStart:String; //name, [x, 0.0], [y, 0.0], change the start position of specified rider.
	var setRiderEnable:String; //name, [frame, current frame]. Changes the frame at which the specified rider starts riding. If no argument is provided, this is changed to the current frame position. -1 will disable (Start at frame 0)
	var setRiderDisable:String; //name, [frame, current frame]. Changes the frame at which the specified rider Stops riding. If no argument is provided, this is changed to the current frame position. -1 will disable. (Never stop)
	var setScale:String; //value, set track scale
	var setTrackName:String; //name, set track name
	var setTool:String; //type, change tool type
	var showGrid:String; //true/false bool, display grid
	var snapToGrid:String; //[distance, 0.0], enable snapping to grid. Distance determines how close to snap to, 0 disables. 
	var snapToLines:String;
	var spectate:String;
	var stepSimForward:String; //advance the sim forward by 1 frame
	var stepSimBackward:String; //rewind the sim by 1 frame
	var stopTrack:String; //stops playback
	
	var trackInfo:String; //display current track info
	
	var version:String; //display current build info, will specify if debug or release compile, and date build was compiled
	
	var zoomIn:String; //increase zoom by x0.1 (10 percent);
	var zoomOut:String; //decrease zoom by x0.1 (10 percent);
}
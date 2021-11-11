package hxlr.file;

/**
 * @author Kaelan
 * 
 * This struct will try it's best to reflect the .json/.com format of needed track data.
 * Non-standard .json data for other builds must be extrapolated elsewhere in the source.
 * Use Grid.lines[_line.id] to access the LineObject, which will have other data attached to it
 * 
 */
typedef TrackStruct = {
	var label:String;
	var creator:String;
	var duration:Int;
	var version:String;
	var audio:Null<String>;
	var startPosition:StartStruct;
	var riders:Array<RiderStruct>;
	var lines:Array<LineStruct>;
	var layers:Array<LayerStruct>;
}

typedef RiderStruct = {
	var startPosition:StartStruct;
	var startVelocity:StartVelocity;
	var colorList:Array<Int>;
	var remountable:Null<Int>;
}

typedef StartStruct = {
	var x:Float;
	var y:Float;
}

typedef StartVelocity = {
	var x:Float;
	var y:Float;
}

typedef LayerStruct = {
	var id:Int;
	var name:String;
	var visible:Bool;
	var editable:Bool;
}

typedef LineStruct = {
	var id:Int;
	var type:Int;
	var x1:Float;
	var y1:Float;
	var x2:Float;
	var y2:Float;
	var flipped:Null<Bool>;
	var leftExtended:Null<Bool>;
	var rightExtended:Null<Bool>;
	var multiplier:Null<Int>;
	var layer:Null<Int>;
}
package hxlr.file;

/**
 * @author Kaelan
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
	@:optional var layers:Array<LayerStruct>;
}

typedef RiderStruct = {
	var startPosition:StartStruct;
	var startVelocity:StartVelocity;
	var colorA:Null<Int>;
	var colorB:Null<Int>;
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
}
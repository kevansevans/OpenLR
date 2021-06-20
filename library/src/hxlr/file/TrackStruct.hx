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
	var startPosition:StartPosition;
	var riders:Array<RiderInfo>;
	var lines:Array<Line>;
	@:optional var layers:Array<Layer>;
}

typedef RiderInfo = {
	var startPosition:StartPosition;
	var startVelocity:StartVelocity;
	var colorA:Null<Int>;
	var colorB:Null<Int>;
}

typedef StartPosition = {
	var x:Float;
	var y:Float;
}

typedef StartVelocity = {
	var x:Float;
	var y:Float;
}

typedef Layer = {
	var id:Int;
	var name:String;
	var visible:Bool;
}

typedef Line = {
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
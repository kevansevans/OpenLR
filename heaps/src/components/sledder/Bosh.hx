package components.sledder;

import hxlr.Common;
import hxlr.engine.Simulation;
import hxlr.math.geom.Point;
import hxlr.rider.RiderBase;
import hxlr.rider.RiderStruct;

import h3d.Vector;
import h2d.Graphics;
import h2d.HtmlText;
import hxd.res.DefaultFont;

import components.Assets;
import components.sledder.RiderScarf;
import components.sledder.RiderPart;

/**
 * ...
 * @author Kaelan
 */
class Bosh extends RiderBase 
{
	static public var WHITE:Vector = new Vector(1, 1, 1, 1);
	static public var BLACK:Vector = new Vector(0, 0, 0, 1);
	static public var RED:Vector = new Vector(1, 0, 0, 1);
	
	public var colorList:Array<Int> = [];
	public var neckscarf:RiderScarf;
	
	public var nameField:HtmlText;
	
	public var undead:Bool = false;

	public var leftArm:RiderPart;
	public var rightArm:RiderPart;
	public var leftLeg:RiderPart;
	public var rightLeg:RiderPart;
	public var sled:RiderPart;
	public var eye:RiderPart;
	public var body:RiderPart;
	public var eyeball:RiderPart;
	
	public var cameraMode:Int = 0;
	public var cameraFocusPoint:Int = 0;
	public var crashCameraMode:Int = 1;
	public var crashFocusPoint:Int = 0;
	
	public var blinkRate:Float = 0.1;
	var prevFrame:Int = 0;
	
	public function new(_body:RiderStruct, _start:Point) 
	{
		super(Common.defaultRider(), _start);
		
		startPos = _start;
		
		nameField = new HtmlText(Assets.f_verdana_16, Main.riderLayer.sledderLayer);
		
		leftArm = new RiderPart(ARM);
		leftLeg = new RiderPart(LEG);
		sled = new RiderPart(SLED);
		eye = new RiderPart(EYE);
		body = new RiderPart(BODY);
		setRandomScarfColors(2);
		neckscarf = new RiderScarf(colorList);
		
		rightArm = new RiderPart(ARM);
		rightLeg = new RiderPart(LEG);
		
		Main.riderLayer.sledderLayer.addChild(leftArm);
		Main.riderLayer.sledderLayer.addChild(leftLeg);
		Main.riderLayer.sledderLayer.addChild(sled);
		Main.riderLayer.sledderLayer.addChild(body);
		body.addChild(eye);
		body.addChild(neckscarf);
		neckscarf.x = 101;
		neckscarf.y = -53;
		Main.riderLayer.sledderLayer.addChild(rightLeg);
		Main.riderLayer.sledderLayer.addChild(rightArm);
		
	}
	
	public function setRandomScarfColors(_length:Int)
	{
		colorList = new Array();
		
		var length:Int = _length;
		
		for (a in 0...length)
		{
			var r:Int = Std.int(255 * Main.rng.getRandomNormal());
			var g:Int = Std.int(255 * Main.rng.getRandomNormal());
			var b:Int = Std.int(255 * Main.rng.getRandomNormal());
			
			colorList.push((r << 16) | (g << 8) | b);
		}
	}
	
	public function setScarfColors(_list:Array<Int>)
	{
		neckscarf.setColors(_list);
		colorList = _list;
	}
	
	override public function refreshRider():Void 
	{
		super.refreshRider();
		
		nameField.text = name;
	}
	
	override public function delete() {
		
		leftArm.remove();
		rightArm.remove();
		leftLeg.remove();
		rightLeg.remove();
		sled.remove();
		body.remove();
		neckscarf.remove();
		nameField.remove();
		
	}
	
	override public function checkLimits():Void 
	{
		for (def in limits) {
			
			var x_distA = contactPoints[def.point_a].pos.x - contactPoints[def.point_b].pos.x;
			var y_distA = contactPoints[def.point_a].pos.y - contactPoints[def.point_b].pos.y;
			var x_distB = contactPoints[def.point_c].pos.x - contactPoints[def.point_d].pos.x;
			var y_distB = contactPoints[def.point_c].pos.y - contactPoints[def.point_d].pos.y;
			
			switch (def.lessThan) {
				case true :
					if (x_distA * y_distB - y_distA * x_distB < def.threshold) crashed = true;
				case false :
					if (x_distA * y_distB - y_distA * x_distB > def.threshold) crashed = true;
			}
			
		}
	}
	
	override public function constrainScarf() 
	{
		for (edge in scarves) {
			edge.satisfy(crashed);
		}
	}
	
	override public function renderRider():Void 
	{
		updateEyeball(Simulation.frames);
		
		body.x = contactPoints[4].pos.x;
		body.y = contactPoints[4].pos.y;
		
		sled.x = contactPoints[0].pos.x;
		sled.y = contactPoints[0].pos.y;
		
		leftArm.x = rightArm.x = contactPoints[5].pos.x;
		leftArm.y = rightArm.y = contactPoints[5].pos.y;
		
		leftLeg.x = rightLeg.x = contactPoints[4].pos.x;
		leftLeg.y = rightLeg.y = contactPoints[4].pos.y;
		
		body.rotation = Math.atan2(contactPoints[5].pos.y - contactPoints[4].pos.y, contactPoints[5].pos.x - contactPoints[4].pos.x);
		sled.rotation = Math.atan2(contactPoints[3].pos.y - contactPoints[0].pos.y, contactPoints[3].pos.x - contactPoints[0].pos.x);
		leftArm.rotation = Math.atan2(contactPoints[6].pos.y - contactPoints[5].pos.y, contactPoints[6].pos.x - contactPoints[5].pos.x);
		rightArm.rotation = Math.atan2(contactPoints[7].pos.y - contactPoints[5].pos.y, contactPoints[7].pos.x - contactPoints[5].pos.x);
		leftLeg.rotation = Math.atan2(contactPoints[8].pos.y - contactPoints[4].pos.y, contactPoints[8].pos.x - contactPoints[4].pos.x);
		rightLeg.rotation = Math.atan2(contactPoints[9].pos.y - contactPoints[4].pos.y, contactPoints[9].pos.x - contactPoints[4].pos.x);
		
		var gfx = Main.riderLayer.sledderGFX;
		if (!crashed) {
			
			gfx.lineStyle(0.25);
			
			if (constraints[16].enabled) {
				gfx.moveTo(contactPoints[6].pos.x, contactPoints[6].pos.y);
				gfx.lineTo(contactPoints[3].pos.x, contactPoints[3].pos.y);
			}
			
			if (constraints[17].enabled) {
				gfx.moveTo(contactPoints[7].pos.x, contactPoints[7].pos.y);
				gfx.lineTo(contactPoints[3].pos.x, contactPoints[3].pos.y);
			}
			
		}
		
		var scarfIndex:Int = 0;
		gfx.lineStyle(2, colorList[scarfIndex % colorList.length]);
		gfx.moveTo(contactPoints[5].pos.x, contactPoints[5].pos.y);
		
		var prevPoint = contactPoints[5].pos;
		
		for (dot in 0...airPoints.length) {
			gfx.lineStyle(2, colorList[scarfIndex % colorList.length]);
			gfx.moveTo(airPoints[dot].pos.x, airPoints[dot].pos.y);
			gfx.lineTo(prevPoint.x, prevPoint.y);
			prevPoint = airPoints[dot].pos;
			++scarfIndex;
		}
		
		nameField.scaleX = nameField.scaleY = 1 * (1 / Main.riderLayer.scaleX);
		
		nameField.x = contactPoints[1].pos.x;
		nameField.y = contactPoints[1].pos.y;
		nameField.rotation = sled.rotation;
		
		if (crashed) {
			nameField.color = Bosh.RED;
		} else {
			nameField.color = Bosh.WHITE;
		}
	}
	
	public function updateEyeball(_frame:Int):Void 
	{
		if (_frame == prevFrame) return;
		if (crashed || undead) {
			eye.anim.currentFrame = 2;
		} else {
			var rngValue:Float = 0;
			if (_frame > prevFrame) {
				rngValue = Main.rng.getRandomNormal(name);
			} else if (_frame < prevFrame) {
				rngValue = Main.rng.getRandomNormalDecrease(name);
			}
			if (rngValue < blinkRate) {
				eye.anim.currentFrame = 1;
			} else {
				eye.anim.currentFrame = 0;
			}
			prevFrame = _frame;
		}
	}
	
	override public function getCameraPoint():Point 
	{
		var point:Point = new Point();
		
		if (!crashed)
		{
			switch (cameraMode)
			{
				case 0:
					for (dot in contactPoints)
					{
						point.x += dot.pos.x;
						point.y += dot.pos.y;
					}
					point.x /= contactPoints.length;
					point.y /= contactPoints.length;
				case 1:
					for (dot in 4...contactPoints.length)
					{
						point.x += contactPoints[dot].pos.x;
						point.y += contactPoints[dot].pos.y;
					}
					point.x /= 6;
					point.y /= 6;
				case 2:
					for (dot in 0...3)
					{
						point.x += contactPoints[dot].pos.x;
						point.y += contactPoints[dot].pos.y;
					}
					point.x /= 4;
					point.y /= 4;
				case 3:
					point = contactPoints[cameraFocusPoint].pos;
				default :
			}
		}
		else
		{
			switch (crashCameraMode)
			{
				case 0:
					for (dot in contactPoints)
					{
						point.x += dot.pos.x;
						point.y += dot.pos.y;
					}
					point.x /= contactPoints.length;
					point.y /= contactPoints.length;
				case 1:
					for (dot in 4...contactPoints.length)
					{
						point.x += contactPoints[dot].pos.x;
						point.y += contactPoints[dot].pos.y;
					}
					point.x /= 6;
					point.y /= 6;
				case 2:
					for (dot in 0...4)
					{
						point.x += contactPoints[dot].pos.x;
						point.y += contactPoints[dot].pos.y;
					}
					point.x /= 4;
					point.y /= 4;
				case 3:
					point = contactPoints[cameraFocusPoint].pos;
				default :
			}
		}
		
		return point;
	}
	
	override public function reset() {
		
		init(); 
		
	};
	
}

typedef RiderSave = {
	var name:String;
	var startPoint:Point;
	var startFrame:Null<Int>;
	var stopFrame:Null<Int>;
	var colorList:Null<Int>;
}
package components.sledder;

import hxlr.rider.ContactPoint;
import hxlr.rider.AirPoint;
import hxlr.rider.Stick;
import hxlr.math.Point;
import hxlr.rider.RiderBase;
import hxlr.engine.Grid;
import hxlr.engine.Cell;

import h3d.Vector;
import h2d.Graphics;
import h2d.HtmlText;
import hxd.res.DefaultFont;

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
	
	public var colorA(get, null):Int;
	public var colorB(get, null):Int;
	public var neckscarf:RiderScarf;
	
	public var gfx:Graphics;
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
	
	public var blinkRate:Float = 0.1;
	var prevFrame:Int = 0;
	
	public function new(?_x:Float = 0.0, ?_y:Float = 0.0, ?_name:String = "Bosh", ?_enable:Null<Int> = null, ?_disable:Null<Int> = null) 
	{
		super();
		
		startPos = new Point(_x, _y);
		name = _name;
		enabledFrame = _enable;
		disableFrame = _disable;
		
		startVel = new Point(0.4, 0);
		gravity = new Point(0, 0.175);
		
		init();
		
		gfx = new Graphics();
		Main.canvas.sledderLayer.addChild(gfx);
		nameField = new HtmlText(DefaultFont.get());
		Main.canvas.sledderLayer.addChild(nameField);
		
		Main.rng.setKeyOffset(_name, Main.rng.getRandom());
		
		leftArm = new RiderPart(ARM);
		leftLeg = new RiderPart(LEG);
		sled = new RiderPart(SLED);
		eye = new RiderPart(EYE);
		body = new RiderPart(BODY);
		neckscarf = new RiderScarf();
		
		rightArm = new RiderPart(ARM);
		rightLeg = new RiderPart(LEG);
		
		Main.canvas.sledderLayer.addChild(leftArm);
		Main.canvas.sledderLayer.addChild(leftLeg);
		Main.canvas.sledderLayer.addChild(sled);
		Main.canvas.sledderLayer.addChild(body);
		body.addChild(eye);
		body.addChild(neckscarf);
		neckscarf.x = 105;
		neckscarf.y = -59;
		Main.canvas.sledderLayer.addChild(rightArm);
		Main.canvas.sledderLayer.addChild(rightLeg);
	}
	
	override public function delete():Void 
	{
		super.delete();
		
		Main.canvas.sledderLayer.removeChild(leftArm);
		Main.canvas.sledderLayer.removeChild(leftLeg);
		Main.canvas.sledderLayer.removeChild(sled);
		Main.canvas.sledderLayer.removeChild(body);
		Main.canvas.sledderLayer.removeChild(rightArm);
		Main.canvas.sledderLayer.removeChild(rightLeg);
	}
	
	override public function step():Void 
	{
		
		if (enabled) {
			if ((enabledFrame == null || Main.simulation.frames >= enabledFrame) && (disableFrame == null || Main.simulation.frames < disableFrame)) {
				iterate();
				for (iteration in 0...6) {
					constrain();
					collide();
				}
				constrainScarf();
			}
		}
		
		var fakiex = contactPoints[3].pos.x - contactPoints[0].pos.x;
		var fakiey = contactPoints[3].pos.y - contactPoints[0].pos.y;
		if (fakiex * (contactPoints[1].pos.y - contactPoints[0].pos.y) - fakiey * (contactPoints[1].pos.x - contactPoints[0].pos.x) < 0) {
			crashed = true;
		}
	}
	
	override public function iterate() 
	{
		for (point in contactPoints) {
			point.iterate(gravity);
		}
		for (point in airPoints) {
			point.iterate(gravity);
		}
	}
	
	override public function constrain() 
	{
		for (edge in constraints) {
			edge.satisfy(crashed);
		}
	}
	
	var cellList:Array<String>;
	
	override public function collide() 
	{
		for (point in contactPoints) {
			var gridPos = Cell.getInfo(point.pos.x, point.pos.y);
			for (_x in -1...2) for (_y in -1...2) {
				var key:String = 'x${gridPos.x + _x}y${gridPos.y + _y}';
				if (Main.grid.registry[key] == null) continue;
				else {
					var register = Main.grid.registry[key];
					for (line in register.tangible) {
						
						if (line == null) continue;
						
						line.collide(point);
					}
				}
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
		updateEyeball(Main.simulation.frames);
		
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
		
		gfx.clear();
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
		
		gfx.lineStyle(2, neckscarf.colorB);
		gfx.moveTo(contactPoints[5].pos.x, contactPoints[5].pos.y);
		gfx.lineTo(airPoints[0].pos.x, airPoints[0].pos.y);
		gfx.lineStyle(2, neckscarf.colorA);
		gfx.moveTo(airPoints[0].pos.x, airPoints[0].pos.y);
		gfx.lineTo(airPoints[1].pos.x, airPoints[1].pos.y);
		gfx.lineStyle(2, neckscarf.colorB);
		gfx.moveTo(airPoints[1].pos.x, airPoints[1].pos.y);
		gfx.lineTo(airPoints[2].pos.x, airPoints[2].pos.y);
		gfx.lineStyle(2, neckscarf.colorA);
		gfx.moveTo(airPoints[2].pos.x, airPoints[2].pos.y);
		gfx.lineTo(airPoints[3].pos.x, airPoints[3].pos.y);
		gfx.lineStyle(2, neckscarf.colorB);
		gfx.moveTo(airPoints[3].pos.x, airPoints[3].pos.y);
		gfx.lineTo(airPoints[4].pos.x, airPoints[4].pos.y);
		gfx.lineStyle(2, neckscarf.colorA);
		gfx.moveTo(airPoints[4].pos.x, airPoints[4].pos.y);
		gfx.lineTo(airPoints[5].pos.x, airPoints[5].pos.y);
		
		nameField.scaleX = nameField.scaleY = 1 * (1 / Main.canvas.scaleX);
		
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
	
	public function setColor(?_a:Null<Int>, ?_b:Null<Int>) {
		
		neckscarf.setColor(_a, _b);
		
	};
	
	override public function reset() {
		
		init(); 
		
	};
	
	override public function init():Void 
	{
		contactPoints.push(new ContactPoint(0, 0, 0.8));  		//Second Peg	0
		contactPoints.push(new ContactPoint(0, 10));			//Tail			1
		contactPoints.push(new ContactPoint(30, 10));			//Nose			2
		contactPoints.push(new ContactPoint(35, 0));			//String		3
		contactPoints.push(new ContactPoint(10, 0, 0.8));		//Butt			4
		contactPoints.push(new ContactPoint(10, -11, 0.8));		//Shoulder		5
		contactPoints.push(new ContactPoint(23, -10, 0.1));		//Hand			6
		contactPoints.push(new ContactPoint(23, -10, 0.1));		//Hand			7
		contactPoints.push(new ContactPoint(20, 10, 0));		//Foot			8
		contactPoints.push(new ContactPoint(20, 10, 0));		//Foot			9
		
		airPoints.push(new AirPoint(7, -10, 0.9));
		airPoints.push(new AirPoint(3, -10, 0.9));
		airPoints.push(new AirPoint(0, -10, 0.9));
		airPoints.push(new AirPoint(-4, -10, 0.9));
		airPoints.push(new AirPoint(-7, -10, 0.9));
		airPoints.push(new AirPoint(-11, -10, 0.9));
		
		for (point in contactPoints) {
			point.pos.x *= 0.5;
			point.pos.y *= 0.5;
		}
		
		for (point in airPoints) {
			point.pos.x *= 0.5;
			point.pos.y *= 0.5;
		}
		
		for (point in contactPoints) {
			point.pos.x += startPos.x;
			point.pos.y += startPos.y;
			point.vel.x = point.pos.x - startVel.x;
			point.vel.y = point.pos.y;
		}
		
		for (point in airPoints) {
			point.pos.x += startPos.x;
			point.pos.y += startPos.y;
			point.vel.x = point.pos.x - startVel.x;
			point.vel.y = point.pos.y;
		}
		
		constraints.push(new Stick(contactPoints[0], contactPoints[1], STANDARD, this));			//Second to Tail			0
		constraints.push(new Stick(contactPoints[1], contactPoints[2], STANDARD, this));			//Tail to Nose				1
		constraints.push(new Stick(contactPoints[2], contactPoints[3], STANDARD, this));			//Nose to String			2
		constraints.push(new Stick(contactPoints[3], contactPoints[0], STANDARD, this));			//String to Second			3
		constraints.push(new Stick(contactPoints[0], contactPoints[2], STANDARD, this));			//Second to nose			4
		constraints.push(new Stick(contactPoints[3], contactPoints[1], STANDARD, this));			//String to Tail			5
		
		constraints.push(new Stick(contactPoints[0], contactPoints[4], STANDARD, this));			//Second to butt			6
		constraints.push(new Stick(contactPoints[1], contactPoints[4], STANDARD, this));			//Tail to butt				7
		constraints.push(new Stick(contactPoints[2], contactPoints[4], STANDARD, this));			//Nose to butt				8
		
		constraints[6].crashable = constraints[7].crashable = constraints[8].crashable = true;
		
		constraints.push(new Stick(contactPoints[5], contactPoints[4], STANDARD, this));			//Shoulder to butt			9
		constraints.push(new Stick(contactPoints[5], contactPoints[6], STANDARD, this));			//Shoulder to hand			10
		constraints.push(new Stick(contactPoints[5], contactPoints[7], STANDARD, this));			//Shoulder to hand			11
		constraints.push(new Stick(contactPoints[4], contactPoints[8], STANDARD, this));			//Butt to foot				12
		constraints.push(new Stick(contactPoints[4], contactPoints[9], STANDARD, this));			//Butt to foot				13
		constraints.push(new Stick(contactPoints[5], contactPoints[7], STANDARD, this));			//Shoulder to hand, again	14
		
		constraints.push(new Stick(contactPoints[5], contactPoints[0], STANDARD, this));			//Shoulder to second		15
		constraints.push(new Stick(contactPoints[3], contactPoints[6], STANDARD, this));			//String to hand			16
		constraints.push(new Stick(contactPoints[3], contactPoints[7], STANDARD, this));			//String to hand			17
		constraints.push(new Stick(contactPoints[8], contactPoints[2], STANDARD, this));			//Foot to nose				18
		constraints.push(new Stick(contactPoints[9], contactPoints[2], STANDARD, this));			//Foot to nose				19
		
		constraints[15].crashable = constraints[16].crashable = constraints[17].crashable = constraints[18].crashable = constraints[19].crashable = true;
		
		constraints.push(new Stick(contactPoints[5], contactPoints[8], REPELL, this));			//Shoulder to foot			20
		constraints.push(new Stick(contactPoints[5], contactPoints[9], REPELL, this));			//Shoulder to foot			21
		
		scarves.push(new Stick(contactPoints[5], airPoints[0], SCARF, this));
		scarves.push(new Stick(airPoints[0], airPoints[1], SCARF, this));
		scarves.push(new Stick(airPoints[1], airPoints[2], SCARF, this));
		scarves.push(new Stick(airPoints[2], airPoints[3], SCARF, this));
		scarves.push(new Stick(airPoints[3], airPoints[4], SCARF, this));
		scarves.push(new Stick(airPoints[4], airPoints[5], SCARF, this));
		
		crashed = false;
		
		focusPoint = contactPoints[4];
	}
	
	function get_colorA():Int 
	{
		return neckscarf.colorA;
	}
	
	function get_colorB():Int 
	{
		return neckscarf.colorB;
	}
	
}

typedef RiderSave = {
	var name:String;
	var startPoint:Point;
	var startFrame:Null<Int>;
	var stopFrame:Null<Int>;
	var colora:Int;
	var colorb:Int;
}
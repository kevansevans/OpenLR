package components.sledder;

import hxlr.Constants;
import hxlr.math.geom.Point;
import hxlr.rider.RiderBase;

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
		super(Constants.defaultRider(), new Point(_x, _y), _name);
		
		startPos = new Point(_x, _y);
		name = _name;
		enabledFrame = _enable;
		disableFrame = _disable;
		
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
		neckscarf.x = 101;
		neckscarf.y = -53;
		Main.canvas.sledderLayer.addChild(rightArm);
		Main.canvas.sledderLayer.addChild(rightLeg);
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
		
		checkLimits();
		
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
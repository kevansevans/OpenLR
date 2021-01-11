package components.sledder;

import components.physics.RidePoint;
import components.physics.ScarfPoint;
import components.physics.ScarfStick;
import components.physics.Stick;
import components.physics.BindStick;
import components.physics.RepellStick;
import components.sledder.RiderBase;
import components.sledder.RiderBase.RiderPart;
import format.gif.Data.Frame;

/**
 * ...
 * @author Kaelan
 */
class Bosh extends RiderBase 
{

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
		super(_x, _y, _name, _enable, _disable);
		
		init();
		
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
	
	override public function stepRider():Void 
	{
		super.stepRider();
		
		var fakiex = ridePoints[3].pos.x - ridePoints[0].pos.x;
		var fakiey = ridePoints[3].pos.y - ridePoints[0].pos.y;
		if (fakiex * (ridePoints[1].pos.y - ridePoints[0].pos.y) - fakiey * (ridePoints[1].pos.x - ridePoints[0].pos.x) < 0) {
			crashed = true;
		}
	}
	
	override public function renderRider():Void 
	{
		updateEyeball(Main.simulation.frames);
		
		body.x = ridePoints[4].pos.x;
		body.y = ridePoints[4].pos.y;
		
		sled.x = ridePoints[0].pos.x;
		sled.y = ridePoints[0].pos.y;
		
		leftArm.x = rightArm.x = ridePoints[5].pos.x;
		leftArm.y = rightArm.y = ridePoints[5].pos.y;
		
		leftLeg.x = rightLeg.x = ridePoints[4].pos.x;
		leftLeg.y = rightLeg.y = ridePoints[4].pos.y;
		
		body.rotation = Math.atan2(ridePoints[5].pos.y - ridePoints[4].pos.y, ridePoints[5].pos.x - ridePoints[4].pos.x);
		sled.rotation = Math.atan2(ridePoints[3].pos.y - ridePoints[0].pos.y, ridePoints[3].pos.x - ridePoints[0].pos.x);
		leftArm.rotation = Math.atan2(ridePoints[6].pos.y - ridePoints[5].pos.y, ridePoints[6].pos.x - ridePoints[5].pos.x);
		rightArm.rotation = Math.atan2(ridePoints[7].pos.y - ridePoints[5].pos.y, ridePoints[7].pos.x - ridePoints[5].pos.x);
		leftLeg.rotation = Math.atan2(ridePoints[8].pos.y - ridePoints[4].pos.y, ridePoints[8].pos.x - ridePoints[4].pos.x);
		rightLeg.rotation = Math.atan2(ridePoints[9].pos.y - ridePoints[4].pos.y, ridePoints[9].pos.x - ridePoints[4].pos.x);
		
		gfx.clear();
		if (!crashed) {
			gfx.lineStyle(0.25);
			gfx.moveTo(ridePoints[6].pos.x, ridePoints[6].pos.y);
			gfx.lineTo(ridePoints[3].pos.x, ridePoints[3].pos.y);
			gfx.lineTo(ridePoints[7].pos.x, ridePoints[7].pos.y);
		}
		
		gfx.lineStyle(2, neckscarf.colorB);
		gfx.moveTo(ridePoints[5].pos.x, ridePoints[5].pos.y);
		gfx.lineTo(scarfPoints[0].pos.x, scarfPoints[0].pos.y);
		gfx.lineStyle(2, neckscarf.colorA);
		gfx.moveTo(scarfPoints[0].pos.x, scarfPoints[0].pos.y);
		gfx.lineTo(scarfPoints[1].pos.x, scarfPoints[1].pos.y);
		gfx.lineStyle(2, neckscarf.colorB);
		gfx.moveTo(scarfPoints[1].pos.x, scarfPoints[1].pos.y);
		gfx.lineTo(scarfPoints[2].pos.x, scarfPoints[2].pos.y);
		gfx.lineStyle(2, neckscarf.colorA);
		gfx.moveTo(scarfPoints[2].pos.x, scarfPoints[2].pos.y);
		gfx.lineTo(scarfPoints[3].pos.x, scarfPoints[3].pos.y);
		gfx.lineStyle(2, neckscarf.colorB);
		gfx.moveTo(scarfPoints[3].pos.x, scarfPoints[3].pos.y);
		gfx.lineTo(scarfPoints[4].pos.x, scarfPoints[4].pos.y);
		gfx.lineStyle(2, neckscarf.colorA);
		gfx.moveTo(scarfPoints[4].pos.x, scarfPoints[4].pos.y);
		gfx.lineTo(scarfPoints[5].pos.x, scarfPoints[5].pos.y);
		
		nameField.scaleX = nameField.scaleY = 1 * (1 / Main.canvas.scaleX);
		
		nameField.x = ridePoints[1].pos.x;
		nameField.y = ridePoints[1].pos.y;
		nameField.rotation = sled.rotation;
		
		if (crashed) {
			nameField.color = RiderBase.RED;
		} else {
			nameField.color = RiderBase.WHITE;
		}
	}
	
	public function updateEyeball(_frame:Int):Void 
	{
		if (_frame == prevFrame) return;
		if (crashed) {
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
	
	override public function reset() { init(); };
	
	override public function init():Void 
	{
		ridePoints = new Array();
		scarfPoints = new Array();
		bones = new Array();
		scarves = new Array();
		
		ridePoints.push(new RidePoint(0, 0, 0.8));
		ridePoints.push(new RidePoint(0, 10));
		ridePoints.push(new RidePoint(30, 10));
		ridePoints.push(new RidePoint(35, 0));
		ridePoints.push(new RidePoint(10, 0, 0.8));
		ridePoints.push(new RidePoint(10, -11, 0.8));
		ridePoints.push(new RidePoint(23, -10, 0.1));
		ridePoints.push(new RidePoint(23, -10, 0.1));
		ridePoints.push(new RidePoint(23, 10, 0));
		ridePoints.push(new RidePoint(23, 10, 0));
		
		scarfPoints.push(new ScarfPoint(7, -10));
		scarfPoints.push(new ScarfPoint(3, -10));
		scarfPoints.push(new ScarfPoint(0, -10));
		scarfPoints.push(new ScarfPoint(-4, -10));
		scarfPoints.push(new ScarfPoint(-7, -10));
		scarfPoints.push(new ScarfPoint(-11, -10));
		
		for (point in ridePoints) {
			point.pos.x *= 0.5;
			point.pos.y *= 0.5;
			point.pos.x += startPos.x;
			point.pos.y += startPos.y;
			point.vel.x = point.pos.x - 0.8 * 0.5;
			point.vel.y = point.pos.y;
		}
		
		for (point in scarfPoints) {
			point.pos.x *= 0.5;
			point.pos.y *= 0.5;
			point.pos.x += startPos.x;
			point.pos.y += startPos.y;
			point.vel.x = point.pos.x - 0.8 * 0.5;
			point.vel.y = point.pos.y;
		}
		
		bones.push(new Stick(ridePoints[0], ridePoints[1]));
		bones.push(new Stick(ridePoints[1], ridePoints[2]));
		bones.push(new Stick(ridePoints[2], ridePoints[3]));
		bones.push(new Stick(ridePoints[3], ridePoints[0]));
		bones.push(new Stick(ridePoints[0], ridePoints[2]));
		bones.push(new Stick(ridePoints[3], ridePoints[1]));
		bones.push(new BindStick(ridePoints[0], ridePoints[4], ENDURANCE));
		bones.push(new BindStick(ridePoints[1], ridePoints[4], ENDURANCE));
		bones.push(new BindStick(ridePoints[2], ridePoints[4], ENDURANCE));
		bones.push(new Stick(ridePoints[5], ridePoints[4]));
		bones.push(new Stick(ridePoints[5], ridePoints[6]));
		bones.push(new Stick(ridePoints[5], ridePoints[7]));
		bones.push(new Stick(ridePoints[4], ridePoints[8]));
		bones.push(new Stick(ridePoints[4], ridePoints[9]));
		bones.push(new Stick(ridePoints[5], ridePoints[7]));
		bones.push(new BindStick(ridePoints[5], ridePoints[0], ENDURANCE));
		bones.push(new BindStick(ridePoints[3], ridePoints[6], ENDURANCE));
		bones.push(new BindStick(ridePoints[3], ridePoints[7], ENDURANCE));
		bones.push(new BindStick(ridePoints[8], ridePoints[2], ENDURANCE));
		bones.push(new BindStick(ridePoints[9], ridePoints[2], ENDURANCE));
		bones.push(new RepellStick(ridePoints[5], ridePoints[8]));
		bones.push(new RepellStick(ridePoints[5], ridePoints[9]));
		
		scarves.push(new ScarfStick(ridePoints[5], scarfPoints[0]));
		scarves.push(new ScarfStick(scarfPoints[0], scarfPoints[1]));
		scarves.push(new ScarfStick(scarfPoints[1], scarfPoints[2]));
		scarves.push(new ScarfStick(scarfPoints[2], scarfPoints[3]));
		scarves.push(new ScarfStick(scarfPoints[3], scarfPoints[4]));
		scarves.push(new ScarfStick(scarfPoints[4], scarfPoints[5]));
		
		bones[20].restLength = bones[20].restLength * 0.5;
		bones[21].restLength = bones[21].restLength * 0.5;
		
		crashed = false;
	}
	
}
package components.sledder;

import components.physics.RidePoint;
import components.physics.Stick;
import components.physics.BindStick;
import components.physics.RepellStick;
import components.sledder.RiderBase;

/**
 * ...
 * @author Kaelan
 */
class Bosh extends RiderBase 
{

	public function new() 
	{
		super();
		
		init();
		
		
	}
	
	override public function reset() { init(); };
	
	override public function init():Void 
	{
		ridePoints = new Array();
		bones = new Array();
		
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
		
		for (point in ridePoints) {
			point.pos.x *= 0.5;
			point.pos.y *= 0.5;
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
		
		bones[20].restLength *= 0.5;
		bones[21].restLength *= 0.5;
	}
	
}
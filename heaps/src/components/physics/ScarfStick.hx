package components.physics;

import hxlr.components.ContactPoint;

import components.physics.Stick.StickType;
import components.sledder.RiderBase;

/**
 * ...
 * @author Kaelan
 */
class ScarfStick extends Stick 
{

	public function new(_a:ContactPoint, _b:ContactPoint, _rider:RiderBase) 
	{
		super(_a, _b, STANDARD, _rider);
	}
}
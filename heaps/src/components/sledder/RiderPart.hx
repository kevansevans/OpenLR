package components.sledder;

import h2d.Object;
import hxd.Res;
import h2d.Bitmap;
import h2d.Anim;

/**
 * ...
 * @author Kaelan
 */
class RiderPart extends Object {
	
	public var bitmap:Bitmap;
	public var anim:Anim;
	
	public function new (_part:BodyPart) {
		
		super();
		
		switch (_part) {
			case BODY :
				bitmap = new Bitmap(Res.rider.body.toTile(), this);
				bitmap.x = -2;
				bitmap.y = -62;
			case ARM :
				bitmap = new Bitmap(Res.rider.arm.toTile(), this);
				bitmap.x = -15;
				bitmap.y = -25;
			case LEG :
				bitmap = new Bitmap(Res.rider.leg.toTile(), this);
				bitmap.x = -15;
				bitmap.y = -38;
			case SLED :
				bitmap = new Bitmap(Res.rider.sled.toTile(), this);
				bitmap.x = -16;
				bitmap.y = -45.5;
			case EYE :
				anim = new Anim([
					Res.rider.eye0001.toTile(), //Open
					Res.rider.eye0002.toTile(), //Blink
					Res.rider.eye0003.toTile(), //Dead
				], 0, this);
				anim.loop = false;
				anim.x = 165;
				anim.y = 11;
		}
		
		if (_part != EYE) this.scale(0.05);
		
	}
	
}
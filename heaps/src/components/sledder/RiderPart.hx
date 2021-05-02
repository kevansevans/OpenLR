package components.sledder;

import components.Assets;
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
				bitmap = new Bitmap(Assets.b_body, this);
				bitmap.x = -2;
				bitmap.y = -62;
			case ARM :
				bitmap = new Bitmap(Assets.b_arm, this);
				bitmap.x = -15;
				bitmap.y = -25;
			case LEG :
				bitmap = new Bitmap(Assets.b_leg, this);
				bitmap.x = -15;
				bitmap.y = -38;
			case SLED :
				bitmap = new Bitmap(Assets.b_sled, this);
				bitmap.x = -16;
				bitmap.y = -45.5;
			case EYE :
				anim = new Anim([
					Assets.b_eyeOpen,
					Assets.b_eyeClosed,
					Assets.b_eyeDead,
				], 0, this);
				anim.loop = false;
				anim.x = 165;
				anim.y = 11;
		}
		
		if (_part != EYE) this.scale(0.05);
		
	}
	
}
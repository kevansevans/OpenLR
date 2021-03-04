package components.sledder;
import components.physics.Stick.StickType;

/**
 * ...
 * @author Kaelan
 */
class LTAABosh extends Bosh 
{

	public function new(?_x:Float=0.0, ?_y:Float=0.0, ?_name:String="Bosh", ?_enable:Null<Int>=null, ?_disable:Null<Int>=null) 
	{
		super(_x, _y, _name, _enable, _disable);
		
		invincible = true;
	}
	
	override public function init():Void 
	{
		super.init();
		
		updateConditions();
	}
	
	override public function stepRider():Void 
	{
		updateConditions();
		
		super.stepRider();
	}
	
	var phase1:Int = stampToFrame("32:00");
	var phase2:Int = stampToFrame("2:04:20");
	var phase3:Int = stampToFrame("3:02:20");
	var phase4:Int = stampToFrame("4:05:20");
	var phase5:Int = stampToFrame("4:06:20");
	
	function updateConditions():Void 
	{
		invincible = true;
		
		for (bone in bones) {
			bone.enabled = true;
		}
		
		if (Main.simulation == null) return;
		
		if (Main.simulation.frames < phase1) {
			
			undead = false;
			
		} else if (Main.simulation.frames >= phase1 && Main.simulation.frames < phase2) {
			
			undead = true;
			
			bones[6].enabled = false;
			bones[7].enabled = false;
			bones[8].enabled = false;
			bones[15].enabled = false;
			bones[16].enabled = false;
			bones[17].enabled = false;
			bones[18].enabled = false;
			bones[19].enabled = false;
			
		} else if (Main.simulation.frames >= phase2 && Main.simulation.frames < phase3) {
			
			undead = true;
			
			bones[6].enabled = false;
			bones[7].enabled = false;
			bones[8].enabled = false;
			bones[15].enabled = false;
			bones[18].enabled = false;
			bones[19].enabled = false;
			
		} else if (Main.simulation.frames >= phase3 && Main.simulation.frames < phase4) {
			
			undead = false;
			
			bones[16].enabled = false;
			bones[17].enabled = false;
			
		} else if (Main.simulation.frames >= phase4 && Main.simulation.frames < phase5) {
			
			for (bone in bones) {
				bone.enabled = false;
			}
			
		} else {
			
		}
		
	}
	
	inline function stampToFrame(_stamp:String):Int {
		var blocks = _stamp.split(":");
		blocks.reverse();
		
		var total:Int = 0;
		if (blocks[0] != null) total += Std.parseInt(blocks[0]);
		if (blocks[1] != null) total += (Std.parseInt(blocks[1]) * 40);
		if (blocks[2] != null) total += (Std.parseInt(blocks[2]) * 40 * 60);
		return total;
	}
	
}
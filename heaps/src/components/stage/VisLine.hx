package components.stage;

import components.stage.LineShader.CapShader;
import components.stage.LineShader.ColorShader;
import hxlr.enums.LineType;
import h2d.Bitmap;
import h2d.Object;
import h2d.ScaleGrid;
import h2d.Tile;
import hxd.Res;
import hxlr.lines.Accel;
import hxlr.lines.Floor;
import hxlr.lines.LineObject;
import hxlr.math.geom.Line;
import hxlr.math.geom.Point;
import hxsl.Shader;
import hxsl.Types.Vec;

/**
 * ...
 * @author Kaelan
 */
 
class VisLine extends Object
{
	var capShader:CapShader;
	var bitmap:Bitmap;
	
	static var blueShader:ColorShader;
	static var redShader:ColorShader;
	static var greenShader:ColorShader;
	
	static var blue:Vec = new Vec(0, 0.4, 1);
	static var red:Vec = new Vec(0.8, 0, 0);
	static var green:Vec = new Vec(0, 0.8, 0);
	
	public function new(_line:LineObject, ?_parent:Object) 
	{
		super(_parent);
		
		bitmap = new Bitmap(Tile.fromColor(0), this);
		bitmap.height = 2;
		bitmap.width = _line.length > 1 ? _line.length + 2 : 2;
		bitmap.x -= 1;
		bitmap.y -= 1;
		this.x = _line.start.x;
		this.y = _line.start.y;
		this.rotation = _line.angle;
		bitmap.addShader(capShader = new CapShader());
		capShader.lineLength = _line.length + 2;
		capShader.radius = 1;
		
		switch (_line.type) {
			
			case FLOOR :
				
				if (blueShader == null) blueShader = new ColorShader(blue);
				bitmap.addShader(blueShader);
				
			case ACCEL :
				
				if (redShader == null) redShader = new ColorShader(red);
				bitmap.addShader(redShader);
				
			case SCENE :
				
				if (greenShader == null) greenShader = new ColorShader(green, 1);
				bitmap.addShader(greenShader);
				
			default :
		}
	}
	
}
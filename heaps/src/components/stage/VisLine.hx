package components.stage;

import components.stage.LineShader.CapShader;
import components.stage.LineShader.ColorShader;
import components.stage.LineShader.RedFlagShader;
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
	
	static var tile:Tile;
	
	static var blueShader:ColorShader;
	static var blueShaderInv:ColorShader;
	static var redShader:ColorShader;
	static var redShaderInv:ColorShader;
	static var greenShader:ColorShader;
	static var brownShader:ColorShader;
	static var brownShaderInv:ColorShader;
	static var invalidShader:ColorShader;
	
	static var blue:Vec = new Vec(0, 0.4, 1);
	static var red:Vec = new Vec(0.8, 0, 0);
	static var redRED:Vec = new Vec(1, 0, 0);
	static var green:Vec = new Vec(0, 0.8, 0);
	static var brown:Vec = new Vec(0x66 / 255, 0x42 / 255, 0x29 / 255);
	
	public var redFlag:Bitmap;
	
	public function new(_line:LineObject, ?_parent:Object) 
	{
		super(_parent);
		
		if (tile == null) tile = Tile.fromColor(0);
		
		bitmap = new Bitmap(tile, this);
		bitmap.height = 2;
		bitmap.width = _line.length > 1 ? _line.length + 2 : 2;
		bitmap.x -= 1;
		bitmap.y -= 1;
		this.x = _line.start.x;
		this.y = _line.start.y;
		this.rotation = _line.angle;
		bitmap.addShader(capShader = new CapShader());
		capShader.lineLength = _line.length + 2;
		if (_line.type == ACCEL) {
			capShader.dirDependant = 1;
			redFlag = new Bitmap(Tile.fromColor(0xCC0000, 5, 4));
			bitmap.addChildAt(redFlag, 0);
			redFlag.y = 1;
			redFlag.x = bitmap.width - 5;
			redFlag.addShader(new RedFlagShader());
			redFlag.scaleY = _line.shifted ? -1 : 1;
		}
		
		switch (_line.type) {
			
			case FLOOR :
				
				if (_line.shifted) {
					
					if (blueShaderInv == null) {
						blueShaderInv = new ColorShader(blue);
						blueShaderInv.inv = 1;
					}
					bitmap.addShader(blueShaderInv);
					
				} else {
					if (blueShader == null) blueShader = new ColorShader(blue);
					bitmap.addShader(blueShader);
				}
				
			case ACCEL :
				
				if (_line.shifted) {
					
					if (redShaderInv == null) {
						redShaderInv = new ColorShader(red);
						redShaderInv.inv = 1;
					}
					bitmap.addShader(redShaderInv);
					
				} else {
					if (redShader == null) redShader = new ColorShader(red);
					bitmap.addShader(redShader);
				}
				
			case SCENE :
				
				if (greenShader == null) greenShader = new ColorShader(green, 1);
				bitmap.addShader(greenShader);
				
			case SLOW :
				
				if (_line.shifted) {
					
					if (brownShaderInv == null) {
						brownShaderInv = new ColorShader(brown);
						brownShaderInv.inv = 1;
					}
					bitmap.addShader(brownShaderInv);
					
				} else {
					if (brownShader == null) brownShader = new ColorShader(brown);
					bitmap.addShader(brownShader);
				}
				
				
				
			default :
				
				if (invalidShader == null) invalidShader = new ColorShader(redRED, 1);
				bitmap.addShader(invalidShader);
		}
	}
	
}
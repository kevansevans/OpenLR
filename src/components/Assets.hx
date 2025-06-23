package components;

import h2d.Tile;
import hxd.Res;
import h2d.Font;
import hxd.res.FontBuilder;

/**
 * ...
 * @author Kaelan
 */
class Assets 
{
	public static var f_verdana_20:Font;
	public static var f_verdana_16:Font;
	
	public static var b_body:Tile;
	public static var b_arm:Tile;
	public static var b_leg:Tile;
	public static var b_sled:Tile;
	public static var b_eyeOpen:Tile;
	public static var b_eyeClosed:Tile;
	public static var b_eyeDead:Tile;
	
	public function new() 
	{
		f_verdana_20 = Res.fonts.f_verdana_20.toFont();
		f_verdana_16 = Res.fonts.f_verdana_16.toFont();
		
		b_body = Res.rider.body.toTile();
		b_arm = Res.rider.arm.toTile();
		b_leg = Res.rider.leg.toTile();
		b_sled = Res.rider.sled.toTile();
		b_eyeOpen = Res.rider.eye0001.toTile();
		b_eyeClosed = Res.rider.eye0002.toTile();
		b_eyeDead = Res.rider.eye0003.toTile();
	}
	
}
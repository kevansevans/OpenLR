package network;

#if js

#end

/**
 * ...
 * @author Kaelan
 */
class Multiplayer 
{
	#if js
	
	#else
	public function new(_host:Bool) 
	{
		throw "Multiplayer only enabled for Web Browsers";
	}
	#end
	
}
package utils;

import haxe.ds.Map;

/**
 * ...
 * @author Kaelan
 * 
 * Borrowing this from HxDoom
 */
class TableRNG 
{

	public var keys:Map<String, Int>;
	public var values:Array<Int>;
	public var limit:Int;
	
	public function new(_range:Int = 256, _size:Int = 8) 
	{
		values = new Array();
		keys = new Map();
		
		limit = _range - 1;
		
		for (s in 0..._size) for (r in 0..._range) {
			values.push(r);
		}
	}
	
	public function shuffle(?_shuffles:Int = 1) {
		values = riffleShuffle(values, _shuffles);
	}
	
	public function riffleShuffle(_deck:Array<Int>, _shuffles:Int = 1):Array<Int> 
	{
		var midpoint:Int = Std.int(_deck.length / 2);
		
		var new_deck:Array<Int> = new Array();
		var workdeck:Array<Int> = _deck;
		
		for (a in 0..._shuffles) {
			
			var card_count:Int = 0;
			
			var half_a:Array<Int>;
			var half_b:Array<Int>;
			
			//Cut the deck in half. Finds a mid point with a "human like" imprecision.
			var cut:Int = Std.int(_deck.length / 2) - Std.int((_deck.length / 8) * getRandomNormal() * (getRandom() % 2 == 0 ? 1 : -1));
			
			half_a = workdeck.slice(0, cut);
			half_b = workdeck.slice(cut, workdeck.length);
			
			//reassemble the deck
			workdeck = new Array();
			
			for (b in half_b) workdeck.push(b);
			for (b in half_a) workdeck.push(b);
			
			half_a = workdeck.slice(0, midpoint);
			half_b = workdeck.slice(midpoint, _deck.length);
			new_deck = new Array();
			
			//Perform a perfect riffle shuffle.
			while (true) {
				
				if (card_count % 2 == 0) {
					new_deck.push(half_b.shift());
				} else {
					new_deck.push(half_a.shift());
				}
				
				++card_count;
				
				if (new_deck.length == _deck.length) break;
			}
			
			workdeck = new_deck;
		}
		
		return workdeck;
	}
	
	public function getRandom(_key:String = "random"):Int {
		
		if (keys[_key] == null) keys[_key] = -1;
		keys[_key] += 1;
		if (keys[_key] == values.length) keys[_key] = 0;
		return values[keys[_key]];
	}
	
	public function getRandomNormal(_key:String = "random"):Float {
		return getRandom(_key) / limit;
	}
	
	public function clearRandom() {
		for (key in keys.keys()) {
			keys[key] = 0;
		}
	}
	
	public function getRandomDecrease(_key:String = "random"):Int {
		if (keys[_key] == null) keys[_key] = -1;
		keys[_key] -= 1;
		if (keys[_key] <= -1) keys[_key] = values.length -1;
		return values[keys[_key]];
	}
	
	public function getRandomNormalDecrease(_key:String = "random") {
		return getRandomDecrease(_key) / limit;
	}
	
	public function setKeyOffset(_key:String, _value:Int) {
		keys[_key] = _value;
	}
	
	/* For when you need a table of very specific values.
	 * A good example of this need is in Doom's source code: https://github.com/id-Software/DOOM/blob/master/linuxdoom-1.10/m_random.c
	 * It's a table of 256 values, but it does not contain every value between 0 and 255.
	 */
	public static function fromPredeterminedIntArray(_array:Array<Int>):TableRNG
	{
		var rng = new TableRNG();
		rng.values = _array;
		var high:Int = 0;
		for (v in rng.values) {
			if (v >= high) v = high;
		}
		rng.limit = high;
		return rng;
	}
	
}
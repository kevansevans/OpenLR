package network;
import components.lines.LineBase;
import h2d.Console;
import haxe.ds.Map;
import network.PeerCursor;

#if js
import peerjs.DataConnection;
import peerjs.Peer;

/**
 * ...
 * @author Kaelan
 * 
 * https://github.com/juakob/WebRTC-haxe-guide
 */
class WebRTC 
{
	var conn:Dynamic;
	var peer:Peer;
	var option:Dynamic;
	
	var connections:Array<Dynamic>;
	var linked_connections:Map<String, Dynamic>;
	var linkedCursors:Map<String, PeerCursor>;
	
	public var connected:Bool = false;
	
	var initialized:Bool = false;
	var isHost:Bool = false;
	
	public function new(?_name:String) 
	{
		peer = new Peer(_name);
		
		linkedCursors = new Map();
	}
	
	public function create(_name:String) {
		
		isHost = true;
		connections = new Array();
		linked_connections = new Map();
		linkedCursors[Main.authorName] = new PeerCursor(Main.authorName);
		
		peer = new Peer(_name);
		peer.on('open', function(_id:Dynamic) {
			Main.console.log('Your network ID is: ' + _id);
		});
		peer.on('connection', function(_conn) {
			Main.console.log("I've received a connection!");
			connections.push(_conn);
			connected = true;
			attachFunctions(_conn);
		});
		peer.on('data', function(data) {
			//Main.console.log(data);
		});
		peer.on('error', function(err){
			//Main.console.log(err);
		});
	}
	
	public function join(_name) {
		conn = peer.connect(_name);
		conn.on('open', function(data) {
			Main.console.log('Connected to ${_name}');
			attachFunctions(conn);
			connected = true;
			conn.send('console:say ${Main.authorName} has joined the server!');
			conn.send('joinRequest:${Main.authorName}');
		});
		isHost = false;
	}
	
	function attachFunctions(_conn):Void 
	{
		_conn.on('data', function(data) {
			//Main.console.log(data);
			var items = cast(data, String).split(':');
			switch (items[0]) {
				case 'console' :
					Main.console.runCommand(items[1]);
				case 'addCursor' : 
					if (isHost) return;
					if (items[1] == Main.authorName) return;
					linkedCursors[items[1]] = new PeerCursor(items[1]);
					Main.canvas.addChild(linkedCursors[items[1]]);
				case 'updateCursor' :
					linkedCursors[items[1]].update(Std.parseFloat(items[2]), Std.parseFloat(items[3]));
				case 'deleteCursor' :
					
				case 'joinRequest' :
					if (!isHost) return;
					linked_connections[items[1]] = _conn;
					downloadTrack(items[1]);
					linkedCursors[items[1]] = new PeerCursor(items[1]);
					sendData('addCursor:${items[1]}');
					Main.canvas.addChild(linkedCursors[items[1]]);
					downloadCursors(items[1]);
					_conn.name = '${items[1]}';
				case 'chat' :
					Main.console.log('${items[1]}: ${items[2]}');
				default :
					
			}
			switch (items[0]) {
				case 'joinRequest' | 'addCursor' :
					
				default :
					if (isHost && connections.length > 1) {
						sendData(cast(data, String), _conn);
					}
			}
		});
		_conn.on('error', function(err){
			//Main.console.log(err);
		});
		_conn.on('disconnect', function() {
			
		});
	}
	
	function downloadCursors(_name:String):Void 
	{
		for (cursor in linkedCursors) {
			linked_connections[_name].send('addCursor:${cursor.peername}');
		}
	}
	
	function downloadTrack(_name:String):Void 
	{
		var lineCount:Int = 1;
		for (_line in Main.grid.lines) {
			var command:String = 'drawLine ${_line.type} ${_line.start.x} ${_line.start.y} ${_line.end.x} ${_line.end.y} ${_line.shifted} ${_line.limType}';
			linked_connections[_name].send('console:${command}');
			linked_connections[_name].send('console:say ${lineCount} of ${Main.grid.lineCount} downloaded...');
			++lineCount;
		}
	}
	
	public function relayChatMessage(_msg:String) {
		if (conn != null) {
			trace('blep');
			conn.send('console:say ${_msg}');
		}
	}
	
	
	public function sendLine(_line:LineBase) {
		var command:String = 'drawLine ${_line.type} ${_line.start.x} ${_line.start.y} ${_line.end.x} ${_line.end.y} ${_line.shifted} ${_line.limType}';
		sendData('console:${command}');
	}
	
	public function removeLine(_index:Int) {
		var command:String = 'removeLine ${_index}';
		sendData('console:${command}');
	}
	
	public function sendData(_msg:String, ?_sender:Dynamic) {
		if (isHost) {
			for (_conn in connections) {
				if (_sender != null) {
					if (_conn == _sender) continue;
				}
				_conn.send(_msg);
			}
		} else {
			conn.send(_msg);
		}
	}
}

#end
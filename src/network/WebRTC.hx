package network;
import components.lines.LineBase;
import h2d.Console;
import haxe.ds.Map;
import network.NetAction;
import network.PeerCursor;
import haxe.Json;

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
	var namedConnections:Map<String, Dynamic>;
	var namedCursors:Map<String, PeerCursor>;
	
	public var connected:Bool = false;
	
	var needsToDownload:Bool = true;
	
	var initialized:Bool = false;
	public var isHost:Bool = false;
	
	public function new(?_name:String) 
	{
		peer = new Peer(_name);
		
		namedCursors = new Map();
	}
	
	public function create(_name:String) {
		
		isHost = true;
		connections = new Array();
		namedConnections = new Map();
		namedCursors[Main.authorName] = new PeerCursor(Main.authorName);
		
		peer = new Peer(_name);
		peer.on('open', function(_id:Dynamic) {
			Main.console.log('Your network ID is: ' + _id);
		});
		peer.on('connection', function(_conn) {
			
			connections.push(_conn);
			attachFunctions(_conn);
			
			connected = true;
			
		});
		peer.on('data', function(data) {
			
		});
		peer.on('error', function(err){
			
		});
	}
	
	public function join(_name) {
		conn = peer.connect(_name);
		conn.on('open', function(data) {
			
			var packetJoin:OpenLRPacket = {
				action : NetAction.joinRequest,
				peername : '${Main.authorName}',
				data : [],
				globalecho : true,
				localecho : false,
				echoinfo : [
					'${Main.authorName} has joined the server!',
				],
			}
			
			var packetCursor:OpenLRPacket = {
				action : NetAction.addNewCursor,
				peername : '${Main.authorName}',
				data : ['${Main.authorName}',
						Main.canvas.mouseX,
						Main.canvas.mouseY
				],
				globalecho : false,
				localecho : false,
				echoinfo : [],
			}
			
			var dataA = Json.stringify(packetJoin);
			var dataB = Json.stringify(packetCursor);
			
			conn.send(dataA);
			conn.send(dataB);
			
			attachFunctions(conn);
			
			connected = true;
			
		});
		isHost = false;
		needsToDownload = false;
	}
	
	public function disconnect() {
		
	}
	
	function attachFunctions(_conn):Void 
	{
		_conn.on('data', function(data) {
			
			var packet:OpenLRPacket = Json.parse(data);
			
			switch (packet.action) {
				
				case joinRequest :
					
					_conn.name = packet.peername;
					sendTrackData(_conn);
					
				case relayEcho :
					
					for (info in packet.echoinfo) {
						Main.console.log('${info}');
					}
					
				case relayChat :
					
					Main.console.log('${Main.authorName}:${packet.data[0]}', 0xFF);
					
				case lineDownload :
					
					Main.canvas.P2PLineAdd(packet.data[0], packet.data[1], packet.data[2], packet.data[3], packet.data[4], packet.data[5], packet.data[6]);
					
				case deleteLine :
					
					Main.canvas.P2PRemoveLine(packet.data[0]);
					
				case addNewCursor :
					
					namedCursors[packet.data[0]] = new PeerCursor(packet.data[0]);
					namedCursors[packet.data[0]].update(packet.data[1], packet.data[2]);
					Main.canvas.addChild(namedCursors[packet.data[0]]);
					
				case addRider :
					
					Main.riders.P2PAddRider(
						packet.data[0],
						packet.data[1],
						packet.data[2],
						packet.data[3],
						packet.data[4]
					);
					
				case removeRider :
					
					Main.riders.P2PRemoveRider(packet.data[0]);
					
				case updateCursor :
					
					namedCursors[packet.data[0]].update(packet.data[1], packet.data[2]);
					
				default :
					
					Main.console.log('Error! Unhandled packet action: ${packet.action}', 0xFF0000);
					
			}
			
			if (packet.localecho || packet.globalecho) {
				for (info in packet.echoinfo) {
					Main.console.log('${info}');
				}
			}
			
			if (packet.globalecho) {
				if (isHost) {
					var echopacket:OpenLRPacket = {
						action : NetAction.relayEcho,
						peername : packet.peername,
						data : [],
						localecho : true,
						globalecho : false,
						echoinfo : packet.echoinfo,
					}
					sendGeneralPacketInfo(echopacket);
				}
			}
			
			if (isHost && connections.length > 1) {
				switch (packet.action) {
					
					case joinRequest :
					
					default :
						sendGeneralPacketInfo(packet);
				}
				
			}
			
		});
		_conn.on('error', function(err){
			
		});
		_conn.on('disconnected', function(_data) {
			Main.console.log('${_conn.name} left the server');
		});
	}
	
	function sendTrackData(conn:Dynamic):Void 
	{
		if (!isHost) return;
		
		var lineIndex:Int = 0;
		var lineCount:Int = 0;
		while (lineCount < Main.grid.lineCount) {
			
			if (Main.grid.lines[lineIndex] == null) {
				++lineIndex;
				continue;
			}
			
			var packet:OpenLRPacket = {
				action : NetAction.lineDownload,
				peername : Main.authorName,
				data : [
					Main.grid.lines[lineIndex].type,
					Main.grid.lines[lineIndex].start.x,
					Main.grid.lines[lineIndex].start.y,
					Main.grid.lines[lineIndex].end.x,
					Main.grid.lines[lineIndex].end.y,
					Main.grid.lines[lineIndex].shifted,
					Main.grid.lines[lineIndex].limType
				],
				localecho : true,
				globalecho : false,
				echoinfo : [
					'Downloaded line ${lineCount} of ${Main.grid.lineCount} from ${Main.authorName}',
				],
			};
			
			var data = Json.stringify(packet);
			conn.send(data);
			
			++lineCount;
			++lineIndex;
		}
		
		for (cursor in namedCursors) {
			var packet:OpenLRPacket = {
				action : NetAction.addNewCursor,
				peername : Main.authorName,
				data : [
					cursor.peername,
					cursor.x,
					cursor.y
				],
				localecho : false,
				globalecho : false,
				echoinfo : [],
			}
			
			var data = Json.stringify(packet);
			conn.send(data);
		}
		
		for (rider in Main.riders.riders) {
			
			var packet:OpenLRPacket = {
				action : NetAction.addRider,
				peername : Main.authorName,
				data : [
					rider.name,
					rider.startPos.x,
					rider.startPos.y,
					rider.enabledFrame,
					rider.disableFrame
				],
				localecho : false,
				globalecho : false,
				echoinfo : [],
			}
			
			var data = Json.stringify(packet);
			conn.send(data);
		}
		
		needsToDownload = false;
	}
	
	public function updateLineInfo(_action:NetAction, _data:Array<Dynamic>) {
		var packet:OpenLRPacket = {
			action : _action,
			peername : Main.authorName,
			data : _data,
			localecho : false,
			globalecho : false,
			echoinfo : [],
		}
			
		sendGeneralPacketInfo(packet);
	}
	
	public function updateCursor() {
		var packet:OpenLRPacket = {
			action : NetAction.updateCursor,
			peername : Main.authorName,
			data : [
				'${Main.authorName}',
				Main.canvas.mouseX,
				Main.canvas.mouseY
			],
			localecho : false,
			globalecho : false,
			echoinfo : [],
		}
		
		sendGeneralPacketInfo(packet);
	}
	
	public function updateRiderData(_action:NetAction, _data:Array<Dynamic>) {
		var packet:OpenLRPacket = {
			action : _action,
			peername : Main.authorName,
			data : _data,
			localecho : false,
			globalecho : false,
			echoinfo : [],
		}
		sendGeneralPacketInfo(packet);
	}
	
	public function relayChatMessage(_msg:String) {
		
		var packet:OpenLRPacket = {
			action : NetAction.relayChat,
			peername : Main.authorName,
			data : [_msg],
			localecho : false,
			globalecho : false,
			echoinfo : []
		}
		sendGeneralPacketInfo(packet);
		
	}
	
	function sendGeneralPacketInfo(_packet:OpenLRPacket) {
		
		var data = Json.stringify(_packet);
		if (isHost) {
			for (peer in connections) {
				if (peer.name == _packet.peername) continue;
				peer.send(data);
			}
		} else {
			conn.send(data);
		}
	}
	
}

typedef OpenLRPacket = {
	var action:NetAction;
	var peername:String;
	var data:Array<Dynamic>;
	var localecho:Bool;
	var globalecho:Bool;
	var echoinfo:Array<String>;
}

#end
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
	var namedCursors:Map<String, PeerCursor>;
	
	public var spectating:Bool = false;
	public var spectatee:Null<String>;
	
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
		peer.on('error', errorFunc);
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
			
			connected = true;
			
		});
		
		conn.on('error', errorFunc);
		
		isHost = false;
		needsToDownload = false;
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
					
					Main.grid.P2Punregister(Main.grid.lines[packet.data[0]]);
					
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
		
		//_conn.on('error', errorFunc);
		
		_conn.on('disconnected', function(_data) {
			Main.console.log('${_conn.name} left the server');
		});
	}
	
	public function errorFunc(err:Dynamic) {
		
		var error:Dynamic = err;
		var type:String = cast(error.type, String);
		
		Main.console.log(err);
		Main.console.log(error.type);
			
		switch (type) {
			
			case 'browser-incompatible' :
				
				Main.console.log('Your browser is currently unsupported, cannot use WebRTC.', 0xFF0000);
				
			case 'disconnected' :
				
				Main.console.log('You have lost connection, please recreate the server...', 0xFF0000);
				
			case 'invalid-id' :
				
				Main.console.log('The API key passed into the Peer constructor contains illegal characters or is not in the system (cloud server only).', 0xFF0000);
				
			case 'network' :
				
				Main.console.log('Lost or cannot establish a connection to the signalling server.', 0xFF0000);
				
			case 'peer-unavailable' :
				
				Main.console.log('The peer you\'re trying to connect to does not exist.', 0xFF0000);
				
			case 'ssl-unavailable' :
				
				Main.console.log('PeerJS is being used securely, but the cloud server does not support SSL.', 0xFF0000);
				
			case 'server-error' :
				
				Main.console.log('Unable to reach the server.', 0xFF0000);
				
			case 'socket-error' :
				
				Main.console.log('An error from the underlying socket.', 0xFF0000);
				
			case 'socket-closed' :
				
				Main.console.log('The underlying socket closed unexpectedly.', 0xFF0000);
				
			case 'unavailable-id' :
				
				Main.console.log('TThe ID passed into the Peer constructor is already taken.', 0xFF0000);
				
			case 'webrtc' :
				
				Main.console.log('Native WebRTC errors.', 0xFF0000);
				
			default :
				
				Main.console.log("Unspecified network error!");	
		}
	}
	
	public function disconnect() {}
	
	function sendTrackData(client:Dynamic):Void 
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
			client.send(data);
			
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
			client.send(data);
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
			client.send(data);
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
	
	public function spectateRequest(_name:String) {
		var packet:OpenLRPacket = {
			action : NetAction.spectateRequest,
			peername : Main.authorName,
			data : [_name],
			localecho : false,
			globalecho : false,
			echoinfo : []
		}
		sendGeneralPacketInfo(packet);
	}
	
	function sendGeneralPacketInfo(_packet:OpenLRPacket) {
		
		var data = Json.stringify(_packet);
		
		if (isHost) {
			for (client in connections) {
				
				if (client.name == _packet.peername) {
					continue;
				}
				else {
					client.send(data);
				}
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
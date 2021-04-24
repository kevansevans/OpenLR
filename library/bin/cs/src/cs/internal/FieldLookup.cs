// Generated by Haxe 4.1.5

#pragma warning disable 109, 114, 219, 429, 168, 162
namespace haxe.lang {
	public sealed class FieldHashConflict {
		
		public FieldHashConflict(int hash, string name, object @value, global::haxe.lang.FieldHashConflict next) {
			this.hash = hash;
			this.name = name;
			this.@value = @value;
			this.next = next;
		}
		
		
		public readonly int hash;
		
		public readonly string name;
		
		public object @value;
		
		public global::haxe.lang.FieldHashConflict next;
		
	}
}



#pragma warning disable 109, 114, 219, 429, 168, 162
namespace haxe.lang {
	public sealed class FieldLookup {
		
		#pragma warning disable 628
		static FieldLookup() {
			global::haxe.lang.FieldLookup.length = ( global::haxe.lang.FieldLookup.fieldIds as global::System.Array ).Length;
		}
		
		
		public FieldLookup() {
		}
		
		
		protected static int[] fieldIds = new int[]{67, 97, 98, 105, 109, 120, 121, 22420, 22421, 22860, 23089, 23090, 23515, 24650, 24651, 26809, 26810, 27032, 27033, 4745537, 4846113, 4899635, 4996429, 5047259, 5144726, 5343647, 5393365, 5442204, 5594513, 5594516, 5741474, 5745024, 5890653, 18241066, 35289056, 57476627, 66083509, 67859554, 76061764, 78945784, 87367608, 108830952, 117221091, 142151465, 142301684, 150033752, 157425153, 190509036, 205043939, 221637784, 226931207, 276887687, 288963157, 291391547, 302979532, 312752480, 326828109, 328878574, 334695532, 343868310, 356482751, 359333139, 397693302, 399079674, 404153790, 407283053, 452737314, 475510357, 480756972, 501039929, 519963165, 520590566, 562859421, 572311959, 600857717, 630156697, 638894688, 691375679, 746281503, 784433846, 796121503, 827137974, 834174833, 859666569, 863972113, 868895842, 878103594, 883147691, 890433348, 922179759, 922671056, 925807559, 929491738, 931940005, 946786476, 958884033, 958901218, 995006396, 1001867384, 1010148885, 1040027997, 1067353468, 1080633367, 1080633368, 1103412149, 1113806378, 1113806382, 1117325906, 1117622043, 1154634328, 1158124837, 1169897582, 1169898256, 1170169305, 1177754921, 1181037546, 1183237552, 1204816148, 1214452573, 1224700491, 1224901875, 1225098545, 1228056441, 1247875546, 1257164128, 1257939113, 1273207865, 1280549057, 1280845662, 1281091404, 1282943179, 1285439585, 1292432058, 1295590426, 1309411264, 1313416818, 1323686069, 1335767095, 1336745990, 1338143777, 1348037855, 1352640099, 1352786672, 1358471724, 1361165170, 1361165171, 1361165172, 1361165173, 1395555037, 1398464674, 1431819701, 1436822557, 1449364924, 1460447810, 1463469014, 1487639718, 1491020124, 1493492809, 1517726080, 1532710347, 1537812987, 1538593522, 1547539107, 1576149820, 1611958057, 1620824029, 1621420777, 1623148745, 1639293562, 1648581351, 1657829882, 1677065160, 1705629508, 1724402127, 1762364291, 1768014458, 1768617329, 1786263357, 1788062977, 1788958807, 1809768043, 1811518261, 1811559640, 1825849507, 1830310359, 1835249534, 1843764510, 1869208782, 1910180171, 1915412854, 1916009602, 1917859911, 1932812122, 1937159360, 1937751687, 1943520232, 1962040800, 1963056639, 1981972957, 2013228622, 2022294396, 2025055113, 2026819210, 2026820549, 2048392659, 2054707467, 2065762231, 2082007393, 2082663554, 2083206470, 2097154445, 2113708439, 2117141633, 2117167096, 2123426830, 2127021138, 2139647042, 2144877367};
		
		protected static string[] fields = new string[]{"C", "a", "b", "i", "m", "x", "y", "dx", "dy", "fr", "gx", "gy", "id", "nx", "ny", "x1", "x2", "y1", "y2", "__a", "add", "buf", "dir", "end", "get", "key", "len", "map", "pop", "pos", "set", "sub", "vel", "limType", "leftExtended", "getEnumConstructs", "addLine", "start", "remove", "__previousException", "filter", "repell", "satisfy", "classString", "resize", "focusPoint", "limValue", "enabledFrame", "contactPoints", "__nativeException", "getString", "prevLine", "struct", "lineCount", "methodName", "get_native", "airPoints", "iterator", "indent", "dateUTC", "object", "lastIndexOf", "constraints", "friction", "replacer", "hasNext", "reverse", "broken", "nOccupied", "insert", "velocity", "length", "keyList", "native", "storeLine", "array", "deleteTrack", "deserialize", "contains", "pretty", "invincible", "noConstrain", "value", "trackList", "__nativeStack", "accConst", "fieldsString", "threshold", "renderRider", "bones", "cachedIndex", "endurance", "restLength", "camera", "toString", "attract", "gfxEnd", "hashes", "tangible", "subTypeCount", "intangible", "splice", "accx", "accy", "copy", "data", "date", "startPos", "startVel", "removeLine", "disableFrame", "info", "init", "breakable", "__skipStack", "join", "colors", "concat", "clone", "name", "next", "nind", "enumConstructor", "push", "keyValueIterator", "position", "current", "size", "sort", "step", "quicksort", "loadSOLTrack", "type", "scarfAnchor", "checkLimits", "vals", "rightExtended", "constrain", "crashed", "collidable", "write", "register", "spliceVoid", "zone", "point_a", "point_b", "point_c", "point_d", "cachedKey", "getEnumName", "createEnumIndex", "createEnum", "unregister", "__ownStack", "x_vel", "y_grav", "setRestLength", "calculateConstants", "lineIDCount", "concatNative", "nBuckets", "limStart", "className", "quote", "set_crashed", "__unsafe_get", "__unsafe_set", "indexOf", "lookup", "fileName", "iterate", "scarfPoints", "toDynamic", "reset", "scarves", "rider", "allEnums", "standard", "crashable", "y_vel", "limEnd", "distance", "limits", "unwrap", "customParams", "collide", "allLines", "setLim", "loadedSOL", "__get", "__set", "x_grav", "lessThan", "__hx_deleteField", "nextLine", "recursiveRead", "serialize", "lines", "lineNumber", "gravity", "upperBound", "unshift", "scale", "scarf", "_keys", "enumParameters", "set_type", "shifted", "shift", "invDistance", "header", "addChar", "enabled", "invSqrDistance", "constrainScarf", "slice", "flipped", "toSaveObject"};
		
		protected static int length;
		
		public static void addFields(int[] nids, string[] nfields) {
			unchecked {
				int[] cids = global::haxe.lang.FieldLookup.fieldIds;
				string[] cfields = global::haxe.lang.FieldLookup.fields;
				int nlen = ( nids as global::System.Array ).Length;
				int clen = global::haxe.lang.FieldLookup.length;
				if (( ( nfields as global::System.Array ).Length != nlen )) {
					throw ((global::System.Exception) (global::haxe.Exception.thrown(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat("Different fields length: ", global::haxe.lang.Runtime.toString(nlen)), " and "), global::haxe.lang.Runtime.toString(( nfields as global::System.Array ).Length)))) );
				}
				
				bool needsChange = false;
				{
					int[] _g_arr = nids;
					uint _g_idx = ((uint) (0) );
					while (( _g_idx < ( _g_arr as global::System.Array ).Length )) {
						_g_idx += ((uint) (1) );
						int i = _g_arr[((int) (((uint) (( _g_idx - 1 )) )) )];
						if (( global::haxe.lang.FieldLookup.findHash(i, cids, clen) < 0 )) {
							needsChange = true;
							break;
						}
						
					}
					
				}
				
				if (needsChange) {
					lock(typeof(global::haxe.lang.FieldLookup)){
						int[] ansIds = new int[( clen + nlen )];
						string[] ansFields = new string[( clen + nlen )];
						int ci = 0;
						int ni = 0;
						int ansi = 0;
						while (true) {
							if ( ! ((( (( ci < clen )) ? (( ni < nlen )) : (false) ))) ) {
								break;
							}
							
							if (( cids[ci] < nids[ni] )) {
								ansIds[ansi] = cids[ci];
								ansFields[ansi] = ((string) (cfields[ci]) );
								ci = ( ci + 1 );
							}
							else {
								ansIds[ansi] = nids[ni];
								ansFields[ansi] = ((string) (nfields[ni]) );
								ni = ( ni + 1 );
							}
							
							ansi = ( ansi + 1 );
						}
						
						if (( ci < clen )) {
							global::System.Array.Copy(((global::System.Array) (cids) ), ((int) (ci) ), ((global::System.Array) (ansIds) ), ((int) (ansi) ), ((int) (( clen - ci )) ));
							global::System.Array.Copy(((global::System.Array) (cfields) ), ((int) (ci) ), ((global::System.Array) (ansFields) ), ((int) (ansi) ), ((int) (( clen - ci )) ));
							ansi = ( ansi + (( clen - ci )) );
						}
						
						if (( ni < nlen )) {
							global::System.Array.Copy(((global::System.Array) (nids) ), ((int) (ni) ), ((global::System.Array) (ansIds) ), ((int) (ansi) ), ((int) (( nlen - ni )) ));
							global::System.Array.Copy(((global::System.Array) (nfields) ), ((int) (ni) ), ((global::System.Array) (ansFields) ), ((int) (ansi) ), ((int) (( nlen - ni )) ));
							ansi = ( ansi + (( nlen - ni )) );
						}
						
						global::haxe.lang.FieldLookup.fieldIds = ansIds;
						global::haxe.lang.FieldLookup.fields = ansFields;
						global::haxe.lang.FieldLookup.length = ansi;
					}
					;
				}
				
			}
		}
		
		
		public static int doHash(string s) {
			unchecked {
				int acc = 0;
				{
					int _g = 0;
					int _g1 = s.Length;
					while (( _g < _g1 )) {
						int i = _g++;
						acc = ( ( ( 223 * (( acc >> 1 )) ) + ((int) (s[i]) ) ) << 1 );
					}
					
				}
				
				return ((int) (( ((uint) (acc) ) >> 1 )) );
			}
		}
		
		
		public static string lookupHash(int key) {
			unchecked {
				int[] ids = global::haxe.lang.FieldLookup.fieldIds;
				int min = 0;
				int max = global::haxe.lang.FieldLookup.length;
				while (( min < max )) {
					int mid = ( min + ( (( max - min )) / 2 ) );
					int imid = ids[mid];
					if (( key < imid )) {
						max = mid;
					}
					else if (( key > imid )) {
						min = ( mid + 1 );
					}
					else {
						return ((string) (global::haxe.lang.FieldLookup.fields[mid]) );
					}
					
				}
				
				throw ((global::System.Exception) (global::haxe.Exception.thrown(global::haxe.lang.Runtime.concat("Field not found for hash ", global::haxe.lang.Runtime.toString(key)))) );
			}
		}
		
		
		public static int hash(string s) {
			unchecked {
				if (( s == null )) {
					return 0;
				}
				
				int acc = 0;
				{
					int _g = 0;
					int _g1 = s.Length;
					while (( _g < _g1 )) {
						int i = _g++;
						acc = ( ( ( 223 * (( acc >> 1 )) ) + ((int) (s[i]) ) ) << 1 );
					}
					
				}
				
				int key = ((int) (( ((uint) (acc) ) >> 1 )) );
				int[] ids = global::haxe.lang.FieldLookup.fieldIds;
				string[] fld = global::haxe.lang.FieldLookup.fields;
				int min = 0;
				int max = global::haxe.lang.FieldLookup.length;
				int len = global::haxe.lang.FieldLookup.length;
				while (( min < max )) {
					int mid = ((int) (( min + ( ((double) ((( max - min ))) ) / 2 ) )) );
					int imid = ids[mid];
					if (( key < imid )) {
						max = mid;
					}
					else if (( key > imid )) {
						min = ( mid + 1 );
					}
					else {
						string field = ((string) (fld[mid]) );
						if (( field != s )) {
							return  ~ (key) ;
						}
						
						return key;
					}
					
				}
				
				lock(typeof(global::haxe.lang.FieldLookup)){
					if (( len != global::haxe.lang.FieldLookup.length )) {
						return global::haxe.lang.FieldLookup.hash(s);
					}
					
					global::haxe.lang.FieldLookup.fieldIds = global::haxe.lang.FieldLookup.insertInt(global::haxe.lang.FieldLookup.fieldIds, global::haxe.lang.FieldLookup.length, min, key);
					global::haxe.lang.FieldLookup.fields = global::haxe.lang.FieldLookup.insertString(global::haxe.lang.FieldLookup.fields, global::haxe.lang.FieldLookup.length, min, s);
					 ++ global::haxe.lang.FieldLookup.length;
				}
				;
				return key;
			}
		}
		
		
		public static int findHash(int hash, int[] hashs, int length) {
			unchecked {
				int min = 0;
				int max = length;
				while (( min < max )) {
					int mid = ( (( max + min )) / 2 );
					int imid = hashs[mid];
					if (( hash < imid )) {
						max = mid;
					}
					else if (( hash > imid )) {
						min = ( mid + 1 );
					}
					else {
						return mid;
					}
					
				}
				
				return  ~ (min) ;
			}
		}
		
		
		public static void removeInt(int[] a, int length, int pos) {
			unchecked {
				global::System.Array.Copy(((global::System.Array) (a) ), ((int) (( pos + 1 )) ), ((global::System.Array) (a) ), ((int) (pos) ), ((int) (( ( length - pos ) - 1 )) ));
				a[( length - 1 )] = 0;
			}
		}
		
		
		public static void removeFloat(double[] a, int length, int pos) {
			unchecked {
				global::System.Array.Copy(((global::System.Array) (a) ), ((int) (( pos + 1 )) ), ((global::System.Array) (a) ), ((int) (pos) ), ((int) (( ( length - pos ) - 1 )) ));
				a[( length - 1 )] = ((double) (0) );
			}
		}
		
		
		public static void removeDynamic(object[] a, int length, int pos) {
			unchecked {
				global::System.Array.Copy(((global::System.Array) (a) ), ((int) (( pos + 1 )) ), ((global::System.Array) (a) ), ((int) (pos) ), ((int) (( ( length - pos ) - 1 )) ));
				a[( length - 1 )] = null;
			}
		}
		
		
		public static int[] insertInt(int[] a, int length, int pos, int x) {
			unchecked {
				int[] a1 = a;
				int capacity = ( a1 as global::System.Array ).Length;
				if (( pos == length )) {
					if (( capacity == length )) {
						int[] newarr = new int[( (( length << 1 )) + 1 )];
						( a1 as global::System.Array ).CopyTo(((global::System.Array) (newarr) ), ((int) (0) ));
						a1 = newarr;
					}
					
				}
				else if (( pos == 0 )) {
					if (( capacity == length )) {
						int[] newarr1 = new int[( (( length << 1 )) + 1 )];
						global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (newarr1) ), ((int) (1) ), ((int) (length) ));
						a1 = newarr1;
					}
					else {
						global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (a1) ), ((int) (1) ), ((int) (length) ));
					}
					
				}
				else if (( capacity == length )) {
					int[] newarr2 = new int[( (( length << 1 )) + 1 )];
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (newarr2) ), ((int) (0) ), ((int) (pos) ));
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (pos) ), ((global::System.Array) (newarr2) ), ((int) (( pos + 1 )) ), ((int) (( length - pos )) ));
					a1 = newarr2;
				}
				else {
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (pos) ), ((global::System.Array) (a1) ), ((int) (( pos + 1 )) ), ((int) (( length - pos )) ));
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (a1) ), ((int) (0) ), ((int) (pos) ));
				}
				
				a1[pos] = x;
				return a1;
			}
		}
		
		
		public static double[] insertFloat(double[] a, int length, int pos, double x) {
			unchecked {
				double[] a1 = a;
				int capacity = ( a1 as global::System.Array ).Length;
				if (( pos == length )) {
					if (( capacity == length )) {
						double[] newarr = new double[( (( length << 1 )) + 1 )];
						( a1 as global::System.Array ).CopyTo(((global::System.Array) (newarr) ), ((int) (0) ));
						a1 = newarr;
					}
					
				}
				else if (( pos == 0 )) {
					if (( capacity == length )) {
						double[] newarr1 = new double[( (( length << 1 )) + 1 )];
						global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (newarr1) ), ((int) (1) ), ((int) (length) ));
						a1 = newarr1;
					}
					else {
						global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (a1) ), ((int) (1) ), ((int) (length) ));
					}
					
				}
				else if (( capacity == length )) {
					double[] newarr2 = new double[( (( length << 1 )) + 1 )];
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (newarr2) ), ((int) (0) ), ((int) (pos) ));
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (pos) ), ((global::System.Array) (newarr2) ), ((int) (( pos + 1 )) ), ((int) (( length - pos )) ));
					a1 = newarr2;
				}
				else {
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (pos) ), ((global::System.Array) (a1) ), ((int) (( pos + 1 )) ), ((int) (( length - pos )) ));
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (a1) ), ((int) (0) ), ((int) (pos) ));
				}
				
				a1[pos] = x;
				return a1;
			}
		}
		
		
		public static object[] insertDynamic(object[] a, int length, int pos, object x) {
			unchecked {
				object[] a1 = a;
				int capacity = ( a1 as global::System.Array ).Length;
				if (( pos == length )) {
					if (( capacity == length )) {
						object[] newarr = new object[( (( length << 1 )) + 1 )];
						( a1 as global::System.Array ).CopyTo(((global::System.Array) (newarr) ), ((int) (0) ));
						a1 = newarr;
					}
					
				}
				else if (( pos == 0 )) {
					if (( capacity == length )) {
						object[] newarr1 = new object[( (( length << 1 )) + 1 )];
						global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (newarr1) ), ((int) (1) ), ((int) (length) ));
						a1 = newarr1;
					}
					else {
						global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (a1) ), ((int) (1) ), ((int) (length) ));
					}
					
				}
				else if (( capacity == length )) {
					object[] newarr2 = new object[( (( length << 1 )) + 1 )];
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (newarr2) ), ((int) (0) ), ((int) (pos) ));
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (pos) ), ((global::System.Array) (newarr2) ), ((int) (( pos + 1 )) ), ((int) (( length - pos )) ));
					a1 = newarr2;
				}
				else {
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (pos) ), ((global::System.Array) (a1) ), ((int) (( pos + 1 )) ), ((int) (( length - pos )) ));
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (a1) ), ((int) (0) ), ((int) (pos) ));
				}
				
				a1[pos] = ((object) (x) );
				return a1;
			}
		}
		
		
		public static string[] insertString(string[] a, int length, int pos, string x) {
			unchecked {
				string[] a1 = a;
				int capacity = ( a1 as global::System.Array ).Length;
				if (( pos == length )) {
					if (( capacity == length )) {
						string[] newarr = new string[( (( length << 1 )) + 1 )];
						( a1 as global::System.Array ).CopyTo(((global::System.Array) (newarr) ), ((int) (0) ));
						a1 = newarr;
					}
					
				}
				else if (( pos == 0 )) {
					if (( capacity == length )) {
						string[] newarr1 = new string[( (( length << 1 )) + 1 )];
						global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (newarr1) ), ((int) (1) ), ((int) (length) ));
						a1 = newarr1;
					}
					else {
						global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (a1) ), ((int) (1) ), ((int) (length) ));
					}
					
				}
				else if (( capacity == length )) {
					string[] newarr2 = new string[( (( length << 1 )) + 1 )];
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (newarr2) ), ((int) (0) ), ((int) (pos) ));
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (pos) ), ((global::System.Array) (newarr2) ), ((int) (( pos + 1 )) ), ((int) (( length - pos )) ));
					a1 = newarr2;
				}
				else {
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (pos) ), ((global::System.Array) (a1) ), ((int) (( pos + 1 )) ), ((int) (( length - pos )) ));
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (a1) ), ((int) (0) ), ((int) (pos) ));
				}
				
				a1[pos] = x;
				return a1;
			}
		}
		
		
		public static global::haxe.lang.FieldHashConflict getHashConflict(global::haxe.lang.FieldHashConflict head, int hash, string name) {
			while (( head != null )) {
				if (( ( head.hash == hash ) && ( head.name == name ) )) {
					return head;
				}
				
				head = head.next;
			}
			
			return null;
		}
		
		
		public static void setHashConflict(ref global::haxe.lang.FieldHashConflict head, int hash, string name, object @value) {
			global::haxe.lang.FieldHashConflict node = head;
			while (( node != null )) {
				if (( ( node.hash == hash ) && ( node.name == name ) )) {
					node.@value = @value;
					return;
				}
				
				node = ((global::haxe.lang.FieldHashConflict) (node.next) );
			}
			
			head = ((global::haxe.lang.FieldHashConflict) (new global::haxe.lang.FieldHashConflict(hash, name, @value, ((global::haxe.lang.FieldHashConflict) (head) ))) );
		}
		
		
		public static bool deleteHashConflict(ref global::haxe.lang.FieldHashConflict head, int hash, string name) {
			if (( head == null )) {
				return false;
			}
			
			if (( ( head.hash == hash ) && ( head.name == name ) )) {
				head = ((global::haxe.lang.FieldHashConflict) (head.next) );
				return true;
			}
			
			global::haxe.lang.FieldHashConflict prev = head;
			global::haxe.lang.FieldHashConflict node = head.next;
			while (( node != null )) {
				if (( ( node.hash == hash ) && ( node.name == name ) )) {
					prev.next = node.next;
					return true;
				}
				
				node = node.next;
			}
			
			return false;
		}
		
		
		public static void addHashConflictNames(global::haxe.lang.FieldHashConflict head, global::Array<string> arr) {
			while (( head != null )) {
				arr.push(head.name);
				head = head.next;
			}
			
		}
		
		
	}
}


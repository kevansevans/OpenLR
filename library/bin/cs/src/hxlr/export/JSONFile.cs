// Generated by Haxe 4.1.5

#pragma warning disable 109, 114, 219, 429, 168, 162
namespace hxlr.export {
	public class JSONFile : global::haxe.lang.HxObject {
		
		public JSONFile(global::haxe.lang.EmptyObject empty) {
		}
		
		
		public JSONFile() {
			global::hxlr.export.JSONFile.__hx_ctor_hxlr_export_JSONFile(this);
		}
		
		
		protected static void __hx_ctor_hxlr_export_JSONFile(global::hxlr.export.JSONFile __hx_this) {
		}
		
		
		public static string save() {
			global::Array<object> lines = new global::Array<object>();
			object save = new global::haxe.lang.DynamicObject(new int[]{1963056639}, new object[]{lines}, new int[]{}, new double[]{});
			global::haxe.lang.Function replacer = null;
			string space = null;
			string json = global::haxe.format.JsonPrinter.print(((object) (save) ), replacer, space);
			return json;
		}
		
		
	}
}



 package io;

 #if web
 import js.Browser;
 import js.html.Storage;
 #elseif desktop
 import sys.FileSystem;
 import sys.io.File;
 import sys.io.FileInput;
 import sys.io.FileOutput;
 import haxe.Json;
 #end
 /**
 * This class is made to save game data as a [json] file in desktop targets and Browser DOM Storage for HTML target.
 * Actually I think only a part of this class will stay and each way of saving will be stored in subclasses to avoid cluttering
 * managing the system more correctly by composition.
 * 
 * TODO : Read config.json to fecth the save location.
 * TODO : Non static save locations.
 * TODO : Android (as the rest of the game :-°)
 * TODO~: Compress the saved content with some huffman comrpession as it's in the standard lib.
 * TODO~: The key currently only used on web target could be the file's name in a predefined folder. Or a named save with "[key]_filename"
 */
 class LocalSave {
	 @:isVar static public var instance(get, null): LocalSave;
	 
	 static function get_instance(): LocalSave {
		if( instance == null) {
            instance = new LocalSave();
        }
        return instance;
	 }
	  
 	#if web
 	var _browserStorage:Storage;
 	#else
 	var _ready:Bool;
 	#end
	
 	public function isLocalSaveSupported():Bool {
 		#if web
 		return _browserStorage != null;

 		#else
 		return _ready;
 		#end

 		trace("Local Storage unsupported on this target");
 		return false;
 	}
	
	function _needLocalSave() {
		if( !isLocalSaveSupported()) {
 			throw "Saving not supported on this target";
 		}
	}
	 
	//CHANGED: private to force singleton
 	function new() {
 		#if web
 		_browserStorage = Browser.getLocalStorage();
 		_needLocalSave();

 		#elseif desktop
 		_ready = true;
 		if( !FileSystem.exists(Config.inputConfigFilePath)) {
 			var file = File.write(Config.inputConfigFilePath);
 			file.writeString("{}");
 			file.close();
 		}

 		#end

 	}

 	public function loadData(key:String): Dynamic {
 		_needLocalSave();
		
 		#if web
 		return Json.parse(_browserStorage.getItem(key));

 		#elseif desktop
 		try {
 			return Json.parse(File.getContent(key+".json"));
 		}
 		catch ( e:Dynamic ) {
 			throw "Error While Loading: " + e;
 			trace("Disabling save/load on this instance.");
 			_ready = false;
 			return null;
 		}
 		#end

 	}

 	public function saveData(key:String, data:Dynamic) {
 		_needLocalSave();

 		#if web
		_browserStorage.setItem(key, Json.stringify(data, null, " "));

 		#elseif desktop
 		try{
 			File.saveContent(key+".json", Json.stringify(data)); 			
 		}
 		catch(e:Dynamic) {
 			throw "Error While Saving: " + e;
 			trace("Disabling save/load on this instance.");
 			_ready = false;
 		}
 		#end

 	}
 }
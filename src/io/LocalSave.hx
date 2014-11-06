 package io;

 #if web
 import js.Browser;
 import js.html.Storage;
 #elseif desktop
 import sys.FileSystem;
 import sys.io.File;
 import sys.io.FileInput;
 import sys.io.FileOutput;
 import haxe.Json; // Not being used at this moment.
 #end
 /**
 * This class is made to save game data as a binary file in desktop targets and Browser DOM Storage for HTML target.
 * Actually I think only a part of this class will stay and each way of saving will be stored in subclasses to avoid cluttering
 * managing the system more correclty by composition.
 * 
 * TODO : Read config.json to fecth the save location.
 * TODO : Non static save locations.
 * TODO : Android (as the rest of the game :-°)
 * TODO~: Compress the saved content with some huffman comrpession as it's in the standard lib.
 * TODO~: The key currently only used on web target could be the file's name in a predefined folder.
 * TODO~: Singleton
 */
 class LocalSave {
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

 	public function new() {
 		#if web
 		_browserStorage = Browser.getLocalStorage();
 		if( !isLocalSaveSupported())
 		trace("Local Storage unsupported. Won't be able to save anything.");

 		#elseif desktop
 		_ready = true;
 		if( !FileSystem.exists(Config.inputConfigFilePath)) {
 			var file = File.write(Config.inputConfigFilePath);
 			file.writeString("{}");
 			file.close();
 		}

 		#end

 	}

 	public function loadData(key:String = null): Dynamic {
 		if( !isLocalSaveSupported()) {
 			trace("Loading not supportd on this target");
 			return "Unsupported";
 		}
 		#if web

 		return Json.parse(_browserStorage.getItem(key));

 		#elseif desktop
 		try {

 			return Json.parse(File.getContent(Config.inputConfigFilePath));
 		}
 		catch ( e:Dynamic ) {
 			trace("Loading Error : " + e);
 			trace("Disabling save/load on this instance.");
 			_ready = false;
 			return "Error.";
 		}
 		#end

 	}

 	public function saveData(key:String = null, data:Dynamic) {
 		if( !isLocalSaveSupported()) {
 			trace("Saving not supportd on this target");
 			return;
 		}

 		#if web
 		if( isLocalSaveSupported())
 		_browserStorage.setItem(key, Json.stringify(data, null, " "));

 		#elseif desktop
 		try{
 			File.saveContent(Config.inputConfigFilePath, Json.stringify(data, null, " ")); 			
 		}
 		catch(e:Dynamic) {
 			trace("Saving Error: " + e);
 			trace("Disabling save/load on this instance.");
 			_ready = false;
 		}
 		#end

 	}
 }
package io;

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.Json;
import sys.io.File;

class InputMacro {

	/**
	 * Builds input testing functions based on input.json file
	 * TODO!: safety checks
	 * TODO~: key-remapping after build (not handled in macro, just commenting here)
	 */
	macro static public function buildInput(): Array<Field> {
		var fields = Context.getBuildFields();
		
		var type = TPath({
			pack: ["io"],
			params: null,
			name: "InputAction",
		});
		
		var input: Array<Dynamic> = cast Json.parse(File.getContent("assets/input.json")).actions;
		
		for (i in input) {
			var name = i.name;
			var codes: Array<String> = cast i.codes;
			var newField = {
				name: name,
				pos: Context.currentPos(),
				access: [APublic, AStatic],
				kind: FVar(type, macro new InputAction($v{codes}))
			};
			fields.push(newField);
		}
		
		return fields;
	}
}

/*
typedef Field = {
	var name : String;
	@:optional var doc : Null<String>;
	@:optional var access : Array<Access>;
	var kind : FieldType;
	var pos : Position;
	@:optional var meta : Metadata;
}

typedef TypePath = {
	var pack : Array<String>;
	var name : String;
	@:optional var params : Array<TypeParam>;
	@:optional var sub : Null<String>;
}
*/
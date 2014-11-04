package;

typedef TypedefConvention = {
	> ExtendingType, //Lets us allow normal sprite options as well `> SpriteOptions`
	variable: Type,
	?optionalVar: Type,
	endingVar: Type //No Comma
}

class CodeConvention {
	
	public var publicVar: Type; //space only after colon
	public var otherSimilarVar: Type;
	
	var _privateVar: Type;
	
	public function new(argument_: Type) { //trailing underscore ensures no use of This.var = var
		
		if (true) {
			
		}
	}
	
	function publicFunction(): Type {
		
	}
	
	function _privateFunction(): Type {
		
	}
}
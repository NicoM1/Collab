package;

typedef TypedefConvention = {
	variable: Type,
	?optionalVar: Type,
	endingVar: Type //No Comma
}

class CodeConvention {
	
	public var publicVar: Type; //space only after colon
	public var otherSimilarVar: Type;
	
	var _privateVar: Type;

//  Eiyeron's suggestion
	public var publicVar       : Type; //space only after colon
	public var otherSimilarVar : Type;
	
	private var _privateVar : Type;	

	
	public function new(_argument_: Type) { //double underscores ensure no use of This.var = var
		
		if (6 % 3 == 0) { //even single statements should have braces (open to debate)
			trace("even");
		}
	}
	
	function publicFunction(): Type {
		
	}
	
	function _privateFunction(): Type {
		
	}
}
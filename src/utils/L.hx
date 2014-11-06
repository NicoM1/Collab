package utils;
import luxe.Color;
import luxe.Text;
import luxe.Vector;

/**
 * ...
 * @author 
 */
class L{
		
	static var _logText: Text;
	
	public function new() {	
		_logText = new Text({
			pos: new Vector(5, 5),
			depth: 3,
			text: '',
			color: new Color(0.5,0.5,0.5)
		});

	}
		
	static public function log(t: Dynamic) {
		_logText.text = Std.string(t);
	}
}
package;

import io.InputManager;
import luxe.Input.Key;

/**
 * NOTE Wait, isnt there the config.json for things like that?
 * @author 
 */

class Config{
	
	public static var scale: Float = 1;
	public static var perspective: Float = 1.75;
	public static var horizon: Float = 0;
	public static var inputConfigFilePath: String = "input.json"; // Yeah, JSON is human-editable.
	public static var defaultKeyConfig: InputKeyList = {
		up: [Key.up, Key.key_w],
		down: [Key.down, Key.key_s],
		left: [Key.left, Key.key_a],
		right: [Key.right, Key.key_d],
		action: [Key.space],
		exit: [Key.escape],
	}
}
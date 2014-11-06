package;

/**
 * NOTE Wait, isnt there the config.json for things like that?
 * @author 
 */

class Config{
	
	public static var scale: Float = 1;
	public static var perspective: Float = 1.75;
	public static var horizon: Float = 0;
	public static var inputConfigFilePath: String = "input.json"; // Yeah, JSON is human-editable.
	public static var defaultKeyConfig: input.InputManager.InputKeyList = {
		up: luxe.Input.Key.up,
		down: luxe.Input.Key.down,
		left: luxe.Input.Key.left,
		right: luxe.Input.Key.right,
		action: luxe.Input.Key.space,
		exit: luxe.Input.Key.escape,
	}
}
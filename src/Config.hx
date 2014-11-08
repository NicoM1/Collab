package;

import io.InputManager;

/**
 * NOTE Wait, isnt there the config.json for things like that?
 * @author 
 */

class Config{
	
	public static var scale: Float = 1;
	public static var perspective: Float = 1.75;
	public static var horizon: Float = 0;
	public static var inputConfigFilePath: String = "input"; // Yeah, JSON is human-editable.
	public static var defaultKeyConfig = {
		//up: [Keys.up, Keys.key_w],
		//down: [Keys.down, Keys.key_s],
		//left: [Keys.left, Keys.key_a],
		//right: [Keys.right, Keys.key_d],
		//action: [Keys.space],
		//exit: [Keys.escape],
		test: [32]
	}
}

class Keys {
	public static var enter : Int                       = 13;
    public static var escape : Int                      = 27;
    public static var backspace : Int                   = 8;
    public static var tab : Int                         = 9;
    public static var space : Int                       = 32;
    public static var exclaim : Int                     = 33;
    public static var quotedbl : Int                    = 34;
    public static var hash : Int                        = 35;
    public static var percent : Int                     = 37;
    public static var dollar : Int                      = 36;
    public static var ampersand : Int                   = 38;
    public static var quote : Int                       = 39;
    public static var leftparen : Int                   = 40;
    public static var rightparen : Int                  = 41;
    public static var asterisk : Int                    = 42;
    public static var plus : Int                        = 43;
    public static var comma : Int                       = 44;
    public static var minus : Int                       = 45;
    public static var period : Int                      = 46;
    public static var slash : Int                       = 47;
    public static var key_0 : Int                       = 48;
    public static var key_1 : Int                       = 49;
    public static var key_2 : Int                       = 50;
    public static var key_3 : Int                       = 51;
    public static var key_4 : Int                       = 52;
    public static var key_5 : Int                       = 53;
    public static var key_6 : Int                       = 54;
    public static var key_7 : Int                       = 55;
    public static var key_8 : Int                       = 56;
    public static var key_9 : Int                       = 57;
    public static var colon : Int                       = 58;
    public static var semicolon : Int                   = 59;
    public static var less : Int                        = 60;
    public static var equals : Int                      = 61;
    public static var greater : Int                     = 62;
    public static var question : Int                    = 63;
    public static var at : Int                          = 64;
}
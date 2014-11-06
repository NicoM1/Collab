package input;

import luxe.Input.Key;


/**
 * This class serves as an input wrapper. It'll use keybindings to avoid stupid
 * things like AZERTY/QWERTY conflict. For the love of God, think about the dudes
 * who have an AZERTY keyboard!

 * TODO : Manage player actions
 * TODO : I/O from/to a config file
 * TODO : Live remapping
 * TODO~: Multiple players
 * TODO~: use get macros or a list based system to avoid too much code.
 */
 class InputManager {
 	static var _instance: InputManager;

 	function new() {
		// I/O file here
	}

	public static function instance(): InputManager {
		if( _instance == null) _instance = new InputManager();
		return _instance;
	} 

	public function playerUp(): Bool {
		return Luxe.input.keydown(Key.key_z) || Luxe.input.keydown(Key.key_w);
	}

	public function playerDown(): Bool {
		return Luxe.input.keydown(Key.key_s);
	}

	public function playerLeft(): Bool {
		return Luxe.input.keydown(Key.key_a) || Luxe.input.keydown(Key.key_q);
	}

	public function playerRight(): Bool {
		return Luxe.input.keydown(Key.key_d);
	}

	public function playerAction(): Bool {
		return Luxe.input.keydown(Key.space);
	}

	public function exit(): Bool {
		return Luxe.input.keydown(Key.escape);	
	}
}
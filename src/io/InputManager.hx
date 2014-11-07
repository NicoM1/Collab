package io;

import luxe.Input.Key;

import io.LocalSave;

typedef InputKeyList = {
    ?up: Array<Int>,
    ?down: Array<Int>,
    ?left: Array<Int>,
    ?right: Array<Int>,
    ?action: Array<Int>,
    ?exit: Array<Int>
};

/**
 * This class serves as an input wrapper. It'll use keybindings to avoid stupid
 * things like AZERTY/QWERTY conflict. For the love of God, think about the dudes
 * who have an AZERTY keyboard!

 * TODO : Manage player actions
 * TODO : Live remapping
 * TODO~: Multiple players
 * TODO~: use get macros or a list based system to avoid too much code.
 *        But I worry about the ugly get_field / set_field names.
 */
 class InputManager {
    static var _instance: InputManager;

    var _input: InputKeyList;
    function new() {
        _input = LocalSave.instance.loadData(Config.inputConfigFilePath);
        var mustSaveConfig: Bool = false;

        // If the file is inexistant, *copy* the fields from the default config.
        if(_input == null) {        
            _input = Reflect.copy(Config.defaultKeyConfig);
            mustSaveConfig = true;
        }
            
        // Keybindings loading.
        // TODO : better way?
        if( _input.up == null       || !Std.is(_input.up, Array))      {mustSaveConfig = true; _input.up       = Config.defaultKeyConfig.up;}
        if( _input.down == null     || !Std.is(_input.down, Array))    {mustSaveConfig = true; _input.down     = Config.defaultKeyConfig.down;}
        if( _input.left == null     || !Std.is(_input.left, Array))    {mustSaveConfig = true; _input.left     = Config.defaultKeyConfig.left;}
        if( _input.right == null    || !Std.is(_input.right, Array))   {mustSaveConfig = true; _input.right    = Config.defaultKeyConfig.right;}
        if( _input.action == null   || !Std.is(_input.action, Array))  {mustSaveConfig = true; _input.action   = Config.defaultKeyConfig.action;}
        if( _input.exit == null     || !Std.is(_input.exit, Array))    {mustSaveConfig = true; _input.exit     = Config.defaultKeyConfig.exit;}

        if( mustSaveConfig) {
           LocalSave.instance.saveData(Config.inputConfigFilePath, _input);
		}
        trace(_input);
    }

    public static function instance(): InputManager {
        if( _instance == null) {
            _instance = new InputManager();
        }
        return _instance;
    } 

    public function playerUp(): Bool {
		for ( i in _input.up) {
			if (Luxe.input.keydown(i)) return true;
		}
		return false;
    }

    public function playerDown(): Bool {
        for ( i in _input.down) {
			if (Luxe.input.keydown(i)) return true;
		}
		return false;
    }

    public function playerLeft(): Bool {
        for ( i in _input.left) {
			if (Luxe.input.keydown(i)) return true;
		}
		return false;
    }

    public function playerRight(): Bool {
        for ( i in _input.right) {
			if (Luxe.input.keydown(i)) return true;
		}
		return false;
    }

    public function playerAction(): Bool {
        for ( i in _input.action) {
			if (Luxe.input.keydown(i)) return true;
		}
		return false;
    }

    public function exit(): Bool {
        for ( i in _input.exit) {
			if (Luxe.input.keydown(i)) return true;
		}
		return false;
    }
}
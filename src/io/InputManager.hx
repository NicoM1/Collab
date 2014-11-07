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
 * TODO : I/O from/to a config file
 * TODO : Live remapping
 * TODO : Allow multiple keycodes for single actions
 * TODO~: Multiple players
 * TODO~: use get macros or a list based system to avoid too much code.
 *        But I worry about the ugly get_field / set_field names.
 */
 class InputManager {
    static var _instance: InputManager;

    var _localSave: LocalSave;
    var _input: InputKeyList;
    function new() {
        _localSave = new LocalSave();
        _input = _localSave.loadData("input");
        
        // Keybindings loading.
        var mustSaveConfig: Bool = false;
        // TODO : better way?
        if( _input.up == null)      {mustSaveConfig = true; _input.up       = Config.defaultKeyConfig.up;}
        if( _input.down == null)    {mustSaveConfig = true; _input.down     = Config.defaultKeyConfig.down;}
        if( _input.left == null)    {mustSaveConfig = true; _input.left     = Config.defaultKeyConfig.left;}
        if( _input.right == null)   {mustSaveConfig = true; _input.right    = Config.defaultKeyConfig.right;}
        if( _input.action == null)  {mustSaveConfig = true; _input.action   = Config.defaultKeyConfig.action;}
        if( _input.exit == null)    {mustSaveConfig = true; _input.exit     = Config.defaultKeyConfig.exit;}

        if( mustSaveConfig) {
           _localSave.saveData(_input);
		}
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
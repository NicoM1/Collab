package io;

import snow.input.Keycodes;

@:build(io.InputMacro.buildInput())
class InputManager {}


//TODO!: safety checks
class InputAction {
	var _keys: Array<Int>;
	
	public function new(keys_: Array<String>) {
		_keys = new Array<Int>();
		for (k in keys_) {
			if (k == null) continue;
			_keys.push(Reflect.field(Keycodes, k));
		}
	}
	
	public function pressed(): Bool {
		for (k in _keys) {
			if (Luxe.input.keypressed(k)) return true;
		}
		return false;
	}
	
	public function released(): Bool {
		for (k in _keys) {
			if (Luxe.input.keyreleased(k)) return true;
		}
		return false;
	}
	
	public function down(): Bool {
		for (k in _keys) {
			if (Luxe.input.keydown(k)) return true;
		}
		return false;
	}
}
package;

import characters.player.Player;
import luxe.Color;
import luxe.Input;
import luxe.options.DrawOptions.DrawCircleOptions;
import luxe.Vector;
import phoenix.Batcher.PrimitiveType;
import phoenix.geometry.CircleGeometry;
import phoenix.geometry.Geometry;
import phoenix.geometry.Vertex;
import weapons.parts.AmmoStorage;
import weapons.parts.Body;
import weapons.parts.Cannon;
import weapons.parts.TechCore;
import weapons.WeaponBase;

class Main extends luxe.Game {	
	
	var _bufferWidth: Int = 0;
	var _bufferHeight: Int = 0;
	
	override function ready() {
		_setUpCamera();
		_testWeapon();
		_testPlayer();
	}
	
	override function onkeyup(e:KeyEvent) {
		if(e.keycode == Key.escape) {
			Luxe.shutdown();
		}
	}

	override function update(dt:Float) {
		
	}
	
	function _setUpCamera() {	
		if (_bufferWidth > 0) {
			Luxe.camera.size.x = _bufferWidth;
		}
		if (_bufferHeight > 0) {
			Luxe.camera.size.y = _bufferHeight;
		}
	}
	
	function _testWeapon() {
		var weapon: WeaponBase = new WeaponBase ({	
			body: new Body({}), 
			cannon: new Cannon({}),
			techCore: new TechCore({}), 
			ammoStorage: new AmmoStorage({})									
		});
	}
	
	function _testPlayer() {
		var player: Player = new Player();
	}

}

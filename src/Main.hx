package;

import characters.player.Player;
import io.InputManager;
import luxe.Camera.SizeMode;
import luxe.Color;
import luxe.Input;
import luxe.Sprite;
import luxe.options.DrawOptions.DrawCircleOptions;
import luxe.Vector;
import phoenix.Batcher.PrimitiveType;
import phoenix.geometry.CircleGeometry;
import phoenix.geometry.Geometry;
import phoenix.geometry.Vertex;
import utils.L;
import utils.RenderMaths;
import weapons.parts.AmmoStorage;
import weapons.parts.Body;
import weapons.parts.Cannon;
import weapons.parts.TechCore;
import weapons.WeaponBase;
import io.InputMacro;

class Main extends luxe.Game {	
	
	var _bufferWidth: Float = 0;
	var _bufferHeight: Float = 0;
	var _player: Player;
	
	var _ground: Sprite;

	override function ready() {
		
		new L();
		
		_bufferWidth = Luxe.screen.w / 2;
		_bufferHeight = Luxe.screen.h / 2;
		
		//_setUpCamera();
		//_testWeapon();
		_testPlayer();
		_testGround();
	}
	
	override function onkeyup(e:KeyEvent) {
		if(e.keycode == Key.escape) {
			Luxe.shutdown();
		}
	}

	override function update(dt:Float) {
	}
	
	function _setUpCamera() {	
		Luxe.camera.size = new Vector();
		if (_bufferWidth > 0) {
			Luxe.camera.size.x = _bufferWidth;
		}
		if (_bufferHeight > 0) {
			Luxe.camera.size.y = _bufferHeight;
		}
		
		Config.scale = Luxe.screen.w / _bufferWidth;
		Luxe.camera.size_mode = SizeMode.contain;
		Luxe.camera.zoom = Config.scale;
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
		_player = new Player();
	}

	function _testGround() {
		_ground = new Sprite({ 
			color: new Color(0.5, 0, 0.3),
			size: new Vector(Luxe.screen.w, Luxe.screen.h / Config.perspective)
		});
		_ground.pos = new Vector(Luxe.screen.mid.x, Luxe.screen.h - _ground.size.y / 2);
		Config.horizon = _ground.pos.y - _ground.size.y / 2;
	}

	public override function onmousemove(event: MouseEvent) {
	}
}

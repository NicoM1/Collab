package;

import characters.player.Player;
import haxe.Json;
import io.InputManager;
import luxe.AppConfig;
import luxe.Camera.SizeMode;
import luxe.Color;
import luxe.Input;
import luxe.Sprite;
import luxe.options.DrawOptions.DrawCircleOptions;
import luxe.Vector;
import phoenix.Batcher;
import phoenix.Batcher.PrimitiveType;
import phoenix.geometry.CircleGeometry;
import phoenix.geometry.Geometry;
import phoenix.geometry.Vertex;
import phoenix.RenderTexture;
import phoenix.Shader;
import sys.io.File;
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
	
	var _finalOutput: RenderTexture;
	var _finalBatch: Batcher;
	var _finalView: Sprite;
	var _finalShader: Shader;
	
	var _player: Player;
	var _ground: Sprite;

	override public function config(config:AppConfig):AppConfig {
		config.window.resizable = false;
		return config;
	}
	
	override function ready() {
		
		new L();
		
		InputRemapper.reMap(cast Json.parse(File.getContent("assets/input.json")).actions);
		
		_finalOutput = new RenderTexture(Luxe.resources, Luxe.screen.size);
		_finalBatch = Luxe.renderer.create_batcher( { no_add: true } );
		
		_finalShader = Luxe.loadShader("assets/shaders/tiltshift.fs");
		
		_finalView = new Sprite({
			centered: false,
			pos: new Vector(0, 0),
			size: Luxe.screen.size,
			texture: _finalOutput,
			shader: _finalShader,
			batcher: _finalBatch
		});
		
		Luxe.renderer.clear_color.rgb(0x121212);
		
		//_bufferWidth = Luxe.screen.w / 2;
		//_bufferHeight = Luxe.screen.h / 2;	
		//_setUpCamera();
		//_testWeapon();
		_testPlayer();
		_testGround();
	}
	
	override public function onprerender() {
		Luxe.renderer.target = _finalOutput;
		Luxe.renderer.clear(new Color(0, 0, 0, 1));
	}
	
	override public function onpostrender() {
		Luxe.renderer.target = null;
		
		Luxe.renderer.clear(new Color(1, 0, 0, 1));
		
		Luxe.renderer.blend_mode(BlendMode.src_alpha, BlendMode.zero);
		
		_finalBatch.draw();
		
		Luxe.renderer.blend_mode();
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

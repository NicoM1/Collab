package characters.player;

import characters.Character.CharacterOptions;
import luxe.Input.Key;
import luxe.options.DrawOptions.DrawCircleOptions;
import luxe.Text;
import phoenix.geometry.CircleGeometry;

import luxe.Color;
import luxe.Entity;
import luxe.options.SpriteOptions;
import luxe.utils.Maths;

import phoenix.Texture;
import phoenix.Vector;

import io.InputManager;

class Player extends Character{
	
	var _speed: Float = 200;
	
	var _shadow: CircleGeometry;

	var _shaderExpansionPercent: Float = 0.02;

	public function new() {
		var options_: CharacterOptions = {
			texture: Luxe.loadTexture("assets/images/Player.png", _onLoad),
			pos: new Vector(0, 0),
			depth: 6
		}; 
		
		super(options_);	
		
		worldPos = new Vector(Luxe.screen.mid.x / Config.scale, Luxe.screen.mid.y / Config.scale);
		
		var r = 13.0;
		_shadow = Luxe.draw.circle({
			color: new Color(0, 0, 0, 0.5),
			rx: r,
			ry: r/Config.perspective,
			x: worldPos.x,
			y: worldPos.y + 10,
			depth: 5
		});
		
		_zAcceleration = -300;

	}
	
	function _onLoad(t: Texture) {
		t.filter = FilterType.nearest;
	}
	
	override public function update(dt: Float) {
		_updateMovement(dt);
		_shadow.transform.pos.x = worldPos.x;
		_shadow.transform.pos.y = worldPos.y + 10;
		_shadow.transform.scale.y = _shadow.transform.scale.x = 1 + _zHeight * _shaderExpansionPercent;

		super.update(dt);
	}
	
	function _updateMovement(dt: Float) {
		if (InputManager.playerleft.down()) {
			worldPos.x -= _speed * dt;
			flipx = true;
		}
		if (InputManager.playerright.down()) {
			worldPos.x += _speed * dt;
			flipx = false;
		}
		if (InputManager.playerup.down()) {
			worldPos.y -= _speed * dt / Config.perspective;
			if (worldPos.y + size.y / 2 < Config.horizon) {
				worldPos.y = Config.horizon - size.y / 2;
			}
		}
		if (InputManager.playerdown.down()) {
			worldPos.y += _speed * dt / Config.perspective;
			if (worldPos.y + size.y / 2 > Luxe.screen.h) {
				worldPos.y = Luxe.screen.h - size.y / 2;
			}
		}
		
		if (_onGround() && InputManager.playerjump.pressed()) {
			_zVelocity = 150;
		}
	}
}

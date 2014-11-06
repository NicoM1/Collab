package characters.player;

import characters.Character.CharacterOptions;
import luxe.Input.Key;
import luxe.options.DrawOptions.DrawCircleOptions;
import luxe.Text;
import phoenix.geometry.CircleGeometry;
import utils.L;

import luxe.Color;
import luxe.options.SpriteOptions;
import luxe.utils.Maths;

import phoenix.Texture;
import phoenix.Vector;


class Player extends Character{
	
	var _speed: Float = 200;
	
	var _shadow: CircleGeometry;

	public function new() {
		var options_: CharacterOptions = {};
		options_.texture = Luxe.loadTexture("assets/images/Player.png", _onLoad);
		options_.pos = new Vector(0, 0);
		options_.depth = 6;
		
		super(options_);	
		
		_worldPos = new Vector(Luxe.screen.mid.x / Config.scale, Luxe.screen.mid.y / Config.scale);
		
		var r = 13.0;
		_shadow = Luxe.draw.circle({
			color: new Color(0, 0, 0, 0.5),
			rx: r,
			ry: r/Config.perspective,
			x: _worldPos.x,
			y: _worldPos.y + 10,
			depth: 5
		});
		
		_zAcceleration = -300;
	}
	
	function _onLoad(t: Texture) {
		t.filter = FilterType.nearest;
	}
	
	override public function update(dt: Float) {
		_updateMovement(dt);

		_shadow.transform.pos.x = _worldPos.x;
		_shadow.transform.pos.y = _worldPos.y + 10;
		_shadow.transform.scale.x = 1 + _zHeight * 0.02;
		_shadow.transform.scale.y = 1 + _zHeight * 0.02;
		
		super.update(dt);
	}
	
	function _updateMovement(dt: Float) {		
		if (Luxe.input.keydown(Key.key_a)) {
			_worldPos.x -= _speed * dt;
			flipx = true;
		}
		if (Luxe.input.keydown(Key.key_d)) {
			_worldPos.x += _speed * dt;
			flipx = false;
		}
		if (Luxe.input.keydown(Key.key_w)) {
			_worldPos.y -= _speed * dt / Config.perspective;
			if (_worldPos.y + size.y / 2 < Config.horizon) {
				_worldPos.y = Config.horizon - size.y / 2;
			}
		}
		if (Luxe.input.keydown(Key.key_s)) {
			_worldPos.y += _speed * dt / Config.perspective;
			if (_worldPos.y + size.y / 2 > Luxe.screen.h) {
				_worldPos.y = Luxe.screen.h - size.y / 2;
			}
		}
		
		if (_onGround() && Luxe.input.keypressed(Key.space)) {
			_zVelocity = 150;
		}
	}
}

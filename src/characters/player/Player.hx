package characters.player;

import characters.Character.CharacterOptions;
import luxe.Input.Key;
import luxe.options.DrawOptions.DrawCircleOptions;
import luxe.Text;
import phoenix.geometry.CircleGeometry;
import phoenix.RenderTexture;
import phoenix.Batcher;
import luxe.Sprite;
import utils.L;

import luxe.Color;
import luxe.options.SpriteOptions;
import luxe.utils.Maths;

import phoenix.Texture;
import phoenix.Vector;

import io.InputManager;

import weapons.WeaponBase;
import weapons.parts.*;

class Player extends Character{
	
	var _speed: Float = 200;

	var _shaderExpansionPercent: Float = 0.02;

	var _shadow: CircleGeometry;

	var _weapon: WeaponBase;

	public function new() {
		var options_: CharacterOptions = {
			texture: Luxe.loadTexture("assets/images/Player.png", _onLoad),
			pos: new Vector(0, 0),
			depth: 6,
		}; 
		
		super(options_);	
		
		_worldPos = new Vector(Luxe.screen.mid.x / Config.scale, Luxe.screen.mid.y / Config.scale);
		
		var r = 13.0;
		_shadow = Luxe.draw.circle({
			color: new Color(0, 0, 0, 0.5),
			rx: r,
			ry: r/Config.perspective,
			x: _worldPos.x,
			y: _worldPos.y + 10,
			depth: 5,
		});

		_weapon = new WeaponBase ({	
			body: new Body({}), 
			cannon: new Cannon({}),
			techCore: new TechCore({}), 
			ammoStorage: new AmmoStorage({}),
			parent: this				
		});
		
		_zAcceleration = -300;
	}
	
	function _onLoad(t: Texture) {
		t.filter = FilterType.nearest;
	}
	
	override public function update(dt: Float) {
		_updateMovement(dt);
		_updateWeapon();

		_shadow.transform.pos.x = _worldPos.x;
		_shadow.transform.pos.y = _worldPos.y + 10;
		_shadow.transform.scale.y = _shadow.transform.scale.x = 1 + _zHeight * _shaderExpansionPercent;

		super.update(dt);
	}
	
	function _updateMovement(dt: Float) {
		if (InputManager.playerleft.down()) {
			_worldPos.x -= _speed * dt;
			flipx = true;
		}
		if (InputManager.playerright.down()) {
			_worldPos.x += _speed * dt;
			flipx = false;
		}
		if (InputManager.playerup.down()) {
			_worldPos.y -= _speed * dt / Config.perspective;
			if (_worldPos.y + size.y / 2 < Config.horizon) {
				_worldPos.y = Config.horizon - size.y / 2;
			}
		}
		if (InputManager.playerdown.down()) {
			_worldPos.y += _speed * dt / Config.perspective;
			if (_worldPos.y + size.y / 2 > Luxe.screen.h) {
				_worldPos.y = Luxe.screen.h - size.y / 2;
			}
		}
		
		if (_onGround() && InputManager.playerjump.pressed()) {
			_zVelocity = 150;
		}
	}

	function _updateWeapon() {
		if(InputManager.fireweapon.pressed()) {
			//TODO: Explain why the hell this works
			var angle: Float = -(Math.atan2(pos.y - Luxe.mouse.y, pos.x - Luxe.mouse.x)+Maths.radians(90));
			trace(angle);

			_weapon.fire(angle);
		}
	}
}

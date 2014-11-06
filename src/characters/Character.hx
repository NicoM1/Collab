package characters;

import luxe.Entity;
import luxe.options.SpriteOptions;
import luxe.Vector;
import luxe.Sprite;
import utils.RenderMaths;

typedef CharacterOptions = {
	> SpriteOptions,
}

class Character extends Sprite {

	/**
	 * This vector stores the actual character position. pos is only used for graphical render.
	**/
	var _worldPos: Vector;
	
	var _acceleration: Vector;
	var _velocity: Vector;
	
	var _zHeight: Float = 0;
	var _zAcceleration: Float;
	var _zVelocity: Float = 0;
	
	public function new(options_: CharacterOptions) {
		_worldPos = new Vector(0, 0);
		_velocity = new Vector(0, 0);
		_acceleration = new Vector(0, 0);
		super(options_);
	}
	
	override public function update(dt:Float) {
		super.update(dt);
		
		_velocity.x += _acceleration.x * dt;
		_velocity.y += _acceleration.y * dt;
		
		_worldPos.x += _velocity.x * dt;
		_worldPos.y += _velocity.y * dt;
		
		_zVelocity += _zAcceleration * dt;
		_zHeight += _zVelocity * dt;
		
		if (_zHeight < 0) {
			_zVelocity = 0;
			_zHeight = 0;
		}
		
		pos.x = _worldPos.x;
		pos.y = _worldPos.y;
		pos.y -= _zHeight;
	}
	
	function _onGround(): Bool {
		return _zHeight == 0;
	}
}

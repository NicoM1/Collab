package weapons.ammo;

import luxe.Sprite;
import phoenix.Vector;

class Bullet extends Sprite{

	var _velocity: Vector;

	static public function make(type: AmmoType): Bullet {
		switch (type) {
			case AmmoType.Basic:
				return new Bullet();
			default:
				return new Bullet();
		}
		return new Bullet();
	}

	function new() {
		super({
			name: 'bullet-'+Config.bulletCount++,
			depth: 10,
			pos: new Vector(100,0)	
		});

		_velocity = new Vector(0,100);
	}

	override function update(dt: Float) {
		pos.x += _velocity.x * dt;
		pos.y += _velocity.y * dt * Config.perspective;
	}
}
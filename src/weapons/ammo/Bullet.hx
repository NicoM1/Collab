package weapons.ammo;

import luxe.Sprite;
import phoenix.Vector;
import phoenix.geometry.CircleGeometry;
import phoenix.Color;

class Bullet extends Sprite{

	public var velocity: Vector;

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
			name: 'bullet',
			name_unique: true,
			depth: 10,
		});

		velocity = new Vector(0,0);
	}

	override function update(dt: Float) {
		pos.x += velocity.x * dt;
		pos.y += velocity.y * dt / Config.perspective;
	}
}
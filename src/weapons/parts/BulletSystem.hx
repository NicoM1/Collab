package weapons.parts; 

import luxe.Component;
import weapons.ammo.*;

import phoenix.Vector;

class BulletSystem extends Component{
	
	var _bullets: Array<Bullet>;


	public function new() {
		super({name: 'bullet-system'});
		_bullets = new Array<Bullet>();
	}

	override function update(dt: Float) {
		for (b in _bullets) {
			b.update(dt);
		}
	}

	public function fireBullet(type: AmmoType, angle: Vector) {
		var bullet:Bullet = Bullet.make(type);
		bullet.pos.x = entity.parent.pos.x;
		bullet.pos.y = entity.parent.pos.y;

		bullet.velocity.x = angle.x;
		bullet.velocity.y = angle.y;
		bullet.velocity.multiplyScalar(100);

		_bullets.push(bullet);
	}
}
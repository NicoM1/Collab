package weapons.parts; 

import luxe.Component;
import weapons.ammo.*;

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

	public function fireBullet(type: AmmoType, angle: Float) {
		var bullet:Bullet = Bullet.make(type);
		bullet.pos.x = entity.parent.pos.x;
		bullet.pos.y = entity.parent.pos.y;

		bullet.velocity.x = Math.sin(angle);
		bullet.velocity.y = Math.cos(angle);
		trace(bullet.velocity);
		bullet.velocity.multiplyScalar(100);
		trace(bullet.velocity);	

		_bullets.push(bullet);
	}
}
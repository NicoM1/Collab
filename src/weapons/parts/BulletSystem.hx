package weapons.parts; 

import luxe.Component;
import weapons.ammo.*;

class BulletSystem extends Component{
	
	var _bullets: Array<Bullet>;


	public function new() {
		super({name: 'bullet-system'});
		_bullets = new Array<Bullet>();

		fireBullet(AmmoType.Basic);
	}

	override function update(dt: Float) {
		for (b in _bullets) {
			b.update(dt);
		}
	}

	public function fireBullet(type: AmmoType) {
		_bullets.push(Bullet.make(type));
	}
}
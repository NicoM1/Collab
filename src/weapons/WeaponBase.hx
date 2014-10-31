package weapons;
import luxe.options.SpriteOptions;
import luxe.Sprite;
import weapons.parts.AmmoStorage;
import weapons.parts.Body;
import weapons.parts.Cannon;
import weapons.parts.TechCore;

class WeaponBase extends Sprite {
	var body: Body;
	var cannon: Cannon;
	var techCore: TechCore;
	var ammoStorage: AmmoStorage;
	
	public function new(_options_: SpriteOptions) {
		super(_options_);
	}
}
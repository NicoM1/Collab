package weapons.parts;

import luxe.Component;
import luxe.options.ComponentOptions;
import weapons.ammo.AmmoType;

class Cannon extends WeaponPart {
	
	public var ammoType: AmmoType;
	///Firing accuracy, lower == better.
	public var precision: Float;
	
	public function new(_options_: WeaponPartOptions) {
		super(_options_);
	}
}
package weapons.parts;

import luxe.Component;
import luxe.options.ComponentOptions;
import weapons.ammo.AmmoType;
import weapons.parts.WeaponPart;

class Cannon extends WeaponPart {
	
	public var ammoType: AmmoType;
	///Firing accuracy, lower == better.
	public var precision: Float;
	
	public function new(options_: WeaponPartOptions) {
		super(options_ == null? {name:"part-cannon"} : options_);
	}
}
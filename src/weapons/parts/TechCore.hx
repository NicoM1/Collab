package weapons.parts;

import luxe.Component;
import luxe.options.ComponentOptions;
import weapons.ammo.AmmoType;
import weapons.parts.WeaponPart;

class TechCore extends WeaponPart {
	
	///Reload speed, lower == better.
	public var reloadSpeed: Float;
	///Adds to body.energyUsage, lower == better.
	public var energyUsage: Float;
	
	public function new(options_: WeaponPartOptions) {
		super(options_ == null? {name:"part-techcore"} : options_);
	}
}
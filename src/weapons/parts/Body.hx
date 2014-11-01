package weapons.parts;

import luxe.Component;
import luxe.options.ComponentOptions;

class Body extends WeaponPart {
	
	///Delay between shots, lower == better.
	public var firingSpeed: Float;
	///Energy depletion per shot, lower == better.
	public var energyUsage: Float;
	
	public function new(options_: WeaponPartOptions) {
		super(options_ == null? {name:"part-body"} : options_);
	}
}
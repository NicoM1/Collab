package weapons.parts;

import luxe.Component;
import luxe.options.ComponentOptions;
import weapons.ammo.AmmoType;
import weapons.parts.WeaponPart;

class AmmoStorage extends Component {
	
	//Adds to body.firingSpeed, lower == better.
	public var firingSpeed: Float;
	///Adds to techcore.firingSpeed, lower == better.
	public var reloadSpeed: Float;
	///Maximum shots before reload, higher == better.
	public var clipSize: Int;
	
	public function new(options_: WeaponPartOptions) {
		super(options_ == null? {name:"part-ammostorage"} : options_);
	}
}
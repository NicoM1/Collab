package weapons.parts;

import luxe.Component;
import luxe.options.ComponentOptions;
import weapons.ammo.AmmoType;

class AmmoStorage extends Component {
	
	//Adds to body.firingSpeed, lower == better.
	public var firingSpeed: Float;
	///Adds to techcore.firingSpeed, lower == better.
	public var reloadSpeed: Float;
	///Maximum shots before reload, higher == better.
	public var clipSize: Int;
	
	public function new(?_options:ComponentOptions) {
		super(_options == null? {name:"part-ammostorage"} : _options);
	}
}
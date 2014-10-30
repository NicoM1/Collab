package weapons.parts;

import luxe.Component;
import luxe.options.ComponentOptions;
import weapons.ammo.AmmoType;

class Cannon extends Component {
	
	public var ammoType: AmmoType;
	///Firing accuracy, lower == better.
	public var precision: Float;
	
	public function new(?_options:ComponentOptions) {
		super(_options == null? {name:"part-cannon"} : _options);
	}
}
package weapons.parts;

import luxe.Component;
import luxe.options.ComponentOptions;
import weapons.ammo.AmmoType;

class TechCore extends Component {
	
	///Reload speed, lower == better.
	public var reloadSpeed: Float;
	///Adds to body.energyUsage, lower == better.
	public var energyUsage: Float;
	
	public function new(?_options:ComponentOptions) {
		super(_options == null? {name:"part-techcore"} : _options);
	}
}
package weapons.parts;

import luxe.Component;
import luxe.options.ComponentOptions;

class Body extends Component {
	
	///Delay between shots, lower == better.
	public var firingSpeed: Float;
	///Energy depletion per shot, lower == better.
	public var energyUsage: Float;
	
	public function new(?_options:ComponentOptions) {
		super(_options == null? "part-body" : _options);
	}
}
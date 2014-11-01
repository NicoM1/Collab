package weapons.parts;

import luxe.Component;
import luxe.Vector;
import luxe.Visual;
import luxe.options.ComponentOptions;

typedef WeaponPartOptions = {
    > ComponentOptions,
	?visual: Visual,
	?hotPoint: Vector
}

class WeaponPart extends Component {
	private var _visual: Visual;
	private var _hotPoint: Vector;

	public function new(options_: WeaponPartOptions) {
		super({name:options_.name});
		_visual = options_.visual;
		_hotPoint = options_.hotPoint;
	}

	// Move the part alongside the containing entity
	// and offsets it with the offset.
	public override function update(dt: Float):Void {
		pos.copy_from(this.entity.pos);
		pos.add(_hotPoint);
	}
}
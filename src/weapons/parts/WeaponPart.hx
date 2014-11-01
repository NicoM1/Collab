package weapons.parts;

import luxe.Component;
import luxe.Vector;
import luxe.Visual;
import luxe.options.ComponentOptions;

typedef WeaponPartOptions = {
    @:optional var name : String;
	var visual          : Visual;
	var hotPoint        : Vector;
}

class WeaponPart extends Component {
	private var _visual   : Visual;
	private var _hotPoint : Vector;

	public function new(_options_: WeaponPartOptions) {
		super({name:_options_.name});
		_visual = _options_.visual;
		_hotPoint = _options_.hotPoint;
	}

	// Move the part alongside the containing entity
	// and offsets it with the offset.
	public override function update(dt: Float):Void {
		super(dt);
		pos.copy_from(this.entity.pos);
		pos.add(_hotPoint);
	}
}
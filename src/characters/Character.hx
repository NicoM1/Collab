package characters;

import luxe.Entity;
import luxe.options.SpriteOptions;
import luxe.Vector;
import luxe.Sprite;
import utils.RenderMaths;

typedef CharacterOptions = {
	> SpriteOptions,
}

/**
 * ...
 * @author 
 */
class Character extends Sprite {

	/**
	 * This vector stores the actual character position. pos is only used for graphical render.
	**/
	private var _worldPos: Vector;
	public function new(options_: CharacterOptions) {
		super(options_);
		_worldPos = new Vector(0,0);
	}
	
	override public function update(dt:Float) {
		super.update(dt);
		pos = RenderMaths.perspectiveProjection(_worldPos);
		// TODO : Perspective projection
	}
}

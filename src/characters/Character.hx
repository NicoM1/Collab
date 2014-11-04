package characters;

import luxe.Entity;
import luxe.options.SpriteOptions;
import luxe.Sprite;

typedef CharacterOptions = {
	> SpriteOptions,
}

/**
 * ...
 * @author 
 */
class Character extends Sprite {

	public function new(options_: CharacterOptions) {
		super(options_);
	}
	
	override public function update(dt:Float) {
		super.update(dt);
	}
}
package characters.player;
import characters.Character.CharacterOptions;
import luxe.options.SpriteOptions;
import phoenix.Texture;
import phoenix.Vector;

/**
 * ...
 * @author 
 */
class Player extends Character{

	public function new() {
		var options_: CharacterOptions = {};
		options_.texture = Luxe.loadTexture("assets/images/Player.png", _onLoad);
		options_.pos = new Vector(0, 0);
		
		super(options_);	
	}
	
	//TODO!: What is going wrong here??
	function _onLoad(t: Texture) {
		t.filter = FilterType.nearest;
		pos.x = Luxe.screen.mid.x;
		pos.y = Luxe.screen.mid.y;
	}
	
	override public function update(dt: Float) {
		super.update(dt);
	}
}
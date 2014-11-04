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

	var _moveTarget: Vector;

	public function new() {
		var options_: CharacterOptions = {};
		options_.texture = Luxe.loadTexture("assets/images/Player.png", _onLoad);
		options_.pos = new Vector(0, 0);
		
		_moveTarget = new Vector(0, 0); 

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
		// TODO~: Use internal variables to avoid variable redeclaration at each update?
		// We need to use benchmarks to see if storing temp variables as class members are faster and less lag-making.*

		// TODO : Set actual distance calculation
		var moveDistance: Float = dt * /*(distance between moveTarget and position > Maximum ? Maximum : moveDistance); */42; 
		// TODO : Set actual angle calculation
		var moveAngle: Float = /* Angle between position and target */ Math.PI;
		var moveDirection: Vector = new Vector(moveDistance * Math.cos(moveAngle), moveDistance * Math.sin(moveAngle));
		pos.add(moveDirection);
	}

	public function setMoveTarget(v: Vector) {
		_moveTarget.copy_from(v);
	}
}
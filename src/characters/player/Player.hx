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
		pos.set_xy(Luxe.screen.mid.x, Luxe.screen.mid.y);
	}
	
	//TODO!: What is going wrong here??
	//Eiyeron : I had the same problem with [SQUARE] : this function is called before new is finished.
	//          But here, I don't find the origin of this problem. So I moved the position declaration.
	function _onLoad(t: Texture) {
		t.filter = FilterType.nearest;
	}
	
	override public function update(dt: Float) {
		super.update(dt);
		trace(pos);
		// TODO~: Use internal variables to avoid variable redeclaration at each update?
		// We need to use benchmarks to see if storing temp variables as class members are faster and less lag-making.*
		var moveDistance: Float = (Math.sqrt( (pos.x - _moveTarget.x) * (pos.x - _moveTarget.x) + (pos.y - _moveTarget.y) * (pos.y - _moveTarget.y) ));
		moveDistance = moveDistance > 600 ? 600 : moveDistance;
		var moveAngle = Vector.RotationTo(pos, _moveTarget);
		var moveDirection: Vector = new Vector(Math.cos(moveAngle), Math.sin(moveAngle));
		moveDirection = moveDirection.multiplyScalar(moveDistance * dt);
		pos.add(moveDirection);
	}

	public function setMoveTarget(v: Vector) {
		_moveTarget = v;
	}
}
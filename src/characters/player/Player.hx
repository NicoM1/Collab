package characters.player;
import characters.Character.CharacterOptions;
import luxe.Color;
import luxe.options.SpriteOptions;
import luxe.utils.Maths;
import phoenix.Texture;
import phoenix.Vector;
/**
 * ...
 * @author 
 */
class Player extends Character{

	var _moveTarget: Vector;
	var _angleTarget: Float = 0;
	var _moveDirection: Vector;
	
	var _speed: Float = 200;
	var _rotateSpeed: Float = 10;

	public function new() {
		var options_: CharacterOptions = {};
		options_.texture = Luxe.loadTexture("assets/images/Player.png", _onLoad);
		options_.pos = new Vector(0, 0);
		
		_moveTarget = new Vector(0, 0); 
		_moveDirection = new Vector(0, 0); 

		super(options_);	
		pos.set_xy(Luxe.screen.mid.x, Luxe.screen.mid.y);
		setMoveTarget(Luxe.mouse);
	}
	
	function _onLoad(t: Texture) {
		t.filter = FilterType.nearest;
	}
	
	override public function update(dt: Float) {
		super.update(dt);
		
		_updateMovement(dt);
		if(_moveDirection.length > 0) {
			_updateAngle(dt);
		}
	}
	
	function _updateMovement(dt: Float) {		
		_moveDirection.x = _moveTarget.x - pos.x;
		_moveDirection.y = _moveTarget.y - pos.y;
		
		_moveDirection.normalize();
		_moveDirection.multiplyScalar(dt * _speed);
		
		var d = _getDist(pos, _moveTarget) ;
		_moveDirection.x = (d > _moveDirection.length)? _moveDirection.x : _moveTarget.x - pos.x;
		_moveDirection.y = (d > _moveDirection.length)? _moveDirection.y : _moveTarget.y - pos.y;
		
		pos.add(_moveDirection);
	}
	
	//TODO!: currently very strange to prevent doing a full spin around when crossing zero, must be an easier way
	function _updateAngle(dt: Float) {
		_angleTarget = -Math.atan2(_moveTarget.x - pos.x, _moveTarget.y - pos.y);
		var target = Maths.degrees(_angleTarget) - 180;
		target = _clampAngle(target);
		
		var r = (target - _clampAngle(rotation_z));
		
		if (r > 180) {
			r = (target - _clampAngle(rotation_z) - 360);
		}
		else if (r < -180) {
			r = (target - _clampAngle(rotation_z) + 360);
		}
		
		rotation_z += r * dt * _rotateSpeed;
		
		rotation_z = _clampAngle(rotation_z);
		
		_log(Std.int(rotation_z));
	}
	
	//TODO: this is gross, but it works, make it not gross
	function _clampAngle(a: Float): Float {
		while (a > 360) {
			 a -= 360; 
		}
		while (a < 0) {
			a += 360;
		}
		return a;
	}
	
	function _getDist(a: Vector, b: Vector) {
		var xd = (b.x - a.x);
		xd *= xd;
		
		var yd = (b.y - a.y);
		yd *= yd;
		
		return Math.sqrt(xd + yd);
	}
	
	function _log(t: Dynamic) {
		Luxe.draw.text({
            immediate:true,
            color : new Color(),
            pos : new Vector(Luxe.screen.w - 120, Luxe.screen.y - 5),
            text : Std.string(t)
        });
	}

	public function setMoveTarget(v: Vector) {
		_moveTarget.copy_from(v);
	}
}
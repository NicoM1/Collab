package characters.player;

import characters.Character.CharacterOptions;
import luxe.Text;

import luxe.Color;
import luxe.options.SpriteOptions;
import luxe.utils.Maths;

import phoenix.Texture;
import phoenix.Vector;


class Player extends Character{

	var _moveTarget: Vector;
	var _angleTarget: Float = 0;
	var _moveDirection: Vector;
	
	var _speed: Float = 200;
	var _rotateSpeed: Float = 10;
	
	var _logText: Text;

	public function new() {
		var options_: CharacterOptions = {};
		options_.texture = Luxe.loadTexture("assets/images/Player.png", _onLoad);
		options_.pos = new Vector(0, 0);
		
		_moveTarget = new Vector(0, 0); 
		_moveDirection = new Vector(0, 0); 
		
		_logText = new Text({
			pos: new Vector(5, 5),
			depth: 3,
			text: '',
			color: new Color(0.5,0.5,0.5)
		});

		super(options_);	
		_worldPos.set_xy(Luxe.screen.mid.x, Luxe.screen.mid.y);
		setMoveTarget(Luxe.mouse);
	}
	
	function _onLoad(t: Texture) {
		t.filter = FilterType.nearest;
	}
	
	override public function update(dt: Float) {
		
		_updateMovement(dt);
		if(_moveDirection.length > 0) {
			_updateAngle(dt);
		}
		super.update(dt);
	}
	
	function _updateMovement(dt: Float) {		
		_moveDirection.x = _moveTarget.x - _worldPos.x;
		_moveDirection.y = _moveTarget.y - _worldPos.y;
		
		_moveDirection.normalize();
		_moveDirection.multiplyScalar(dt * _speed);
		
		var d = Vector.Subtract(_worldPos, _moveTarget).length;
		_moveDirection.x = (d > _moveDirection.length)? _moveDirection.x : _moveTarget.x - _worldPos.x;
		_moveDirection.y = (d > _moveDirection.length)? _moveDirection.y : _moveTarget.y - _worldPos.y;
		
		_worldPos.add(_moveDirection);
	}
	
	//TODO!: currently very strange to prevent doing a full spin around when crossing zero, must be an easier way
	function _updateAngle(dt: Float) {
		_angleTarget = -Math.atan2(_moveTarget.x - _worldPos.x, _moveTarget.y - _worldPos.y);
		var target = Maths.degrees(_angleTarget) - 180;
		
		target = Maths.wrap_angle(target, 0, 360);
		
		var wr = Maths.wrap_angle(rotation_z, 0, 360);
		var r = (target - wr);
		
		if (r > 180) {
			r = (target - wr - 360);
		}
		else if (r < -180) {
			r = (target - wr + 360);
		}
		
		rotation_z += r * dt * _rotateSpeed;
		
		rotation_z = Maths.wrap_angle(rotation_z, 0, 360);
		
		_log(Std.int(rotation_z));
	}
	
	function _getDist(a: Vector, b: Vector) {
		var xd = (b.x - a.x);
		xd *= xd;
		
		var yd = (b.y - a.y);
		yd *= yd;
		
		return Math.sqrt(xd + yd);
	}
	
	function _log(t: Dynamic) {
		_logText.text = Std.string(t);
	}

	public function setMoveTarget(v: Vector) {
		_moveTarget.copy_from(v);
	}
}

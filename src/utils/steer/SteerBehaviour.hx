package utils.steer;

import characters.Character;
import luxe.Component;
import luxe.Entity;
import luxe.Vector;

class SteerBehaviour extends Component {
	
	var _position:Vector;
	var _steering: Vector;
	var _target: Entity;
	var _desiredVelocity: Vector;
	var _velocity: Vector;
	var _mass: Float;
	var _maxForce: Float;
	var _maxSpeed: Float;

	public function new(position: Vector, ?target : Entity) {
		super();
		this._position = position;
		this._target = target;
		this._steering = new Vector(0 , 0);
		this._desiredVelocity = new Vector(0, 0);
		this._velocity = new Vector(0, 0);
		this._mass = 1;
		this._maxForce = 10;
		this._maxSpeed = 120;
	}

	private function truncate(v: Vector, max:Float) {
		return v.length > max ? v.normalize().multiplyScalar(max) : v;
	}
	public override function update(dt: Float) {
		if( _target == null) return;
		trace(_target.pos);
		var temp2:Vector = new Vector(_target.pos.x,_target.pos.y);
		var temp:Vector = new Vector(_position.x, _position.y);

		_desiredVelocity =temp2.subtract(temp).normalize().multiplyScalar(_maxSpeed * dt);
		_steering = _desiredVelocity.subtract(_velocity);
		_steering = truncate(_steering, _maxForce * dt);
		_steering = _steering.divideScalar(_mass);

		_velocity = truncate(_velocity.add(_steering), _maxSpeed * dt);
		temp = temp.add(_velocity);
		_position.set_xy(temp.x, temp.y);
		trace(_target.pos);
		trace(_position);
		trace(temp);
		trace("---");
	}
}
package utils.steer;

import characters.Character;
import luxe.Component;
import luxe.Vector;

class SteeringManager extends Component {

    public static inline var MAX_FORCE: Float = 100;

    // Wander
    public static inline var CIRCLE_DISTANCE: Float = 3;
    public static inline var CIRCLE_RADIUS: Float = 4;
    public static inline var ANGLE_CHANGE: Float = 1;

    // Seek / flee
    public var desired: Vector;

    // Wander
    private var wanderAngle: Float;

    // Pursuit and evade
    public var distance: Vector = new Vector();
    public var targetFuturePosition: Vector = new Vector();

    // Manager itself
    public var steering: Vector;      
    public var host: Boid;

    public function new(host: Character) {
        this.host           = cast( host, Boid);
        super({name:"steering"});
    }

    public override function init() {
        this.desired        = new Vector(0, 0); 
        this.steering       = new Vector(0, 0); 
        this.wanderAngle    = 0; 
        trace(entity);
        host.getVelocity().copy_from(truncate(host.getVelocity(), host.getMaxVelocity()));
    }

    public function seek(target: Vector, slowingRadius: Float = 20) {
        steering = steering.add(doSeek(target, slowingRadius));
    }

    public function flee(target: Vector) {
        steering = steering.add(doFlee(target));
    }

    public function wander() {
        steering = steering.add(doWander());
    }

    public function evade(target: Boid) {
        steering = steering.add(doEvade(target));
    }

    public function pursuit(target: Boid) {
        steering = steering.add(doPursuit(target));
    }

    private function doSeek(target: Vector, slowingRadius: Float = 100): Vector {
        var force: Vector;
        var distance: Float;

        desired.copy_from(target);
        desired = desired.subtract(host.getPosition());

        distance = desired.length;
        desired = desired.normalize();

        if (distance <= slowingRadius) {
            desired = desired.multiplyScalar(host.getMaxVelocity() * distance/slowingRadius);
        }
        else {
            desired = desired.multiplyScalar(host.getMaxVelocity());
        }

        force = desired.subtract(host.getVelocity());

        return force;
    }

    private function doFlee(target: Vector): Vector {
        var force: Vector;

        desired = host.getPosition().subtract(target);
        desired = desired.normalize();
        desired = desired.multiplyScalar(host.getMaxVelocity());

        force = desired.subtract(host.getVelocity());

        return force;
    }

    private function doWander(): Vector {
        var wanderForce: Vector, circleCenter:Vector, displacement:Vector;

        circleCenter = host.getVelocity().normalize();
        circleCenter = circleCenter.multiplyScalar(CIRCLE_DISTANCE);

        displacement = new Vector(0, -1);
        displacement = displacement.multiplyScalar(CIRCLE_RADIUS);

        setAngle(displacement, wanderAngle);
        wanderAngle += (Math.random() * ANGLE_CHANGE) - (ANGLE_CHANGE * .5);

        wanderForce = circleCenter.add(displacement);
        return wanderForce;
    }

    private function doEvade(target: Boid): Vector {
        distance = target.getPosition().subtract(host.getPosition());

        var updatesNeeded: Float = distance.length / host.getMaxVelocity();

        var tv: Vector = target.getVelocity().clone();
        tv = tv.multiplyScalar(updatesNeeded);

        targetFuturePosition = target.getPosition().clone().add(tv);

        return doFlee(targetFuturePosition);
    }

    private function doPursuit(target: Boid): Vector {
        distance.copy_from(target.getPosition());
        distance.subtract(host.getPosition());

        var updatesNeeded: Float = distance.length / host.getMaxVelocity();

        var tv: Vector = target.getVelocity().clone();
        tv = tv.multiplyScalar(updatesNeeded);

        targetFuturePosition.copy_from(target.getPosition());
        targetFuturePosition = targetFuturePosition.add(tv);

        return doSeek(targetFuturePosition);
    }


    public function truncate(vector: Vector, max: Float) {
        var i: Float;

        i = max / vector.length;
        i = i < 1.0 ? i:  1.0;

        return vector.multiplyScalar(i);
    }

    public function getAngle(vector: Vector): Float {
        return Math.atan2(vector.y, vector.x);
    }

    public function setAngle(vector: Vector, value:Float) {
        var len: Float = vector.length;
        vector.x = Math.cos(value) * len;
        vector.y = Math.sin(value) * len;
    }

    public override function update(dt: Float) {
        var velocity: Vector = host.getVelocity();
        var position: Vector = host.getPosition();

        steering.copy_from(truncate(steering, MAX_FORCE));
        steering.copy_from(steering.multiplyScalar(1 / host.getMass()));

        velocity.copy_from(velocity.add(steering));
        velocity.copy_from(truncate(velocity, host.getMaxVelocity()));

            //position = position.add(velocity);
    }

    public function reset() {         
        desired.x = desired.y = 0;
        steering.x = steering.y = 0;
    }
}
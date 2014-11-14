package utils.steer;

import luxe.Vector;

interface Boid {
	function getVelocity(): Vector;
    function getMaxVelocity(): Float;
    function getPosition(): Vector;
    function getMass(): Float;
}
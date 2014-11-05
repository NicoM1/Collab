package utils;

import luxe.Vector;

class RenderMaths {
	// TODO : Define the correct perspective transform. I totally used random values
	public static inline function perspectiveProjection(position: Vector) {
		 return new Vector(position.x, position.y /4);
	}
}
package utils;

import luxe.Vector;

class RenderMaths {
	// TODO : Define the correct perspective transform. I totally used random values
	public static inline function perspectiveProjection(position: Vector, renderPos: Vector): Vector {
		 renderPos.x = position.x;
		 var y = position.y / Config.perspective;
		 renderPos.y = y + (position.y - y);
		 return renderPos;
	}
}
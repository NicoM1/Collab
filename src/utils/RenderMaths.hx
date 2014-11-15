package utils;

import luxe.Vector;

class RenderMaths {
	public static inline function perspectiveProjection(position: Vector, renderPos: Vector): Vector {
		 renderPos.x = position.x;
		 var y = position.y / Config.perspective;
		 renderPos.y = y + (position.y - y);
		 return renderPos;
	}
}
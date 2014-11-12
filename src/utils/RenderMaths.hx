package utils;

import luxe.Vector;

class RenderMaths {
	//CHANGED: DEPRECATED, does not match current setup, leaving just in case
	public static inline function perspectiveProjection(position: Vector, renderPos: Vector): Vector {
		 renderPos.x = position.x;
		 var y = position.y / Config.perspective;
		 renderPos.y = y + (position.y - y);
		 return renderPos;
	}
}
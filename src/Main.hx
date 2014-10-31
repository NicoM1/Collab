package;

import luxe.Color;
import luxe.Input;
import luxe.options.DrawOptions.DrawCircleOptions;
import luxe.Vector;
import phoenix.Batcher.PrimitiveType;
import phoenix.geometry.CircleGeometry;
import phoenix.geometry.Geometry;
import phoenix.geometry.Vertex;

class Main extends luxe.Game 
{	
	override function ready() {

	}

	override function onkeyup(e:KeyEvent) {
		if(e.keycode == Key.escape) {
			Luxe.shutdown();
		}
	}

	override function update(dt:Float) {
		
	}
}

package;

import luxe.Input;
import BinarySave.DataFile;
import BinarySave.DataItem;

class Main extends luxe.Game 
{
	override function ready() {
		//{ Binary
		/*var data:DataFile = BinarySave.getDataFile();
		
		data.sig = 0xf;
		
		for (i in 0...257)
		{
			var item:DataItem = BinarySave.getDataItem();
			item.id = 0x10;
			item.format = 0x1;
			item.data = [0, 5, 10];
			
			data.items.push(item);
		}
		
		/*var item1:DataItem = BinarySave.getDataItem();
		item1.id = 0x2;
		item1.format = 0x2;
		item1.data = [1, 2, 3];
		
		var item2:DataItem = BinarySave.getDataItem();
		item2.id = 0x5;
		item2.format = 0x7;
		item2.data = [8, 9, 0xf];
		
		
		data.items.push(item);
		data.items.push(item1);
		data.items.push(item2);
		
		BinarySave.saveData("assets/test.data", data);
		
		BinarySave.loadData("assets/test.data", onLoad);*/
		
		//}
	}
	
	function onLoad(d:DataFile) {
		trace(d.items);
	}

	override function onkeyup(e:KeyEvent) {
		if(e.keycode == Key.escape)
			Luxe.shutdown();
	}

	override function update(dt:Float) {
	}
}

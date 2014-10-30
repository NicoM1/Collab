package;

import luxe.resource.Resource.DataResource;
import sys.io.File;
import sys.io.FileOutput;

class BinarySave {
	static var cur: DataFile-> Void;
	static public var FILEVERSION(default, never) = 1;
	public function new() {

	}
	
	static public function loadData(id:String, onLoad:DataFile-> Void) {
		cur = onLoad;
		Luxe.loadData(id, _onLoad);
	}
	
	static public function saveData(id:String, data:DataFile) {
		var fout = File.write(id, true);
		fout.writeInt32(0);//blank
		fout.writeInt32(data.sig);
		fout.writeInt32(FILEVERSION);
		
		fout.writeInt32(data.items.length);
		
		for (i in data.items)
		{
			fout.writeInt32(i.id);
			fout.writeInt32(i.format);
			fout.writeInt32(i.data.length);
			for (d in i.data)
			{
				fout.writeInt32(d);
			}
		}
		
		//fout.flush();
		fout.close();
	}
	
	static function _onLoad(d:DataResource) {
		trace(d.data.toHex());
		var b = d.data;
		var file:DataFile = getDataFile();
		
		b.position = 1;
		file.sig = b.readInt();
		file._ver = b.readInt();
		
		var itemLength = b.readInt();
		
		for (i in 0...itemLength)
		{
			var item:DataItem = getDataItem();
			item.id = b.readInt();
			item.format = b.readInt();
			var dataLength = b.readInt();
			
			for (ii in 0...dataLength)
			{
				item.data.push(b.readInt());
			}
			file.items.push(item);
		}
		
		cur(file);
	}
	
	static public inline function getDataFile():DataFile {
		return { sig:0, _ver:0, items:new Array<DataItem>() };
	}
	static public inline function getDataItem():DataItem {
		return { id:0, format:0, data:new Array<Int>() };
	}
	
}

///Basic data format, don't touch _ed items
typedef DataFile = {
	//var header: { 
	sig:Int, //BYTE
	_ver:Int, //BYTE
	//};
	//var _itemLength: Int; //INT
	items: Array<DataItem>
}

typedef DataItem = {
	id: Int, //INT
	format: Int, //BYTE
	//var _dataLength: Int; //INT
	data: Array<Int>,
}

/*//--------------------------------------------------------------------------------------//
	0x1 #SIG
	0x1 #VER
	
	0xFF #ITEMLENGTH
	
	#ITEM
		0x1 #ID
		0x1 #FORMAT
		0xf #DATALENGTH
		
		#DATA
			0x10f
			0xf01
			0xfff
			0x111
		#ENDDATA
	#ENDITEM
	
//--------------------------------------------------------------------------------------//*/
package weapons;
import luxe.options.SpriteOptions;
import luxe.Sprite;

import weapons.ammo.AmmoType;
import weapons.parts.*;


typedef WeaponOptions = {
    ?name: String,
	body: Body, 
	cannon: Cannon,
    techCore:TechCore, 
	ammoStorage:AmmoStorage					
}

class WeaponBase extends Sprite {
	
	var body: Body;
	var cannon: Cannon;
	var techCore: TechCore;
	var ammoStorage: AmmoStorage;
	
	// The weapon should store the sum of the stats to avoid calling multiple
    // variables each time we need them. That'll avoid changing part values.
	var _ammoType: AmmoType;
    var _clipSize: Int;
    var _energyUsage: Float;
    var _firingSpeed: Float;
    var _precision: Float;
    var _reloadSpeed: Float;
	
	 // TODO : Add a default piece for each parts.
	public function new(options_: WeaponOptions) {
		super({name: options_.name});
        this.body = options_.body;
        this.cannon = options_.cannon;
        this.techCore = options_.techCore;
        this.ammoStorage = options_.ammoStorage;
        _setStatsFromParts();
	}
	
	/**
     * Needs to be called to set up correctly weapon stat from the parts at
     * creation or part change.
     * TODO?: x2, x3, xn fac
     */
     private function _setStatsFromParts() {
        _ammoType = cannon.ammoType;
        _clipSize = ammoStorage.clipSize;
        _energyUsage = body.energyUsage + techCore.energyUsage;
        _firingSpeed = ammoStorage.firingSpeed + body.firingSpeed;
        _precision = cannon.precision;
        _reloadSpeed = ammoStorage.reloadSpeed + techCore.reloadSpeed;
     }
}
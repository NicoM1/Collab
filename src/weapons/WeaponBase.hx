package weapons;
import luxe.options.SpriteOptions;
import luxe.Sprite;

import weapons.ammo.AmmoType;
import weapons.parts.*;

import phoenix.Vector;


typedef WeaponOptions = {
	> SpriteOptions,
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
    var bulletSystem: BulletSystem;
	
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
		super(options_);
        body = options_.body;
        cannon = options_.cannon;
        techCore = options_.techCore;
        ammoStorage = options_.ammoStorage;
        _setStatsFromParts();
        bulletSystem = new BulletSystem();
        add(bulletSystem);
	}

    public function fire(angle: Vector) {
        bulletSystem.fireBullet(AmmoType.Basic, angle);
    }
	
	/**
     * Needs to be called to set up correctly weapon stat from the parts at
     * creation or part change.
     * TODO?: x2, x3, xn fac
     */
     function _setStatsFromParts() {
        _ammoType = cannon.ammoType;
        _clipSize = ammoStorage.clipSize;
        _energyUsage = body.energyUsage + techCore.energyUsage;
        _firingSpeed = ammoStorage.firingSpeed + body.firingSpeed;
        _precision = cannon.precision;
        _reloadSpeed = ammoStorage.reloadSpeed + techCore.reloadSpeed;
     }
}
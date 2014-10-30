package weapons;
import luxe.options.SpriteOptions;
import luxe.Sprite;

import weapons.ammo.AmmoType;
import weapons.parts.*;

class WeaponBase extends Sprite {
    var body: Body;
    var cannon: Cannon;
    var techCore: TechCore;
    var ammoStorage: AmmoStorage;

    // The weapon should store the sum of the stats to avoid calling multiple
    // variables each time we need them. That'll avoid changing part values.
    private var _ammoType    : AmmoType;
    private var _clipSize    : Int;
    private var _energyUsage : Float;
    private var _firingSpeed : Float;
    private var _precision   : Float;
    private var _reloadSpeed : Float;

    // public function new(options: SpriteOptions) {
    //  super(options);
    // }

    // TODO : Add a default piece for each parts.
    public function new(options: SpriteOptions,
        body:Body = Null, cannon:Cannon = Null,
        techCore:TechCore = Null, ammoStorage:AmmoStorage = Null) {

        super(options);
        this.body = body;
        this.cannon = cannon;
        this.techCore = techCore;
        this.ammoStorage = ammoStorage;
        setStatsFromParts();
    }

    /**
     * Needs to be called to set up correctly weapon stat from the parts at
     * creation or part change.
     * TODO?: x2, x3, xn fac
     */
     private function setStatsFromParts() {
        _ammoType    = cannon.ammoType;
        _clipSize    = ammoStorage.clipSize;
        _energyUsage = body.energyUsage + core.energyUsage;
        _firingSpeed = ammoStorage.firingSpeed + body.firingSpeed;
        _precision   = cannon.precision;
        _reloadSpeed = ammoStorage.reloadSpeed + techCore.reloadSpeed;
     }

    }
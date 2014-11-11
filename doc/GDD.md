##[Game Design Document]

#### SHMUP
- Borderlands style weapons
  - (@Eiyeron) Borderlands tracks the weapons as a combinaison of differents parts as the canon, the handle, etc...
    - Power
    - Firing Accuracy
    - Firing Frequency (how much bullets per seconds can be fired)
    - Reloading length (Note : the parts have different reloading animations. A pistol barrel on't have the same reloading than a shotgun)
    - Zoom
    ...
  - (@Eiyeron) Here's a list of the caracteristics we could track
    - Speed
    - Power
    - Trajectory / curviness (if it curves a lot of if it does only a little curve)
    - Speed
    - Firing Cadency
    - Energy used for a shot (if we'll use a energy system)
    - Cost (for the part and a fusion factor)
    - And obviously, graphics.
- ProcGen Terrain
  - (@Eiyeron) If it's a space shmup (hello, originality), Proc gen could be used to design planets as KSP (Kerbal Space Program) does or a lot of procgen games (like roguelikes)
  - (@Eiyeron) The main advantage with using pseudo-random functionbs like Simplex is the lossless details. Just add on the fly more octaves / calculation passses and you'll have as much details as you want.
  - (@Eiyeron) I should have some old prototypes here and there. I could bring them up for dissection.


## Weapon parts (@Eiyeron's ideas)

- Cannon
	=> Affects : missile type, precision
- Body             : Can be though about the part which will convert energy into missile or bring it to the cannon.
	=> Affects : firing speed, energy used
- Tech Core module : Think it like a CPU which manage the weapon's resource.
	=> Affects : reloading speed, energy used, (repairing?)
- Ammo Storage
	=> Affects : firing speed, Ammo clip quantity


### Legendary / Unique weapons creation ideas.

1.  Some "unique" weapons are actually a set of parts which only set with themselves.
2.  Some "unique" weapons are actually containing a legendary part which brings the legendary status.
3.  Hardcoded legendary weapons

### Weapon JSON storage?
```json
{
  "name":"basic",
  "body" : {
    /*
     * WIP, could store for instance only an id and the part could be generated from that id.
     */
  },
  "core" : {
    /*
     * WIP
     */
  },
  "cannon" : {
    /*
     * WIP
     */
  },
  "ammo" : {
    /*
     * WIP
     */
  }
}
```

###Weapon Binary Storage (this is just how I would lay it out, not a standard)

```
0x1 #FileType Version

0x3 #ItemCount

0xff1a #here could just be a seed, or individual properties or whatever

0xaa13 #here could just be a seed, or individual properties or whatever

0x64bc #here could just be a seed, or individual properties or whatever
```

###Input Handling

input actions are stored in json, which is then parsed by a macro into useable funtions:

```
{
    "actions": [
        {
            "name": "playerleft",
            "codes": ["key_a", "left"]
        },
        {
            "name": "playerright",
            "codes": ["key_d", "right"]
        },
        {
            "name": "playerup",
            "codes": ["key_w", "up"]
        },
        {
            "name": "playerdown",
            "codes": ["key_s", "down"]
        },
        {
            "name": "playerjump",
            "codes": ["space"]
        }
    ]
}
```

the above json will compile into: 

![Imgur](http://i.imgur.com/KNwLfLc.png)

which has functions to check status:

![Imgur](http://i.imgur.com/qPnbnBD.png)

####Remapping by User

at build time, the above JSON is built into a properly typed class. This allows us to have a clean API, but also have safety checks when someone remaps an action that doesn't exist. In order to remap keys after build, all the user has to do is edit input.json, reflection will take care of updating the relevant input class.

####Thinking thoughts:
- weapon aim goes left/right/up/down but not back/front (y axis)
- levels scroll to the right, sometimes with gate blocking the path until actions are completed
- small enemies swarm like a shmup but with a smaller amount
- large bosses occur at specific times

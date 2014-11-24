# Weapon infos

## Main infos
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

#Input Handling

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
# Char's HUD - A HUD Mod for Funkin' 0.6!

## You can download the code and it will still work just as well as the releases.

## Additions/Changes

### This mod adds the following:

- Time Bar
- Healthbar Colors

### And changes the following:

- Score text now gives you more useful information see [Score Text](#score-text---vs-char-hud--psych-hud)

## Configuration

You can edit the settings of the mod by going into `mods/<folderOfHUDMod>/data/vsCharHud/settings.json` and changing the values there!
you can always grab a fresh new copy [here!]("data/vsCharHud/settings.json") if something breaks or you accidentally deleted the settings file.

### Score Text - VS Char HUD | Psych HUD

By default the score text is styled after my own mod "VS Char:

```
       Score: 0 | Messed up 0 times
Accuracy: N/A | Rating: YOU HAVEN'T DONE SHIT YET
```

Changing `"vsCharHUD": true,` to `"vsCharHUD": false,` will set it to `Score: 0 | Misses: 0 | Rating ?`

### Time Bar - VS Char Colors | Black and White

By default the Time Bar has these colors:

![](docs/timeBar.png)

Changing `"useVSCharColors": true,` to `"useVSCharColors": false,` will revert the Time Bar to a standard Black to White color scheme.

### Colored Healthbar - Custom Characters

**Hey char, it's cool that you added them but HOW DO I USE IT WITH MY CHARACTERS?!**

Well it's pretty simple, there are 3 ways:

- put a file under `_merge/data/vsCharHud/colors.json`

use the following template to add an entry (Color code MUST start with `0xFF`):
```json
{
       "colors": [
              {
                     "affects": [
                            "Your",
                            "Characters",
                            "Here"
                     ],
                     "color": "0xFFFF8800"
              },
              {
                     "affects": [
                            "Second Entry"
                     ],
                     "color": "0xFF884422"
              }
       ]
}
```

- Add an entry to your character JSON (Hex Color Code)

In your character file add this after the name value, replacing `0xFF000000` with the hex color value you want:

> [!NOTE]
> The color code MUST start with 0xFF

`"healthBarColor": "0xFF000000",`

- Add an entry to your character JSON (RGB Array)

In your character file after the name value, add an array like the following:

`"healthBarColor": [255, 136 0],`

- Inheriting another character file's color

In your character file after the name value, add the following:

`"inheritsFrom": "bf"`

replacing `bf` with the character file you want to inherit the color from.

### Accuracy - Include Timing

By default, the timing of your note hit is taken into account when doing accuracy calculations, if you want a more psych-like accuracy set `"includeTiming": true` to `"includeTiming": false`

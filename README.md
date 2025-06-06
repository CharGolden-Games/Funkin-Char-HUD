# Char's HUD - A HUD Mod for Funkin' 0.6!

## You can download the code and it will still work just as well as the releases.

# Additions/Changes

## This mod adds the following:

- Time Bar
- Healthbar Colors
- Judgement Text
- Hit Timing Text
- Keystrokes (port from [Universe Engine](https://github.com/VideoBotYT/Universe-Engine))

## And changes the following:

- Score text now gives you more useful information see [Score Text](#score-text---vs-char-hud--psych-hud)

# Configuration

You can edit the settings of the mod by going into `mods/<folderOfHUDMod>/data/vsCharHud/settings.json` and changing the values there!
you can always grab a fresh new copy [here!]("data/vsCharHud/settings.json") if something breaks or you accidentally deleted the settings file.

## Score Text - VS Char HUD | Psych HUD

By default the score text is styled after my own mod "VS Char:

```
       Score: 0 | Messed up 0 times
Accuracy: N/A | Rating: YOU HAVEN'T DONE SHIT YET
```

Changing `"vsCharHUD": true,` to `"vsCharHUD": false,` will set it to `Score: 0 | Misses: 0 | Rating ?`

## Time Bar - VS Char Colors | Black and White

By default the Time Bar has these colors:

![](docs/timeBar.png)

Changing `"useVSCharColors": true,` to `"useVSCharColors": false,` will revert the Time Bar to a standard Black to White color scheme.

## Colored Healthbar - Custom Characters

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

in your character file add this after the name value, replacing `0xFF000000` with the hex color value you want:

> [!NOTE]
> The color code MUST start with 0xFF

`"healthBarColor": "0xFF000000",`

- Add an entry to your character JSON (RGB Array)

in your character file after the name value, add an array like the following:

`"healthBarColor": [255, 136 0],`

- Add an entry to your character JSON (InheritsFrom)

in your character file add this after the name value replacing `charName` with the character json filename to inherit from (Also works for ones only in colors.json)

`"inheritsFrom": "charName",`

### WARNING THIS IS RECURSIVE AND MAY CRASH IF YOU CHAIN TOO MANY CHARACTER JSONS TO EACHOTHER (e.g. char1 chains to char2 chains to char3 etc.)


## Accuracy - Include Timing

By default, the timing of your note hit is taken into account when doing accuracy calculations, if you want a more psych-like accuracy set `"includeTiming": true,` to `"includeTiming": false,`

## HUD Element fading

By default most of the new HUD fades in/out while in game (fade in on song start, fade out on song restart/end), but you can change this behaviour by changing `"doFading": true,` to `"doFading": false,`

## Shits/Bads Remove health

By default, no behaviour is modified, but change `"badsShitsHurt": false` to `"badsShitsHurt": true` if you wanna lose health from them for some reason.
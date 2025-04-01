# Char's HUD - A HUD Mod for Funkin' 0.6!

## Additions/Changes

### This mod adds the following:

- Time Bar
- Healthbar Colors ***(Not implemented yet!)***

### And changes the following:

- Score text now gives you more useful information see #

## Configuration

You can edit the settings of the mod by going into `mods/<folderOfHUDMod>/data/vsCharHud/settings.json` and changing the values there!
you can always grab a fresh new copy <a href="https://raw.githubusercontent.com/CharGolden-Games/Funkin-Char-HUD/c0156ed4dab06afefc953b5d7461499dc56c0cc5/data/vsCharHud/settings.json?token=GHSAT0AAAAAAC6B6ETYVFAQMIMEJHFSNVLSZ7LL7OQ" download="settings.json"> here!</a> if something breaks or you accidentally deleted the settings file.

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
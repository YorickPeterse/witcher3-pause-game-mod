# README

A simple mod to pause/resume the game while hiding the UI, without all the extra
features other mods may offer.

## Why?

The most commonly used mod for taking screenshots is the mod "PhotoMode 2inOne".
This mod comes with a variety of features such as being able to toggle the
weather, add effects, etc.

When taking screenshots however I personally don't really care for those
effects, I just want to be able to pause the game immediately and hide all UI
elements. This mod does exactly (and _just_) that.

## Requirements

* Debug Console Enabler (if you want the Freecam feature)

## Conflicts

This mod conflicts with any other mod that edits playerInput.ws, you'll have to
merge the file manually somehow to make things work in that case.

## Installation

First we need to dunk the "modPauseGame" directory into the Witcher 3's mods
directory. Depending on the installation medium (Steam, GOG, etc) the location
may differ but in general it's in `$WITCHER_DIRECTORY/mods` where
`$WITCHER_DIRECTORY` refers to the installation directory of The Witcher 3. The
"mods" directory may not exist, if this is the case you'll have to create it
first.

### Registering Input Commands

Once the directory is in place open
`$WITCHER_DIRECTORY/bin/config/r4game/user_config_matrix/pc/input.xml` and add
the following to it:

    <Var builder="Input" id="PauseGame" displayName="Pause Game" displayType="INPUTPC" actions="PauseGame" />

This line should come somewhere after the `<visibleVars>` tag but before the
`</visibleVars>` tag. For example:

    <visibleVars>
        <Var builder="Input" id="PauseGame" displayName="Pause Game" displayType="INPUTPC" actions="PauseGame" />

        ...
    <visibleVars>

### User Input Settings

Next we need to edit the input settings to make sure we have a hotkey for all
avialable states of the game. To do so, open `$HOME/Documents/The Witcher
3/input.settings`. It's best to open this file with an editor that can do
regular expression based find-replacements as this makes adding the setting
easier. Once opened add the following to every section:

    IK_Pause=(Action=PauseGame)

This binds the pause game option to the "Pause" button. If you're using
Notepad++ you can use the find-replace feature and find-replace the sections
with the following regular expressions:

* Find what: `(\[[^\]]+\])`
* Replace with: `$1\r\nIK_Pause=\(Action=PauseGame\)`

Once the above has been entered in the appropriate fields simply hit "Replace
All" and the hotkey should be available in all sections.

### Testing

To test if the mod works boot up the game and hit the "Pause" button. If all
works well you should be able to pause and resume the game.

## Support

I don't provide any support for this mod as I'm already busy enough as-is,
sorry!

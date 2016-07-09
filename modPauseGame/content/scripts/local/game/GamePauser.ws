// Simple script to pause the game world and hide the HUD without any of the
// extra features other mods (e.g. Photomode2inOne) come with.
class GamePauser {
    var paused : bool;
    default paused = false;

    public function InitHotkeys() {
        theInput.RegisterListener(this, 'OnPauseGame', 'PauseGame');
    }

    event OnPauseGame(action: SInputAction) {
        var hud : CR4ScriptedHud;
        var dialog : CR4HudModuleBase;

        if ( IsPressed(action) ) {
            hud = (CR4ScriptedHud) theGame.GetHud();
            dialog = (CR4HudModuleBase) hud.GetHudModule('DialogModule');

            // Pause the game and hide the HUD
            if ( paused == false ) {
                theGame.Pause('GamePauser');

                // Hide any dialogs
                hud.OnDialogHudShow();

                dialog.SetEnabled(false);

                paused = true;
            }
            // Resume the game and restore the HUD
            else {
                theGame.Unpause('GamePauser');

                // Display the dialogs again
                hud.OnDialogHudHide();

                dialog.SetEnabled(true);

                paused = false;
            }
        }
    }
}

# Other stuff to note

## Right click in Firefox instantly clicks upon mouse button release

Seems to be a bug in bspwm or GTK 3 or something weird. Appears to happen
when dark mode is preferred in GTK 3, specifically when using the
follwing setting in `$XDG_CONFIG_HOME/gtk-3.0/settings.ini`:

```ini
gtk-application-prefer-dark-theme = true
```

Does not seem to happen when the above is not set (or is set to false).
One fix is to set the following `about:config` entry to `true`.

```
ui.context_menus.after_mouseup
```


# noughty autorandr

## Roadmap

Topics here are listed in no particular order, and are not guaranteed to ever make it into a release.

### Core

* Perhaps profiles _should_ auto-capture `dconf` etc. during `preswitch` -- as long as we keep a backup.

* Rewrite to be shell-agnostic, so we don't depend on `bash` specifically. Or perhaps rewrite the whole thing in Python...

* Do a Python rewrite (before this project gets too big)
  * Depend on shell commands unless (or until) a suitable Python-native approach has been identified.
  * Invoke shell commands like so:
  ```
  import subprocess
  subprocess.run(["ls", "-l"])
  ```
  * Invoke popups with one of: 
    * [Plyer](https://plyer.readthedocs.io/en/latest/#plyer.facades.Notification) (_Plyer is a Python library for accessing features of your hardware / platforms_)
    * [ntfy](https://pypi.org/project/ntfy/) (_A utility for sending push notifications_)
    
    the goal should be to make use of OS-native notifications.

* Perhaps we should (re)store less than "everything" in the `dconf` snapshot.
 
   Currently we capture everything from `dconf dump /`. Consequently, any modification to a `dconf` property (such as adding a keyboard shortcut) would apply _only to the current profile_ -- and even then, only until the next profile change, unless the user remembers to update their `autorandr` profile.
   
   This less than ideal. However, restoring less than everything means specifying a path longer than `/`, which in turn means being opinionated about _how much_ to capture: do we pick `org/mate/panel`, `org/gnome`, `desktop/gnome`? What about the gajillion other DE's out there? It gets messy real fast.
   
   In any case, we will need some form of scope control, plus some way to transport _desired_ changes between profiles.

### Audio

Purpose: Select appropriate input and output devices based on what's available.
* I have a working prototype of this, based on [this](https://unix.stackexchange.com/questions/460996/autorandr-but-for-audio-devices/) resource. The prototype stores per-profile primary inputs and outputs, and has one level of fallback in case the expected device is not available after all.
  * Because `noughty autorandr` is triggered by `autorandr`, this approach requires audio devices to be plugged in _prior to_ plugging in (or otherwise selecting) the display that would trigger `autorandr`.

### Printers

* Selecting an appropriate default printer _based on network status_ (until then I shall presume a default can be chosen based on the connected displays). At least [two](https://askubuntu.com/questions/1025450/how-to-automatically-switch-default-printers-based-on-your-location) [other](https://unix.stackexchange.com/questions/323582/how-can-i-automatically-change-the-default-printer-based-on-the-connected-networ) persons have expressed a desire for this, and they might not (want to) use `autorandr`. Yes, implementing this means that this part ought to be forked into a separate project.

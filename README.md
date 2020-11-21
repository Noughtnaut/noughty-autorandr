# noughty autorandr

## Intent

The intention is to augment the existing functionality of [autorandr](https://github.com/phillipberndt/autorandr) in various ways without impacting that project itself.

I am delighted to be using `autorandr` in my work environments (my desk, various meeting rooms, mobile, etc.). I prefer having a separate `panel` with its own `Window List` on each of my three displays, but that also means that when I'm on the go with my laptop, I'll have a stack of three panels on a single display, each with redundant `Window List`s, and that's just silly. Ideally, the layouts should adjust seamlessly -- and this project aims to do just that.

In this first iteration:

- saving an `autorandr` profile will also save a snapshot of the current `dconf` state (ie. wallpaper and theming, panels and their contents, keyboard shortcuts, etc.)
- switching to a profile will restore the profile-specific `dconf` state, if one exists.
- switching away from a profile "can" also save a snapshot, or update an existing one. This ensures that any ongoing tinkering is not lost when (un)plugging a monitor just because you forgot to explicitly save your changes. However, this functionality is currently disabled (this is why "can" is in quotes, because the code exists but is commented out). The reason is that, if you were to _force_ a profile active, then the panels and such might get all screwed up by trying to adjust to a different layout -- if you then switched away from it, you would save a snapshot of a mangled state. Ugh. Better to save _only_ when expliticly saving (or updating) a profile.

Future plans involve:

- selecting appropriate microphone and speaker devices (I have a working prototype of this, based on [this](https://unix.stackexchange.com/questions/460996/autorandr-but-for-audio-devices/) resource)
- selecting an appropriate default printer _based on network status_ (until then I shall presume a default can be chosen based on the connected displays). At least [two](https://askubuntu.com/questions/1025450/how-to-automatically-switch-default-printers-based-on-your-location) [other](https://unix.stackexchange.com/questions/323582/how-can-i-automatically-change-the-default-printer-based-on-the-connected-networ) persons have expressed a desire for this, and they might not (want to) use `autorandr`.

## Installation

The `noughty` directory should be placed within `~/.config/autorandr/`, alongside any existing profiles you may have (don't worry, `autorandr` won't pick up on it). The files in _this_ project that are outside of that directory merely show how to plug them into your existing [hook scripts](https://github.com/phillipberndt/autorandr#hook-scripts); you probably do not want to replace yours with these unless you don't have any to begin with.

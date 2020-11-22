# noughty autorandr

## Intent

The intention is to augment the existing functionality of [autorandr](https://github.com/phillipberndt/autorandr) in various ways without impacting that project itself.

### Motivation

I am delighted to be using `autorandr` in my work environments (my desk, various meeting rooms, mobile, etc.).

However, I prefer each of my three displays having a separate `panel` with its own `Window List` applet, but that also means that when I'm on the go with my laptop, I'll have a stack of three panels on a single display, each with its own redundant `Window List`. That's just silly. Ideally, the layouts should adjust seamlessly -- and this project aims to do just that.

## Goal / Promise

When you use `autorandr` together with `noughty autorandr`, saving a profile doesn't just save the display configuration -- it also saves the configuration of desktop elements such as panels, panel applets with their position and configuration, even the background wallpaper and keyboard shortcuts. Oh, and the default printer, which is probably different between work and the home office.

## Installation

### Prerequisites

* This is an add-on for `autorandr` which therefore needs to be installed beforehand.
* Also, `noughty-autorandr` assumes that `bash`, `dconf`, `cups`, and `libnotify` are installed.

### Download

Navigate to where you would like this add-on installed. It is going to create its own `noughty-autorandr` subdirectory. Then, run the command `git clone https://github.com/Noughtnaut/noughty-autorandr.git`.

### Plug into the hook scripts

You can do this two ways:

1. If you're not doing anything else with `autorandr` [hook scripts](https://github.com/phillipberndt/autorandr#hook-scripts), you can create simply symbolic links for the following files and place them within `~/.config/autorandr/`, alongside any existing profiles you may have.

    * the file `preswitch`
    * the file `postswitch`
    * the file `postsave`
    * the directory `noughty` (don't worry, `autorandr` won't see "noughty" as a possible profile)

2. If you _have_ other things going on in those hook scripts, it's better to create the links with different names, and then have the hook scripts call _those_. This way, updating `noughty autorandr` won't overwrite any of your own hook script commands.

## Usage

After installation, just use `autorandr` as you usually do -- that's all there is to it!

One thing, though: when you make changes to something that's stored in `dconf` (such as adding a keyboard shortcut), you should update the current profile

From time to time you may want to make changes to your display setup (or create new ones), and in those cases `noughty-autorandr` will be called upon to do its additional tasks.

### Configuration

There is as of yet no other means of adjusting the workings than editing the scripts within the `noughty` directory. This is not ideal, this is version 0.1. :-Þ

## Changes

The [roadmap](ROADMAP.md) describes what is being considered for the future. Also, the [change log](CHANGELOG.md#unreleased) might show things that are further along, albeit still unreleased.

<!---
#TODO
## Contributing
--->

## License

This software is distributed under the terms of the GNU General Public License v2 ([TL;DR](https://tldrlegal.com/license/gnu-general-public-license-v2)).

## Thanks

This project would be nothing without `autorandr`, so a sincere _thank you_ goes out to @wertarbyte, @phillipberndt, and the over 50 other contributors to that project.

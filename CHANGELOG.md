# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]


### Changed
- Snapshot files now have the '.snapshot' extension so having several types of snapshots is neater. Consequently, `snapshot.dconf` files are now named `dconf.snapshot`. There is no automatic migration, but simple file renaming does the trick.

[](Types of changes)
[](Added      for new features)
[](Changed    for changes in existing functionality)
[](Deprecated for soon-to-be removed features)
[](Removed    for now removed features)
[](Fixed      for any bug fixes)
[](Security   in case of vulnerabilities)

## [0.0.1] - 2020-11-19

Lo! There goes 'semantic versioning' out the window already. I am introducing "breaking changes" (even without any intermediate deprecation release, _gasp!_) and yet this is not version 1.0.0. Eh, deal with it. B)


## [0.0.0] - 2020-11-19

First commit! Basic saving and loading of `dconf` snapshots is working.

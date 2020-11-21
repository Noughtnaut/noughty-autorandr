# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

[](==Types of changes==)
[](Added      for new features)
[](Changed    for changes in existing functionality)
[](Deprecated for soon-to-be removed features)
[](Removed    for now removed features)
[](Fixed      for any bug fixes)
[](Security   in case of vulnerabilities)

[](==Semantic versioning==)
[](Given a version number MAJOR.MINOR.PATCH increment the:)
[](-MAJOR version when you make incompatible API changes)
[](-MINOR version when you add functionality in a backwards compatible manner)
[](-PATCH version when you make backwards compatible bug fixes)
[](Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format)

## [0.1.0] - 2020-11-19

Lo! There goes 'semantic versioning' out the window already. I am introducing "breaking changes" (even without any intermediate deprecation release, _gasp!_) and yet this is not version 1.0.0. Eh, deal with it. B)

### Changed
- Snapshot files now have the '.snapshot' extension so having several types of snapshots is neater. Consequently, `snapshot.dconf` files are now named `dconf.snapshot`. There is no automatic migration, but simple file renaming does the trick.

### Added
- Support for storing and restoring default printers! I can't believe how simple that was, and am rather ashamed for how long I've been putting up with this annoyance.

## [0.0.0] - 2020-11-19

First commit! Basic saving and loading of `dconf` snapshots is working.

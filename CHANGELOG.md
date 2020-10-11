# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.5.0] - 2020-10-10
### Changed
- `IntSet.bitstring/1` is now `IntSet.bitstring/2` and now accepts an option: `:byte_align`.
  When this option is set to `true`, the bitstring is padded at the end to make it byte-aligned.

## [1.4.2] - 2019-11-24
### Fixed
- `IntSet.inverse/2` is now totally fixed.

## [1.4.1] - 2019-11-24
### Fixed
- Some problems with `IntSet.inverse/2` and padding were fixed.

## [1.4.0] - 2019-11-24
### Added
- The `IntSet.inverse/2` function, which is like taking the difference of your IntSet with a completely-full IntSet with n members.
  Say you have a list of indices, and you want to create a list of all the indices you *don't* have.
  Just take the inverse, providing a member limit.
- Added an `.editorconfig` file to the project.

## [1.3.0] - 2018-05-25
### Added
- The `IntSet.equal?/2` function.
  It does exactly what you think.
- The `IntSet.intersection/2` function.
  Returns the elements that are in both sets.

## [1.2.1] - 2018-02-09
### Added
- `IntSet.difference/2` now has a typespec.
- `IntSet.disjoint?/2` now has docs and a typespec.

### Changed
- `IntSet.union/2` has been optimized

## [1.2.0] - 2018-02-06
### Added
- The `IntSet.difference/2` function.
  This function subtracts set B's members from set A.
- The `IntSet.disjoint?/2` function.
  Returns `true` if sets A and B have no members in common.

### Changed
- The `Collectable` implementation was dramatically optimized.

## [1.1.0] - 2018-02-03
### Added
- The `IntSet.bitstring/1` function.
  Returns a binary with bits flipped at the indices at which the set has members.
  For example, say you have a set containing 0, 1, and 4.
  Calling `IntSet.bitstring/1` on that set will return a five-bit-long binary with the first, second, and fifth bits set to 1, and the rest are 0.
- The library is now typespecced and documented.

## [1.0.0] - 2018-02-01
### Added
- Constructor `IntSet.new/0`, which creates a new empty set.
- Constructor `IntSet.new/1`, which accepts either an enumerable and returns a set containing those elements.
  This constructor also accepts a bitstring.
  See the documentation for details on that behavior.
- The `IntSet.put/2` function.
  Just like `MapSet.put/2`, this function returns a new set with the given value added.
- The `IntSet.delete/2` function.
  Again, just like `MapSet.delete/2`.
  Returns a new set with the given value removed.
- The `IntSet.union/2` function.
  Returns a set that contains elements of both given sets.
- An implementation of `Inspect` that sorts members before printing them,
  so the order can be relied upon in doctests.
- An implementation of `Collectable`.
- An implementation of `Enumerable`.

[Unreleased]: https://github.com/Cantido/int_set/compare/v1.5.0...HEAD
[1.5.0]: https://github.com/Cantido/int_set/compare/v1.4.2...v1.5.0
[1.4.2]: https://github.com/Cantido/int_set/compare/v1.4.1...v1.4.2
[1.4.1]: https://github.com/Cantido/int_set/compare/v1.4.0...v1.4.1
[1.4.0]: https://github.com/Cantido/int_set/compare/v1.3.0...v1.4.0
[1.3.0]: https://github.com/Cantido/int_set/compare/v1.3.0...v1.3.0
[1.2.1]: https://github.com/Cantido/int_set/compare/v1.1.0...v1.2.1
[1.2.0]: https://github.com/Cantido/int_set/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/Cantido/int_set/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/Cantido/int_set/releases/tag/v1.0.0

list-zfs-snapshots
==================

[![Build Status](https://img.shields.io/github/workflow/status/mmitch/list-zfs-snapshots/tests/master)](https://github.com/mmitch/list-zfs-snapshots/actions?query=branch%3Amaster)
[![GPL 3+](https://img.shields.io/badge/license-GPL%203%2B-blue.svg)](http://www.gnu.org/licenses/gpl-3.0-standalone.html)

list-zfs-snapshots can list ZFS snapshots in various ways.


usage
-----

* Calling `list-zfs-snapshots` without any arguments will list the
  snapshot usage of all ZFS volumes.
  
* Calling `list-zfs-snapshots` with the name of a ZFS pool as first
  argument will list the snapshot usage of only that pool.
  
* Calling `list-zfs-snapshots` with the name of a ZFS volume as first
  argument will list the individual snapshots in that volume.  
  _Because of ZFS internals the used space per snapshot might not be
  correct.  The sum of the used space of all snapshots seldom matches
  the snapshot usage listed at the volume.  The volume value is
  correct.  Deleting individual snapshots will change the used space
  of other snapshots – this is a byproduct of the copy-on-write
  semantics and completely normal._
  
* Calling `list-zfs-snapshots` with either `-h` or `--help` as first
  argument will show a brief help text.


configuration
-------------

By default the zfs binary is expected at `/sbin/zfs`.
The location can be overridden by setting the `ZFS_BINARY` environment variable.


dependencies
------------

- a not-so-ancient version of Perl
- the `Number::Bytes::Human` Perl module
- ZFS


resources
---------

Project homepage, git repository and bug tracker are available at
https://github.com/mmitch/list-zfs-snapshots


license
-------

Copyright (C) 2020  Christian Garbs <mitch@cgarbs.de>  
Licensed under GNU GPL v3 or later.

list-zfs-snapshots is free software: you can redistribute it and/or
modify it under the terms of the GNU General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

list-zfs-snapshots is distributed in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied warranty
of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with list-zfs-snapshots.  If not, see <http://www.gnu.org/licenses/>.

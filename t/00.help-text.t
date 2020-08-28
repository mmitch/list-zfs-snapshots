#!/usr/bin/env perl
#
# Copyright (C) 2020  Christian Garbs <mitch@cgarbs.de>
# Licensed under GNU GPL v3 or later.
#
# This file is part of list-zfs-snapshots
#
# list-zfs-snapshots is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# list-zfs-snapshots is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty
# of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with list-zfs-snapshots.  If not, see <http://www.gnu.org/licenses/>.
#
use Test::More tests => 2;
use strict;
use warnings;

use constant EXPECTED_HELP_TEXT => <<'EOF';
usage:
  list-zfs-snapshots              -  list total snapshot usage of all volumes
  list-zfs-snapshots <pool>       -  list total snapshot usage of all volumes in <pool>
  list-zfs-snapshots <volume>     -  list detailled snapshot usage in <volume>
  list-zfs-snapshots -h | --help  -  show this help
EOF

subtest 'check help text using -h' => sub {
    # given

    # when
    my $helptext = `./list-zfs-snapshots -h`;

    # then
    is($helptext, EXPECTED_HELP_TEXT, 'printed help text');
};

subtest 'check help text using --help' => sub {
    # given

    # when
    my $helptext = `./list-zfs-snapshots --help`;

    # then
    is($helptext, EXPECTED_HELP_TEXT, 'printed help text');
};


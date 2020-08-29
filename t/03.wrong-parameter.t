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
use Test::More tests => 1;
use strict;
use warnings;

sub run_with_parameters
{
    my $cmdline = 'ZFS_BINARY=t/mock-zfs.sh ./list-zfs-snapshots ' . join(' ', @_) . ' 2>&1';
    return `$cmdline`;
}

subtest 'call with bogus parameter' => sub {
    # given

    # when
    my $result = run_with_parameters('zglfrx');

    # then
    is($result, <<'EOF'
<zglfrx> is neither a known pool, volume, nor snapshot name
EOF
       , 'script output');
};


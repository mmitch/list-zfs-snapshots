#!/usr/bin/env perl
#
# Copyright (C) 2020, 2021  Christian Garbs <mitch@cgarbs.de>
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

sub run_with_parameters
{
    my $cmdline = 'ZFS_BINARY=t/mock-zfs.sh ./list-zfs-snapshots ' . join(' ', @_) . ' 2>&1';
    return `$cmdline`;
}

subtest 'call with pool A in pipe lists only volumes' => sub {
    # given

    # when
    my $result = run_with_parameters('bpool');

    # then
    is($result, <<'EOF'
bpool/BOOT
bpool/BOOT/debian
EOF
       , 'script output');
};

subtest 'call with volume in pipe lists only snapshots in ascending order' => sub {
    # given

    # when
    my $result = run_with_parameters('rpool/ROOT/debian');

    # then
    is($result, <<'EOF'
rpool/ROOT/debian@zfs-auto-snap_weekly-2020-08-09-0518
rpool/ROOT/debian@zfs-auto-snap_weekly-2020-08-16-0518
rpool/ROOT/debian@zfs-auto-snap_daily-2020-08-21-0425
rpool/ROOT/debian@zfs-auto-snap_daily-2020-08-22-0425
rpool/ROOT/debian@zfs-auto-snap_daily-2020-08-23-0425
rpool/ROOT/debian@zfs-auto-snap_weekly-2020-08-23-0453
rpool/ROOT/debian@zfs-auto-snap_daily-2020-08-24-0425
rpool/ROOT/debian@zfs-auto-snap_daily-2020-08-25-0425
rpool/ROOT/debian@zfs-auto-snap_daily-2020-08-26-0425
rpool/ROOT/debian@zfs-auto-snap_daily-2020-08-27-0425
rpool/ROOT/debian@zfs-auto-snap_daily-2020-08-28-0425
rpool/ROOT/debian@zfs-auto-snap_hourly-2020-08-28-1517
rpool/ROOT/debian@zfs-auto-snap_hourly-2020-08-28-1617
rpool/ROOT/debian@zfs-auto-snap_hourly-2020-08-28-1717
rpool/ROOT/debian@zfs-auto-snap_hourly-2020-08-28-1817
rpool/ROOT/debian@zfs-auto-snap_hourly-2020-08-28-1917
rpool/ROOT/debian@zfs-auto-snap_hourly-2020-08-28-2017
rpool/ROOT/debian@zfs-auto-snap_frequent-2020-08-28-2030
rpool/ROOT/debian@zfs-auto-snap_frequent-2020-08-28-2045
rpool/ROOT/debian@zfs-auto-snap_frequent-2020-08-28-2100
rpool/ROOT/debian@zfs-auto-snap_frequent-2020-08-28-2115
rpool/ROOT/debian@zfs-auto-snap_hourly-2020-08-28-2117
EOF
       , 'script output');
};

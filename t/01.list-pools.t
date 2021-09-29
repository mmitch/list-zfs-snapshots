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
use Test::More tests => 3;
use strict;
use warnings;

sub run_with_parameters
{
    my $cmdline = 'LIST_ZFS_SNAPSHOT_MOCK_STDOUT_NO_PIPE=1 ZFS_BINARY=t/mock-zfs.sh ./list-zfs-snapshots ' . join(' ', @_) . ' 2>&1';
    return `$cmdline`;
}

subtest 'call without parameters' => sub {
    # given

    # when
    my $result = run_with_parameters();

    # then
    is($result, <<'EOF'
                    0%      0  bpool/BOOT
                    0%      0  rpool/ROOT
                    0%      0  rpool/var
                    0%      0  rpool/var/cache
               #    4%   301M  bpool/BOOT/debian
              ##    6%   460M  rpool/opt
          ######   15%   1.1G  rpool/var/log
  ##############   35%   2.5G  rpool/ROOT/debian
################   39%   2.8G  rpool/var/spool
EOF
       , 'script output');
};

subtest 'call with pool A' => sub {
    # given

    # when
    my $result = run_with_parameters('bpool');

    # then
    is($result, <<'EOF'
                    0%      0  bpool/BOOT
################  100%   301M  bpool/BOOT/debian
EOF
       , 'script output');
};

subtest 'call with pool B' => sub {
    # given

    # when
    my $result = run_with_parameters('rpool');

    # then
    is($result, <<'EOF'
                    0%      0  rpool/ROOT
                    0%      0  rpool/var
                    0%      0  rpool/var/cache
              ##    7%   460M  rpool/opt
          ######   16%   1.1G  rpool/var/log
  ##############   36%   2.5G  rpool/ROOT/debian
################   41%   2.8G  rpool/var/spool
EOF
       , 'script output');
};

#!/usr/bin/env perl
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


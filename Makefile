all: test

test:
	prove t/

cover:
	PERL5OPT=-MDevel::Cover make test
	cover -select list-zfs-snapshots


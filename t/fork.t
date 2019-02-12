# see [GH #25]
# check that global %COLORS is concurrency safe
use GD::Simple;
use Test::More;
BEGIN {
  eval 'use Test::Fork;';
  plan skip_all => 'Test::Fork required' if $@;
  # see cpantesters, not repro for me
  plan skip_all => "Test::Fork broken on $^O" if $^O eq 'freebsd';
}
plan 'no_plan';

for (1..10) {
  fork_ok(1,
          sub{
            GD::Simple->new->bgcolor('transparent');
            ok(!$@, $@);
          });
}

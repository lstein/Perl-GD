# see [gh #25]
use GD::Simple;
use Test::More;
BEGIN {
  eval 'use Test::Fork;';
  plan skip_all => 'Test::Fork required' if $@;
}
plan 'no_plan';

for (1..10) {
  fork_ok(1,
          sub{
            GD::Simple->new->bgcolor('transparent');
            ok(!$@, $@);
          });
}

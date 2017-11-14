# -*- perl -*-
use strict;
use warnings;
use Test::More;
use Config;

plan skip_all => 'requires Test::More 0.88'
  if Test::More->VERSION < 0.88;
plan skip_all => 'No RELEASE_TESTING'
  unless -d '.git' || $ENV{RELEASE_TESTING};

# Missing XS dependencies are usually not caught by EUMM
# And they are usually only XS-loaded by the importer, not require.
# But even the most basic deps are missing mostly.
for (qw( Class::XSAccessor Text::CSV_XS List::MoreUtils Algorithm::Diff )) {
  eval "use $_;";
  plan skip_all => "$_ required for Test::Kwalitee"
    if $@;
}

if (!-e 'META.yml') {
  require File::Copy;
  File::Copy::cp('MYMETA.yml','META.yml');
  File::Copy::cp('MYMETA.json','META.json');
}

eval {
  require Test::Kwalitee;
};
plan skip_all => "Test::Kwalitee required"
  if $@;

my @args = ('-has_test_pod_coverage');
if ($Test::Kwalitee::VERSION lt '1.02') {
  push @args, '-proper_libs';
}
Test::Kwalitee->import(tests => [ @args ]);

#plan skip_all => 'Test::Kwalitee fails with clang -faddress-sanitizer'
#  if $Config{ccflags} =~ /-faddress-sanitizer/;

# _make_filehandle is the single open path for every filename constructor
# (new, newFrom*). A 2-arg open() there interprets shell-magic prefixes, so a
# "cmd |" filename runs a command and a "> file" filename truncates a file.
# These must be treated as plain pathnames.
use strict;
use warnings;
use GD;
use File::Temp qw( tempdir );
use File::Spec;
use Test::More tests => 5;

my $dir = tempdir(CLEANUP => 1);

# A trailing-pipe payload must not run a command.
{
  my $marker = File::Spec->catfile($dir, "pwned_read");
  my $fh     = eval { GD::Image->_make_filehandle("touch $marker |") };
  close $fh if $fh;
  ok !-e $marker, "trailing-pipe payload does not execute a command";
}

# A leading-pipe payload must not run a command.
{
  my $marker = File::Spec->catfile($dir, "pwned_write");
  my $fh     = eval { GD::Image->_make_filehandle("| touch $marker") };
  close $fh if $fh;
  ok !-e $marker, "leading-pipe payload does not execute a command";
}

# A redirect payload must not truncate a file.
{
  my $victim = File::Spec->catfile($dir, "victim");
  open my $fh, ">", $victim or die "$victim: $!";
  print $fh "important data\n";
  close $fh;
  my $made = eval { GD::Image->_make_filehandle("> $victim") };
  close $made if $made;
  is -s $victim, 15, "redirect payload does not truncate a file";
}

# A plain filename still opens as a file.
{
  my $real = File::Spec->catfile($dir, "real.txt");
  open my $fh, ">", $real or die "$real: $!";
  print $fh "x\n";
  close $fh;
  my $opened = eval { GD::Image->_make_filehandle($real) };
  ok $opened, "plain filename still opens as a file";
}

# 2-arg open() silently trimmed surrounding whitespace (including a trailing
# newline); 3-arg open treats the argument literally, so an un-chomped name no
# longer opens the trimmed file.
{
  my $real = File::Spec->catfile($dir, "plain.txt");
  open my $fh, ">", $real or die "$real: $!";
  print $fh "x\n";
  close $fh;
  my $padded = eval { GD::Image->_make_filehandle("$real\n") };
  ok !$padded, "trailing whitespace is significant (filename not trimmed)";
}

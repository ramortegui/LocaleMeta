#!perl -T

use strict;
use warnings;
use utf8;

use Test::More tests => 3;
use Locale::Meta;

my $lm = Locale::Meta->new();
ok($lm, 'Got a proper Meta structure');

my $structure = {
  "en" => {
    "greeting"   => {
      "trans" => "Hello",
       "meta" => {
          "test" => "meta hello"
      }
    }
  }
};

$lm->charge($structure);

is($lm->loc('greeting', 'en'), 'Hello', 'greeting -> en = Hello');

my $presumed_structure = {
  "greeting" => {
    "en" => "Hello",
    "meta" => {
      "test" => "meta hello"
    }
  }
};
is_deeply($lm->{locales},$presumed_structure, 'Test loadeded structure');

done_testing();

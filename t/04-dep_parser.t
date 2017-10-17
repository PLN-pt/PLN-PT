#!perl -T

use strict;
use warnings FATAL => 'all';

use Test::More tests => 5;
use PLN::PT;
use utf8;

my $nlp = PLN::PT->new('http://api.pln.pt');
my $data;

# dep_parser
SKIP: {
  $data = $nlp->dep_parser('A Maria tem razão .');
  skip 'No data.', 5 unless $data;

  ok( scalar(@$data) == 5, 'sentence has 5 tokens' );
  ok( $data->[0]->[6] eq '2', 'first token parent is "2"' );
  ok( $data->[0]->[7] eq 'det', 'first token rule is "det"' );
  ok( $data->[-1]->[6] eq '3', 'last token parent is "3"' );
  ok( $data->[-1]->[7] eq 'punct', 'last token rule is "punct"' );
}


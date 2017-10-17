#!perl -T

use strict;
use warnings FATAL => 'all';

use Test::More tests => 4;
use PLN::PT;
use utf8;

my $nlp = PLN::PT->new('http://api.pln.pt');
my $data;

# morph_analyzer
SKIP: {
  $data = $nlp->morph_analyzer('cavalgar');
  skip 'No data.', 4 unless $data;

  ok( scalar(@$data) == 6, 'word has 5 analysis' );
  ok( $data->[0] eq 'cavalgar', 'first token is analyzed word' );
  ok( $data->[1]{lemma} eq 'cavalgar', 'first analysis lemma' );
  ok( $data->[1]{analysis} =~ m!^V!, 'first analysis as a verb' );
}


#!perl -T

use strict;
use warnings FATAL => 'all';

use Test::More tests => 8;
use PLN::PT;

my $nlp = PLN::PT->new('http://api.pln.pt');

# tokenizer
my $data = $nlp->tokenizer('A Maria tem razão .');
ok( scalar(@$data) == 5, 'sentence has 5 tokens' );
ok( $data->[0] eq 'A', 'first token in "A"' );
ok( $data->[-1] eq '.', 'last token in "."' );

# tagger
$data = $nlp->tagger('A Maria tem razão .');
ok( scalar(@$data) == 5, 'sentence has 5 tokens' );
ok( $data->[0]->[1] eq 'o', 'first token lemma is "o"' );
ok( $data->[0]->[2] eq 'DA0FS0', 'first token tag is "DA0FS0"' );
ok( $data->[-1]->[1] eq '.', 'last token lemma is "."' );
ok( $data->[-1]->[2] eq 'Fp', 'last token tag is "Fp"' );


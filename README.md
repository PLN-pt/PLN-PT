# NAME

PLN::PT - interface for the http://pln.pt webservice

# VERSION

version 0.001

# SYNOPSIS

    # using as a lib
    my $pln = PLN::PT->new('http://api.pln.pt');
    my $data = $pln->tagger($txt);

    # using the pln-pt tool from the command line
    $ cat input.txt
    A Maria tem razão.
    $ pln-pt dep_parser input.txt
    1   A       _       DET     art|<artd>|F|S  Definite=Def|Gender=Fem|Number=Sing|PronType=Art|fPOS=DET++art|<artd>|F|S       2       det     _       _
    2   Maria   _       PROPN   prop|F|S        Gender=Fem|Number=Sing|fPOS=PROPN++prop|F|S     3       nsubj   _       _
    3   tem     _       VERB    v-fin|PR|3S|IND Mood=Ind|Number=Sing|Person=3|Tense=Pres|VerbForm=Fin|fPOS=VERB++v-fin|PR|3S|IND        0       ROOT    _       _
    4   razão.  _       NOUN    n|F|S   Gender=Fem|Number=Sing|fPOS=NOUN++n|F|Sdobj     _       _

# DESCRIPTION

This module implements an interface for the Natural Language Processing
(NLP) webservice provided by http://pln.pt.

# FUNCTIONS

## new

## new

## tokenizer

## tagger

## dep\_parser

# ACKNOWLEDGEMENTS

This work is partially supported by the "Programa Operacional da Região Norte", NORTE2020, in the context of project NORTE-01-0145-FEDER-000037.

# AUTHOR

Nuno Carvalho <smash@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2016 - 2017 by Nuno Carvalho.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

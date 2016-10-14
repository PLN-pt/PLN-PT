# NAME

PLN::PT - interface for the pln.pt webservice

# VERSION

version 0.001

# SYNOPSIS

    # using the pln tool from the command line
    $ cat input.txt
    A Maria tem razão.
    $ pln dep_parser input.txt
    1   A       _       DET     art|<artd>|F|S  Definite=Def|Gender=Fem|Number=Sing|PronType=Art|fPOS=DET++art|<artd>|F|S       2       det     _       _
    2   Maria   _       PROPN   prop|F|S        Gender=Fem|Number=Sing|fPOS=PROPN++prop|F|S     3       nsubj   _       _
    3   tem     _       VERB    v-fin|PR|3S|IND Mood=Ind|Number=Sing|Person=3|Tense=Pres|VerbForm=Fin|fPOS=VERB++v-fin|PR|3S|IND        0       ROOT    _       _
    4   razão.  _       NOUN    n|F|S   Gender=Fem|Number=Sing|fPOS=NOUN++n|F|Sdobj     _       _

# DESCRIPTION

This module implements an interface for the Natural Language Processing
(NLP) webservide provided by http://pln.pt.

# FUNCTIONS

## new

## new

## tokenizer

## tagger

## dep\_parser

# AUTHOR

Nuno Carvalho <smash@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2016 by Nuno Carvalho.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

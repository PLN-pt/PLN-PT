# NAME

PLN::PT - interface for the http://pln.pt web service

# VERSION

version 0.006

# SYNOPSIS

    # using as a lib
    my $pln = PLN::PT->new('http://api.pln.pt');
    my $data = $pln->tagger($txt);  # [['A','o',''DA0FS0','0.675415'], ...

    # using the pln-pt tool from the command line
    $ echo "A Maria tem razão . " | pln-pt tagger
    A o DA0FS0 0.675415
    Maria maria NCFS000 1
    tem ter VMIP3S0 0.999287
    razão razão NCFS000 0.65
    . . Fp 1

# DESCRIPTION

This module implements an interface for the Natural Language Processing
(NLP) web service provided by [http://pln.pt](http://pln.pt).

# METHODS

## new

Create new object, given as argument the base endpoint for the web service.

Once the object is created, a set of methods described below can be used to
access several operations in the API. All the methods return a data
structure with the corresponding result, typically a list of tokens with
some extra information depending on the operation used.

## tokenizer

Tokenize the text given as argument, i.e. split the text in tokens (words
by default), for more information on the tokenization operation
visit [http://pln.pt/api](http://pln.pt/api).

    $ echo "A Maria tem razão ." | pln-pt tokenizer
    A
    Maria
    tem
    razão
    .

## morph\_analyzer

Morphologic analysis for a single word, given as argument. For more
information on the tagging operation visit [http://pln.pt/api](http://pln.pt/api).

    $ echo cavalo | pln-pt morph
    cavalo cavalo NCMS000 0.914011 cavalar VMIP1S0 0.0859891

## tagger

Part-of-speech tagging the tokens in the text, given as argument, for more
information on the tagging operation visit [http://pln.pt/api](http://pln.pt/api).

    $ echo "A Maria tem razão ." | pln-pt tagger
    A o DA0FS0 0.675415
    Maria maria NCFS000 1
    tem ter VMIP3S0 0.999287
    razão razão NCFS000 0.65
    . . Fp 1

## dep\_parser

Build a dependency tree for the text given as argument, for more information
on the dependency tree visit [http://pln.pt/api](http://pln.pt/api).

    $ echo "A Maria tem razão ." | pln-pt dep_parser
    1   A       _       DET     art|<artd>|F|S  (...)   2       det     _       _
    2   Maria   _       PROPN   prop|F|S        (...)   3       nsubj   _       _
    3   tem     _       VERB    v-fin|PR|3S|IND (...)   0       ROOT    _       _
    4   razão   _       NOUN    n|F|S   (...)   3       dobj    _       _
    5   .       _       PUNCT   punc    (...)   3       punct   _

## tf

Compute term frequency given a text.

## stopwords

Retrieve lists of stop words.

# ACKNOWLEDGEMENTS

This work is partially supported by the project “SmartEGOV: Harnessing EGOV for Smart Governance (Foundations, methods, Tools) / NORTE-01-0145-FEDER-000037”,
supported by Norte Portugal Regional Operational Programme (NORTE 2020),
under the PORTUGAL 2020 Partnership Agreement, through the European Regional
Development Fund (EFDR).

# AUTHORS

- Nuno Carvalho <smash@cpan.org>
- Alberto Simões <ambs@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2016 - 2017 by Nuno Carvalho.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

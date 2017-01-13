package PLN::PT;
# ABSTRACT: interface for the pln.pt webservice

use strict;
use warnings;

use JSON::MaybeXS ();
use CHI;
use Digest::MD5 qw/md5_base64/;

sub new {
  my ($class, $url) = @_;
  my $self = bless( {url=>$url}, $class);

  $self->{cache} = CHI->new( driver => 'Memory', global => 1 );

  return $self;
}

sub tokenizer {
  my ($self, $text, $opts) = @_;

  my $url = $self->_cat('tokenizer');
  $url .= '?' . $self->_args($opts);

  return $self->_post($url, $text, $opts);
}

sub tagger {
  my ($self, $text, $opts) = @_;

  my $url = $self->_cat('tagger');
  $url .= '?' . $self->_args($opts);

  return $self->_post($url, $text, $opts);
}

sub dep_parser {
  my ($self, $text, $opts) = @_;

  my $url = $self->_cat('dep_parser');
  $url .= '?' . $self->_args($opts);

  return $self->_post($url, $text, $opts);
}

sub _post {
  my ($self, $url, $text, $opts) = @_;

  my $key = $url . '-' . md5_base64($text);
  my $data = $self->{cache}->get($key);

  unless ($data) {
    $data = `echo "$text" | /usr/bin/curl -s -X POST -d \@- $url`;
    $self->{cache}->set($key, $data);
  }

  return $data if ($opts->{output} and $opts->{output} eq 'raw');
  return JSON::MaybeXS->new(utf8 => 1)->decode($data);
}

sub _cat {
  my ($self, @args) = @_;

  my @parts = ($self->{url});
  push @parts, @args;

  return join('/', @parts);
}

sub _args {
  my ($self, $opts) = @_;

  my @args;
  foreach (keys %$opts) {
    push @args, join('=', $_, $opts->{$_});
  }

  return join('&', @args);
}

1;

__END__

=encoding UTF-8

=head1 SYNOPSIS

    # using the pln tool from the command line
    $ cat input.txt
    A Maria tem razão.
    $ pln dep_parser input.txt
    1	A	_	DET	art|<artd>|F|S	Definite=Def|Gender=Fem|Number=Sing|PronType=Art|fPOS=DET++art|<artd>|F|S	2	det	_	_
    2	Maria	_	PROPN	prop|F|S	Gender=Fem|Number=Sing|fPOS=PROPN++prop|F|S	3	nsubj	_	_
    3	tem	_	VERB	v-fin|PR|3S|IND	Mood=Ind|Number=Sing|Person=3|Tense=Pres|VerbForm=Fin|fPOS=VERB++v-fin|PR|3S|IND	0	ROOT	_	_
    4	razão.	_	NOUN	n|F|S	Gender=Fem|Number=Sing|fPOS=NOUN++n|F|Sdobj	_	_


=head1 DESCRIPTION

This module implements an interface for the Natural Language Processing
(NLP) webservide provided by http://pln.pt.

=func new

=func new

=func tokenizer

=func tagger

=func dep_parser



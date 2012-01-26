package EPublisher::Source::Base;

# ABSTRACT: Base class for Source plugins

use strict;
use warnings;
use Carp;

our $VERSION = 0.01;

sub new{
    my ($class,$args) = @_;
    
    my $self = bless {}, $class;
    $self->_config( $args );
    
    return $self;
}

sub _config{
    my ($self,$args) = @_;
    
    $self->{__config} = $args if defined $args;
    return $self->{__config};
}

sub publisher {
    my ($self,$object) = @_;
    
    return $self->{__publisher} if @_ != 2;
    
    $self->{__publisher} = $object;
}

1;


__END__
=pod

=head1 NAME

EPublisher::Source::Base - Base class for Source plugins

=head1 VERSION

version 0.4

=head1 SYNOPSIS

  package EPublisher::Source::Plugin::AnyVCS;
  use  EPublisher::Source::Base;
  
  our @ISA = qw(EPublisher::Source::Base);
  
  # ... more code ...

=head1 METHODS

=head2 new

=head2 publisher

=head2 _config

=head1 COPYRIGHT & LICENSE

Copyright 2010 Renee Baecker, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms of Artistic License 2.0.

=head1 AUTHOR

Renee Baecker (E<lt>module@renee-baecker.deE<gt>)

=head1 AUTHOR

Renee Baecker <module@renee-baecker.de>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Renee Baecker.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=cut


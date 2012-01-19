package EPublisher::Source::Plugin::File;

# ABSTRACT: File source plugin

use strict;
use warnings;

use EPublisher::Source::Base;
use EPublisher::Utils::PPI qw(extract_pod);

our @ISA = qw( EPublisher::Source::Base );

our $VERSION = 0.01;

sub load_source{
    my ($self) = @_;
    
    my $options = $self->_config;
    
    my $file = $options->{path};
    
    unless( $file && -f $file ) {
        $self->publisher->debug( "400: $file -> " . ( -f $file or 0 ) );
        return '';
    }
    
    return extract_pod( $file );
}

1;


__END__
=pod

=head1 NAME

EPublisher::Source::Plugin::File - File source plugin

=head1 VERSION

version 0.3

=head1 SYNOPSIS

  my $source_options = { type => 'File', path => '/var/lib/CGI.pm' };
  my $file_source    = EPublisher::Source->new( $source_options );
  my $pod            = $File_source->load_source;

=head1 METHODS

=head2 load_source

  my $pod = $file_source->load_source;

reads the File 

=head1 COPYRIGHT & LICENSE

Copyright 2010 Renee Baecker, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the terms of Artistic License 2.0.

=head1 AUTHOR

Renee Baecker (E<lt>File@renee-baecker.deE<gt>)

=head1 AUTHOR

Renee Baecker <module@renee-baecker.de>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Renee Baecker.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=cut

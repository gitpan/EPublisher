package EPublisher::Source::Plugin::Module;

# ABSTRACT:  Module source plugin

use strict;
use warnings;

use Module::Info;

use Data::Dumper;

use EPublisher::Source::Base;
use EPublisher::Utils::PPI qw(extract_pod);

our @ISA = qw( EPublisher::Source::Base );

our $VERSION = 0.01;

sub load_source{
    my ($self) = @_;
    
    my $options = $self->_config;
    
    return unless $options->{name};

    my @my_inc = @{ $options->{lib} || [] };
    
    my $mod = Module::Info->new_from_module( $options->{name}, @my_inc );
    
    return extract_pod( $mod->file );
}

1;


__END__
=pod

=head1 NAME

EPublisher::Source::Plugin::Module - Module source plugin

=head1 VERSION

version 0.3

=head1 SYNOPSIS

  my $source_options = { type => 'Module', name => 'CGI', lib => [qw(/lib)] };
  my $module_source  = EPublisher::Source->new( $source_options );
  my $pod            = $module_source->load_source;

=head1 METHODS

=head2 load_source

  my $pod = $module_source->load_source;

reads the module 

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

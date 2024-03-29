package Algorithm::Diff3::ListMixin;
use 5.006;
use strict;
use warnings;
our $VERSION = '0.05';

sub at {
    my( $self, $x ) = @_;
    $self->list->[ $x ];
}

sub push {
    my $self = CORE::shift;
    CORE::push @{ $self->list }, @_;
}

sub pop {
    my $self = CORE::shift;
    CORE::pop @{ $self->list };
}

sub unshift {
    my $self = CORE::shift;
    CORE::unshift @{ $self->list }, @_;
}

sub shift  {
    my $self = CORE::shift;
    CORE::shift @{ $self->list };
}

sub is_empty {
    my $self = CORE::shift;
    ! scalar( @{ $self->list } )
}

sub size {
    my $self = CORE::shift;
    scalar( @{ $self->list } )
}

sub first {
    my $self = CORE::shift;
    $self->list->[0]
}

sub last {
    my $self = CORE::shift;
    $self->list->[-1]
}

sub each {
    my( $self, $yield ) = @_;
    ref $yield eq 'CODE' or die "requires coderef";
    for ( my $i = 0; $i < @{ $self->list }; $i++ ) {
        $yield->( $self->list->[ $i ] );
    }
    $self;
}

1;

__END__

=head1 NAME

Algorithm::Diff3::ListMixin - mixin delegators to property `list'

=head1 SYNOPSIS

  package AnyList;
  use base qw( Algorithm::Diff3::ListMixin Algorithm::Diff3::Base );
  sub list { $_[0]->buffer }

  package AnyListUser;
  use SomeFactory;
  my $list = SomeFactory->new->create_anylist;
  $list->push( $x, $y );
  $x = $list->pop;
  $list->unshift( $x, $y );
  $x = $list->shift;
  until ( $list->is_empty ) {
     $x = $list->shift;
     $x = $list->first->foo;
     $y = $list->last->bar;
  }
  $list->size == 3 or die "excepts \$list->size == 3".
  $list->each(sub{
      my( $x ) = @_;
      print $x, "\n";
  });
  
=head1 ABSTRACT

This is a mixin class delived delegators to the list properties.

=head1 AUTHOR

MIZUTANI Tociyuki E<lt>tociyuki@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2005 MIZUTANI Tociyuki

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

=cut

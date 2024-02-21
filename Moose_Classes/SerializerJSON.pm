package SerializerJSON;

use Moose;
use JSON;

use feature qw( say signatures );
use namespace::autoclean; 

with 'SerializerAbstractClass';

has 'data' => (
    is  => 'ro',
    isa => 'HashRef'
);

sub serialize ( $self ) {
    return encode_json( $self->data );    
}

sub to_string ( $self ) {
    my $string_hash = {};

    my $attrs = $self->attributes();
    foreach my $attr ( @{ $attrs } ) {
        $string_hash->{ $attr } = $self->$attr;
    }

    return encode_json( $string_hash );
}

sub attributes ( $self ) {
    my $attrs = [];
    foreach my $attr ( $self->meta->get_all_attributes ) {
        push @{ $attrs }, $attr->name;
    }
    return $attrs;
}

__PACKAGE__->meta->make_immutable;
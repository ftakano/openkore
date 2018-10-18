package eventMacro::Condition::InInventoryID;

use strict;

use base 'eventMacro::Condition::BaseInInventory';

use eventMacro::Utilities qw( getInventoryAmountbyID );

sub _parse_syntax {
	my ( $self, $condition_code ) = @_;
	
	$self->{wanted} = undef;
	
	if ($condition_code =~ /^(\d+)\s+(\S.*)$/) {
		$self->{wanted} = $1;
		$condition_code = $2;
	} else {
		$self->{error} = "Item ID must and a numeric comparison must be given";
		return 0;
	}
	
	$self->SUPER::_parse_syntax($condition_code);
}

sub _get_val {
	my ( $self ) = @_;
	return getInventoryAmountbyID($self->{wanted});
}

sub usable {
	1;
}

1;

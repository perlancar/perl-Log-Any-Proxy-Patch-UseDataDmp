package Log::Any::Proxy::Patch::UseDataDmp;

# DATE
# VERSION

use 5.010001;
use strict;
no warnings;

use Module::Patch 0.12 qw();
use base qw(Module::Patch);

use Data::Dmp;

our %config;

sub patch_data {
    return {
        v => 3,
        patches => [
            {
                action => 'replace',
                #mod_version => qr/^1\.[01].+/,
                sub_name => '_dump_one_line',
                code => sub {
                    return dmp(shift);
                },
            },
        ],
    };
}

1;
# ABSTRACT: Use Data::Dmp to dump data structures

=for Pod::Coverage ^(patch_data)$

=head1 SYNOPSIS

 use Log::Any::Proxy::Patch::UseDataDmp;


=head1 DESCRIPTION

This patch replaces the dumping routine in L<Log::Any> from L<Data::Dumper> to
L<Data::Dmp>.


=head1 SEE ALSO

L<Data::Dmp>

=cut

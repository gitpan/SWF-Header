use strict;
use lib qw( ../lib );
use Test::More;

BEGIN {
    plan (tests => 14);
    use_ok('SWF::Header');
}

my $h = SWF::Header->new;
ok( $h, 'header object constructed' );

my $header = SWF::Header->read_file('./test/test.swf');
my $expected = {
    'version' => 6,
    'xmin' => 0,
    'filelen' => 11558,
    'ymax' => 1200,
    'width' => 468,
    'xmax' => 9360,
    'rate' => 24,
    'count' => 1,
    'duration' => 0.0416666666666667,
    'signature' => 'CWS',
    'ymin' => 0,
    'height' => 60,
};

for ( qw(signature version filelen count rate duration xmin xmax ymin ymax width height) ) {
    is($header->{$_}, $expected->{$_}, "$_ = $header->{$_}");
}

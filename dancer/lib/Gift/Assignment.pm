package Gift::Assignment;

use Dancer2;
use Dancer2::Plugin::OpenTelemetry;
use OpenTelemetry::Instrumentation 'HTTP::Tiny';

set serializer => 'JSON';

my $ua = HTTP::Tiny->new;

post '/gift/assign' => sub {
    my $id = body_parameters->get('id');
    my $res = $ua->get("$ENV{NAUGHT_OR_NOT_HOST}/is-naughty/$id");

    unless ( $res->{success} ) {
        status $res->{status};
        return { error => $res->{reason} };
    }

    my $body = decode_json $res->{content};
    return { gift => 'coal' } if $body->{naughty};

    my @wants = body_parameters->get_all('wants');
    { gift => $wants[ int rand @wants ] };
};

1;

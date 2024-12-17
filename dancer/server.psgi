#!/usr/bin/env perl

use strict;
use warnings;

use lib 'lib';
use Gift::Assignment;
use Log::Any::Adapter 'Stderr';
use OpenTelemetry::SDK;
use Plack::Builder;

builder {
    Gift::Assignment->psgi_app;
}

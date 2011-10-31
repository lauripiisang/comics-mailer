#!/usr/bin/perl -ws
use strict;

use lib '.';
use comic;
use plugin::postimees;
use plugin::cyanide;
use plugin::xkcd;
use plugin::simonscat;
use plugin::wulffmorgenthaler;

our ($debug, $date);
$debug = 1 if -t STDIN;

my $p = new comic();

$p->set_date($date) if $date;

$p->fetch_data;
$p->compose_mail;

if (@ARGV) {
	$p->mail_attach(@ARGV);
} else {
	$p->dump;
}

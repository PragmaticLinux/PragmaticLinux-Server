#!/usr/bin/perl
open(CONF, "/etc/webmin/web.conf/miniserv.conf") || die "Failed to open /etc/webmin/web.conf/miniserv.conf : $!";
while(<CONF>) {
        $root = $1 if (/^root=(.*)/);
        }
close(CONF);
$root || die "No root= line found in /etc/webmin/web.conf/miniserv.conf";
$ENV{'PERLLIB'} = "$root";
$ENV{'WEBMIN_CONFIG'} = "/etc/webmin/web.conf";
$ENV{'WEBMIN_VAR'} = "/var/webmin";
chdir("$root/system-status");
exec("$root/system-status/enable-collection.pl", @ARGV) || die "Failed to run $root/system-status/enable-collection.pl : $!";

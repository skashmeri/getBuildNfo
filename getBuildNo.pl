#!/usr/bin/env perl
use strict;
use warnings;

#ssh and get log info from jenkins into array:
my @build_nos = `ssh user@domain-or-ip "cat /var/log/jenkins/jenkins.log | grep 'build'"`;

#current build = last element
my $build_no = $build_nos[$#build_nos];
$build_no =~ s/ .*? (\#\d) .* /$1/gx;

#info to dump to text file
my $file_val = "Current Build Number: $build_no";

print "$file_val\n\n";

#delete the current text/conf file, create new file with latest build no
#remember php file has to be here as well...
my $filename = '/var/www/path/to/sumfile.conf';
if (-e $filename)
{
unlink $filename;
}

unless(open FILE, '>'.$filename){
        # Die with error message
        # if we can't open it.
        die "\nUnable to create $filename\n";
    }

print FILE $file_val;
close FILE;

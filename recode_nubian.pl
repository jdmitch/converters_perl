#!/usr/bin/perl -w

# recode_coptic.pl Version 1.2.0

# this assumes a UTF-8 file in one word per line format and 
# automatically converts Coptic encodings
# usage:
# recode_coptic.pl file
# See help (-h) for options

use Getopt::Std;
use utf8;
binmode(STDOUT, ":utf8");
binmode(STDIN);

my $usage;
{
$usage = <<"_USAGE_";
This script converts characters from one Coptic encoding to another.

Notes and assumptions:
- Supralinear strokes in Coptic font are supported
- Other decorations not yet supported

Usage:  recode_coptic.pl [options] <FILE>

Options and argument:

-h              print this message and quit
-f <format>     Specify the input format. Default is Coptic font, other options are "CopticLS", "CMCL", "NagHamadi", "avva_shenouda", "low" (converts all upper case utf8 Coptic to all lower case)

<FILE>    A text file with Coptic text in a supported encoding

Examples:

Read a file in Coptic font encoding and output standard Unicode as UTF-8:
  recode_coptic.pl in_Coptic.txt > out_utf8.txt

Read a file in CMCL encoding and output standard Unicode as UTF-8:
  recode_coptic.pl -f CMCL in_Coptic.txt > out_utf8.txt

  
Copyright 2013-2018, Amir Zeldes, Caroline T. Schroeder and So Miyagawa

This program is free software. You may copy or redistribute it under
the same terms as Perl itself.
_USAGE_
}

### OPTIONS BEGIN ###
%opts = ();
getopts('hf:',\%opts) or die $usage;

#help
if ($opts{h} || (@ARGV == 0)) {
    print $usage;
    exit;
}

#format
if (!($format = $opts{f})) 
    {$format = "Coptic";}
elsif($format eq "CopticLS")
	{$format="CopticLS"}
elsif($format eq "CMCL") 
	{$format="CMCL";}
elsif($format eq "NagHamadi") 
	{$format="NagHamadi";}
elsif($format eq "low") 
	{$format="low";}
elsif($format eq "avva_shenouda") 
	{$format="avva_shenouda";}
elsif($format eq "funk1") 
	{$format="funk1";}
elsif($format eq "marcion") 
	{$format="marcion";}
else {$format = "Coptic"}
### OPTIONS END ###

open FILE,"<:encoding(UTF-8)",shift or die "could not find input document";

while (<FILE>) {

    chomp;
    $line = $_;

	if ($format eq "Coptic")
	{
	#consonants (Replace various consonants and digraphs with IPA symbols)
	$line =~ s/a/ⲁ/g;
	$line =~ s/b/ⲃ/g;
	$line =~ s/th/ⲑ/g;
	$line =~ s/d/ⲇ/g;
	$line =~ s/e/ⲉ/g;
	$line =~ s/f/ⲫ/g;
	$line =~ s/g/ⲅ/g;
	$line =~ s/ē/ⲏ/g;
	$line =~ s/i/ⲓ/g;
	$line =~ s/j/ⳝ/g;
	$line =~ s/k/ⲕ/g;
	$line =~ s/l/ⲗ/g;
	$line =~ s/m/ⲙ/g;
	$line =~ s/n/ⲛ/g;
	$line =~ s/o/ⲟ/g;
	$line =~ s/b/ⲡ/g;
	$line =~ s/ch/ϭ/g;
	$line =~ s/r/ⲣ/g;
	$line =~ s/s/ⲥ/g;
	$line =~ s/t/ⲧ/g;
	$line =~ s/u/ⲩ/g;
	$line =~ s/f/ⲫ/g;
	$line =~ s/w/ⲱ/g;
	$line =~ s/h/ϩ/g;
	$line =~ s/kh/ⲭ/g;
	$line =~ s/z/ⲍ/g;
	$line =~ s/sh/ϣ/g;
	$line =~ s/ŋ/ⳟ/g;
	$line =~ s/ñ/ⳡ/g;
	$line =~ s/w/ⳣ/g;
	$line =~ s/\+/ϯ/g;

	#NB psi and xi in Coptic font are 2, 3
	#these numbers will be replaced
	$line =~ s/ps/ⲯ/g;
	$line =~ s/ks/ⲝ/g;

	#supralinear stroke represents geminated vowels
	$line =~ s/aa/ⲁ̄/g;
	$line =~ s/ee/ⲉ̄/g;
	$line =~ s/ii/ⲓ̄/g;
	$line =~ s/oo/ⲟ̄/g;
	$line =~ s/uu/ⲩ̄/g;


	#diacritics and strokes
	$line =~ s/±(.)=±(.)/︤$1︦$2︥/g;
	$line =~ s/±(.)/︤$1︥/g; #place binding supralinear strokes after each character
	$line =~ s/±/︤/g; 
	$line =~ s/†/<gap reason="illegible">…̣<\/gap>/g;	#gap symbol in Brakke transcriptions
	$line =~ s/=/̄/g; #equals sign after letter is a supralinear stroke
	$line =~ s/O/᷍/g;
	$line =~ s/P/̂/g;
	$line =~ s/\//̣/g;
	$line =~ s/Ú/̈/g;
	$line =~ s/A/ⲏ̂/g;
	$line =~ s/E/ⲉ̄/g;
	$line =~ s/I/ⲓ̄/g;
	$line =~ s/M/ⲛ̀/g;
	$line =~ s/N/ⲛ̄/g;
	$line =~ s/S/ⲏ⳰/g;
	$line =~ s/U/ⲩ̄/g;


	}
	print $line ."\n";
}


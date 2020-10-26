#!/bin/perl
open( TEMPLATE, "template.apib" ) or die "File not exist!\n"; #open template.apib file
open( OUTPUT, ">apiary-test.apib" ) or die "Cant create file!\n"; #create apiary-test.apib file
while ( $line = <TEMPLATE> ) { #read line by line template file
    if ( $line =~ m/^ +\[(.+).*\].*/ ) { #check if $line match with regex
        chomp($line); #delete line break in $line
        print OUTPUT insertSchema($line); #check the name of the file and replace the content
    } else { #line no match with the regex and paste content of template.apib in apiary.apib
        chomp($line);
        print OUTPUT $line;
        print OUTPUT "\n";
    }
}
close TEMPLATE; #close files
close OUTPUT;

sub insertSchema {
    my $fileName = $_[0]; #read parameter
    my $tab = "                ";
    my $contenido;
    my $initialPosition = index($fileName, "[") + 1;
    my $finalPosition = index($fileName, "]");
    my $lenght = $finalPosition - $initialPosition;
    my $fileNameClean = substr($fileName, $initialPosition, $lenght); #extract the name of the file
    print "FileName: " . $fileNameClean . "\n";
    open( SCHEMA, "api/" . $fileNameClean ) or die "File '" . $fileName . "' not found\n"; #open file that match with $fileName
    while ( <SCHEMA> ) { #read line by line and paste in $content
        $contenido =  $contenido . $tab . $_; 
    }
    close SCHEMA; #close file
    return $contenido; #return string with content of $fileName
}

use feature 'say';

my $fileToRead = shift;
my $fileToWrite = shift;

sub trim {
    my $string = shift;
    return $string =~ s/^\s+|\s+$//gr;
}

open(my $filehandle, '<', $fileToRead) or die "Cannot open file: $!";

my $insideTag = 0;
my @lines;
while (my $line = <$filehandle>) {
    chomp $line;

    $line = trim($line);

    if ($line =~ /<yorklyn>/) {
        $insideTag = 1;
    } elsif ($line =~ /<\/yorklyn>/) {
        $insideTag = 0;
    } elsif ($insideTag) {
        my $transformed_line = $line . "<br>\n";
        push @lines, $transformed_line;
    } else {
        push @lines, $line . "\n";
    }
}

close $filehandle;

my $dataLeaving = join " ", @lines;

my $opening_boilerplate = <<END;
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Title Here</title>

    <link rel="stylesheet" href="">
    <link rel="icon" type="image/png" href="">
</head>
<body>
END

my $closing_boilerplate = <<END;
</body>
</html>
END

$dataLeaving = $opening_boilerplate . $dataLeaving . $closing_boilerplate;

open(my $filehandle, '>', $fileToWrite) or die "Could not open file: $!";

print $filehandle $dataLeaving;

close $filehandle;

say "Successfully transpiled your file into " . $fileToWrite;

use strict;
use utf8;

# input format will be:
# start=1057.8s stop=1063.7s speaker_SPEAKER_01

my $linum = 0;
while (defined(my $line = <>)) {
    if ($linum == 0) {
        $line =~ s/^start=(.*)s stop=(.*)s speaker_(.*)$/drawtext=fontsize=60:fontcolor=white:x=0:y=0:text='\3':enable='between(t,\1,\2)'/g;
    } else {
        $line =~ s/^start=(.*)s stop=(.*)s speaker_(.*)$/,drawtext=fontsize=60:fontcolor=white:x=0:y=0:text='\3':enable='between(t,\1,\2)'/g;
    }
    print $line;
    $linum++;
}

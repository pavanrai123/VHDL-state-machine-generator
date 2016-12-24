#-------------------------------------------------------------------------------------------------
#
# State machine generator:-
#
*no-control signal
#
*can be used for generating RTL code for counter
#
*with flexibility of N no states and N number of output bits
#-------------------------------------------------------------------------------------------------
#
#
Authors:Pavan Rai, Yogish
#
subject:Application Lab
#
course :M.tech
#
Branch:VLSI and Embedded system design
#
Institution:NMAMIT,Nitte
#
Rev 0.1, may 10 , 2014
#
#-------------------------------------------------------------------------------------------------
#
input parameter:
#
*no of output bits(counter bit length)
#
*no of states in state machine
#
*values of output at different states
#
#
output from script:
#
*RTL code generated
#
*which can simulated using any VHDL simulator
#-------------------------------------------------------------------------------------------------
#!/usr/bin/perl
my $file = $ARGV[0];
# check to see if the user entered a file name.
die "syntax: [perl] vhdl_mod.pl new_file.vhd\n" if ( $file eq "" );
# check to make sure that the file doesn't exist.
die "Oops! A file called '$file' already exists.\n" if -e $file;
#number of bits to represent output bit
printf "----------enter the number of bits in output----------\n";
our $range = <STDIN>;
chop($range);
#number of states in the state machine
print "----------enter the number of states in the state machine ----------\n";
my $no_states = <STDIN>;
chop($no_states);
#enter the different state values
print "----------enter different state values----------\n";
our @array;
for ( my $count_val = 0 ; $count_val < $no_states ; $count_val++ ) {
$array[$count_val] = <STDIN>;
chop( $array[$count_val] );
}
open( our $inF, ">", $file );
# Strip the .vhd from the file name and use for the module name:
$file =~ s/\.vhd$//;
# Make Date int MM/DD/YYYY
my $year = 0;
my $month = 0;
my $day = 0;
( $day, $month, $year ) = (localtime)[ 3, 4, 5 ];
# Grab username from PC:
my $author = "$^O user";
if ( $^O =~ /mswin/i ) {
$author = $ENV{USERNAME} if defined $ENV{USERNAME};
}
else {
$author = getlogin();
}
#Module Template:
printf( $inF
"-------------------------------------------------------------------------------\n"
);
printf( $inF
"--
Revision: 1.1 \n"
);
printf( $inF
"--
Date: %02d/%02d/%04d \n",
$month + 1, $day, $year + 1900 );
printf( $inF
"-------------------------------------------------------------------------------\n"
);
printf( $inF "--\n" );
printf( $inF "-- File name : $file.vhd\n" );
printf( $inF "-- Title : adder\n" );
printf( $inF "-- Module : $file\n" );
#number of bits to represent output bit
printf "----------enter the number of bits in output----------\n";
our $range = <STDIN>;
chop($range);
#number of states in the state machine
print "----------enter the number of states in the state machine ----------\n";
my $no_states = <STDIN>;
chop($no_states);
#enter the different state values
print "----------enter different state values----------\n";
our @array;
for ( my $count_val = 0 ; $count_val < $no_states ; $count_val++ ) {
$array[$count_val] = <STDIN>;
chop( $array[$count_val] );
}
open( our $inF, ">", $file );
# Strip the .vhd from the file name and use for the module name:
$file =~ s/\.vhd$//;
# Make Date int MM/DD/YYYY
my $year = 0;
my $month = 0;
my $day = 0;
( $day, $month, $year ) = (localtime)[ 3, 4, 5 ];
# Grab username from PC:
my $author = "$^O user";
if ( $^O =~ /mswin/i ) {
$author = $ENV{USERNAME} if defined $ENV{USERNAME};
}
else {
$author = getlogin();
}
#Module Template:
printf( $inF
"-------------------------------------------------------------------------------\n"
);
printf( $inF
"--
Revision: 1.1 \n"
);
printf( $inF
"--
Date: %02d/%02d/%04d \n",
$month + 1, $day, $year + 1900 );
printf( $inF
"-------------------------------------------------------------------------------\n"
);
printf( $inF "--\n" );
printf( $inF "-- File name : $file.vhd\n" );
printf( $inF "-- Title : adder\n" );
printf( $inF "-- Module : $file\n" );
printf( $inF
"\tsignal pr_state ,nx_state:state ;
);
printf( $inF "\n" );
printf( $inF "begin\n" );
printf( $inF "\n" );
-- signal to store temprory variable \n"
#printing the first process part here
printf( $inF "-- Insert Processes and code here.\n" );
printf( $inF "\tprocess(reset,clock) \n" );
printf( $inF "begin\n" );
printf( $inF "\tif (reset='1') then \n" );
printf( $inF "\t\tpr_state<=state0; \n" );
printf( $inF "\telsif (clock'event and clock='1') then \n" );
printf( $inF "\t\t pr_state<=nx_state; \n" );
printf( $inF "\tend if; \n" );
printf( $inF "end process;\n" );
#printing the second process part here
printf( $inF "\tprocess(pr_state)\n" );
printf( $inF "begin\n" );
printf( $inF "\t\tcase pr_state is \n" );
#printing the different cases when statements repeatively using for loop
for ( my $count_case = 0 ; $count_case < $no_states ; $count_case++ ) {
printf( $inF "\t\twhen state$count_case => \n" );
printf( $inF "\t\t\tcount<=\"$array[$count_case]\";\n" );
my $k = ( $count_case + 1 ) % ($no_states);
printf( $inF "\t\t\tnx_state<=state$k;\n" );
}
printf( $inF "end case;\n" );
printf( $inF "end process; \n" );
printf( $inF "\n" );
printf( $inF "end behave; -- architecture\n" );
#closing the file after completing the printing task
close(inF);
print("\nThe script has finished successfully! You can now use $file.vhd.\n\n");


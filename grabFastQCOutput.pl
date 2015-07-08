#!/usr/bin/perl

# Prints to stdout only one section of the FastQC output text file.  Requires at least the first argument, which is the FastQC output file path.  The optional second argument is an integer from 0-10 which repres
ents the section to be used.  If it is not given, the user will be prompted for a section

my $FastQCOutputFile = $ARGV[0];
chomp($FastQCOutputFile);

my @Section = ("Basic Statistics","Per base sequence quality","Per sequence quality scores","Per base sequence content","Per sequence GC content","Per base N content","Sequence Length Distribution","Sequence Duplication Levels","Overrepresented sequences","Adapter Content","Kmer Content");

my $SectionChoice = $ARGV[1];
if ($SectionChoice eq "") {
print "What section do you want from the FastQC output file? (Type the number)\n[0] Basic Statistics\n[1] Per base sequence quality\n[2] Per sequence quality scores\n[3] Per base sequence content\n[4] Per sequence GC content\n[5] Per base N content\n[6] Sequence Length Distribution\n[7] Sequence Duplication Levels\n[8] Overrepresented sequences\n[9] Adapter Content\n[10] Kmer Content\n";

my $SectionChoice = <STDIN>;
chomp $SectionChoice;
}
print "$SectionChoice\n";

open my $FASTQC_FH, '<', $FastQCOutputFile or die "Can't open '$FastQCOutputFile'";

while (<$FASTQC_FH>) {
        if (/>>$Section[$SectionChoice]/../>>END_MODULE/) {
                next if />>$Section[$SectionChoice]/ || />>END_MODULE/;
                print;
        }
}

close $FASTQC_FH;

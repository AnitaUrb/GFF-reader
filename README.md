# Gff-reader

Introduction:

On flybase servers [ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/](ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/)
there is a list of fruit fly genome annotations. The directory structure is as follows:
*Version / filetype / files_describing_chromosomes*

The task was to write a script called gffreader.sh in bash, which downloads and extracts files from a specific version, in a specific format and
for a specific chromosome. 

Eg.
call:~$ *gffreader.sh -t gff -v dmel_r5.21_FB2009_08 -c 2L*

should cause the file to be downloaded:

ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/dmel_r5.21_FB2009_08/gff/dmel-2L-r5.21.gff.gz

Options to implement: -h, -t, -c, -v.
The script should write help (usage) after using the -h option or no parameters. 

Additionalyy find out what information is stored in this file and implement in script 3 interesting statistics available through the new options, as 
.gff files describe important genome features. 


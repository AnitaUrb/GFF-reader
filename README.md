# Gff-reader

Introduction:

On flybase servers [ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/](ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/)
there is a list of fruit fly genome annotations. The directory structure is as follows:
*Version / filetype / files_describing_chromosomes*

The task was to write a script called gffreader.sh in bash, which downloads and extracts files from a specific version, in a specific format and
for a specific chromosome by retrieving  options from user (or after using the -h option or no parameters script should write help). 
As .gff files describe important genome features, additionaly find out what information is stored in this file and implement in script 3 interesting statistics available through new options. 

Eg.<br />
call:~$ *gffreader.sh -t gff -v dmel_r5.21_FB2009_08 -c 2L*

should cause the file to be downloaded:

ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/dmel_r5.21_FB2009_08/gff/dmel-2L-r5.21.gff.gz

To start:

```call:~$ *gffreader.sh -t format -v file -c chromosome -d -l -s*```

 - -h print help (usage)
 - -t specify data format, eg. gff
 - -v specify file, eg. dmel_r5.21_FB2009_08
 - -c specify chromosome, eg. 2L*
 - -d print  chromosome length (additional)
 - -l print total number of genes (additional)
 - -s print average gene length (additional)
 
All mandatory options above must be specified, otherwise an appropriate message will be displayed.

#!/bin/bash

function Usage()
{
cat <<EOF
Usage: $0 [-h] [-t <format>] [-v <file>] [-c <chromosome>] [-d] [-l] [-s]:
 -h help
 -t data format 
 -v file
 -c chromosome
 -d chromosome length
 -l total number of genes
 -s average gene length
EOF
}

while getopts ":h:t:v:c:dls" o; do
    case "${o}" in 
        h)
            Usage
            ;;

        t)
	    HTHT=1
            t=${OPTARG}
	    ;;
        v)
	    VTVT=1
            v=${OPTARG}
            ;;
        c)
	    CTCT=1
            c=${OPTARG}
            ;;

	d)
	    DTDT=1
	    ;;
	
	l)
	    LTLT=1
	    ;;

	s) 
	    STST=1
	    ;;
       *)
            Usage
            ;;

    esac
done

shift $((OPTIND-1))

if [ "$HTHT" = 1 ]
then
	echo "t = ${t}"
else
	echo "no -t argument, can't do"
        exit 0
fi

if [ "$VTVT" = 1 ]
then
	echo "v = ${v}"
else
	echo "no -v argument, can't"
        exit 1
fi

if [ "$CTCT" = 1 ]
then
	echo "c = ${c}"
else
	echo "no -c argument, can't"
        exit 1
fi

beginning=ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/
center=$beginning${v}/${t}/
almost_end=$(echo ${v/_/-${c}-})
end=$(echo ${almost_end%%_*})
filename=$end.${t}
link=$center$end.${t}.gz
echo "Downloading:"
wget -nc -o Messages.txt -O $filename.gz $link
echo "ended.
Download messages are in the "Messages.txt" file."     

# keep both
echo "Your data from $link
is in $filename.gz and unpacked into $filename."
gunzip -k $filename.gz

if [ "$DTDT" = 1 ]
then
        echo "Chromosome length "${c}":"
        awk 'FNR==2' $filename | awk '{print $4-$3}'
fi

if [ "$LTLT" = 1 ]
then
        echo "Total number of genes:"
        awk '{if ($3=="gene") x += 1;}END{print x}' $filename
fi

if [ "$STST" = 1 ]
then
        echo "Average gene length:"
        cat $filename | grep -v "##" | awk '{if ($3 == "gene") {x += $5-$4; n += 1}}END{print x/n}'
fi

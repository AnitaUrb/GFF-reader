function Usage()
{
cat <<EOF
Usage: $0 [-h] [-t] [-c] [-v] [-c prefix] files...
 -t format
 -c chromosom
 -v plik
 -h pomoc
EOF
#wget -O mucha.txt ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/ 
} 
 
# Jesli nie podano argumentow wypisz Usage
# 
if [ "$*" = "" ]
then
    Usage 
    # Zwroc kod bledu
    exit 20
fi

$path = ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/opcja_v/opcja_t/opcja_c

# Przygotowanie do pobierania opcji 
#
# Inne alternatywne polecenie do pobierania opcji to getopts
#
set -- `getopt hwr:c:u $*`
 
echo $*
 
while [ "$1" != -- ]
do
    case $1 in
        -h)   echo COS; HFLG=1;;
        -t)   PREFIX=$2; shift;;
    -v)   RPREFIX=$2; shift;; 
    -c)   CPREFIX=$2; shift;; 
    esac
    shift   # nastepna opcja
done
 
echo $*
shift   # pomin  --
 
if [ "$HFLG" = 1 ] 
then
    Usage 
    exit 0
fi
 
echo Pliki do przetworzenia: $*
 
# wypisz zawartosc plikow
 
if [ "$WFLG" = 1 ] 
then
 
    # klazula <in $*> ponizej jest opcjonalna, patrz kolejne if-y
    for i in $*
    do  
    echo "======" "======"  $i "======" "======"
    cat $i
    echo "======" "======" Koniec $i "======" "======"
    done
fi
 
# zmien nazwy 
 
if [ "$RPREFIX" ] 
then
  for i 
  do
      DEST=`dirname $i`/$RPREFIX`basename $i`
      if mv $i $DEST 
      then
      echo Plik $i zmieniony na $DEST
      else
      echo Nie zmienilem nazwy $i
      exit 14
      fi
  done
fi
 
# kopiuj pliki ze zmiana nazwy 
 
if [ "$CPREFIX" ] 
then
  for i 
  do
      DEST=`dirname $i`/$CPREFIX`basename $i`
      if cp $i $DEST ; then
      echo Plik $i skopiowany na $DEST
      else
      echo Nie skopiowalem $i
      exit 15
      fi
  done
fi
 
# usun pliki
 
if [ "$UFLG" = 1 ] 
then
  for i 
  do
      if rm $i 
      then
      echo Plik $i usuniety
      else
      echo Nie usunalem $i
      exit 16
      fi
  done
fi

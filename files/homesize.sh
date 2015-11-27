cd ~

oldIFS=$IFS # string separator
IFS=$(echo -en "\n\b")
for i in $(ls -a --color=never)
do
    if [[ $i != "." && $i != ".." && $i != ".snapshot" ]]
    then
        du -sh $i | grep "G\|M"
    fi
done
IFS=oldIFS

set -e
cd ~/trash/

OLD_IFS="$IFS"
IFS=$'\n'
for i in $(ls -A)
do
    trash-put "$i"
done
IFS="$OLD_IFS"

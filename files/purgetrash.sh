set -e
cd ~/trash/
if [ "$(ls -A)" ]
then
    # directory not empty
    trash-put $(ls -A)
fi

ROOT_DIR=~/Documents/git/

for i in $(find -L $ROOT_DIR -name .git)
do
    cd $(dirname $i)
    pwd
    git rpupdate
done

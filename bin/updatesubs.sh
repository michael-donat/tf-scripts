#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

SOURCE=$DIR/../lib/vendor/dhogrin/raw/listy
DESTINATION=$DIR/../data/db/lists/source
RESULT=$DIR/../data/db/lists

cp $SOURCE/MCLista $DESTINATION/MC.db
cp $SOURCE/SCLista $DESTINATION/SC.db
cp $SOURCE/OKLista $DESTINATION/OK.db
cp $SOURCE/WRLista $DESTINATION/WR.db

$DIR/buildsubs.py --source=$DESTINATION --destination=$RESULT
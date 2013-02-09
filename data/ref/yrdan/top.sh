; ## Linie dodane automagicznie   : tf_ver=1.0.4
; ## 
; ## Wersja pliku                 : 1.0.4
; ## Ostatnia zmiana pliku        : 2004-05-22 12:46:50
; ## Plik pobrany                 : 2004-05-22 14:52:29
; ## 
; ##


#!/bin/sh

#TF_PID="$1"
#TMP="TF_PID_$1"

#if [ "$2" = stop ] && [ "${!TMP}" != "" ] ; then
#    echo ${!TMP}
#    kill -15 "${!TMP}"
#    rm tf_top_$1
#    unset ${TMP}
#    echo 1
#elif [ "$2" != stop ] && [ -z ${!TMP} ] ; then
#    top d30 b p$1 > tf_top_$1 &
#    echo $!
#    declare -x ${TMP}="$!"
#    echo $TF_PID_$1
#    export TF_PID_$1
#    echo 2
#fi

#    echo "Przechodze do TOP 2"

#    /bin/bash ./top2.sh $1 &

#    echo powinno wyjsc    exit 1
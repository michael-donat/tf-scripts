; ## Linie dodane automagicznie   : tf_ver=1.0.4
; ## 
; ## Wersja pliku                 : 1.0.4
; ## Ostatnia zmiana pliku        : 2004-05-22 12:46:51
; ## Plik pobrany                 : 2004-05-22 14:52:29
; ## 
; ##


#!/bin/sh
TMP="TF_PID_$1"
TF_PS=`ps --no-heading $1`
while [ "$TF_PS" != "" ] && [ "${!TMP}" != "" ] ; do
    TF_PS=`ps --no-heading $1`
#    echo $TF_PS - ${!TMP}    
    sleep 30
done

if [ "${!TMP}" != "" ] ; then
    echo ${!TMP}
    kill -15 "${!TMP}"
    rm tf_top_$1
    unset ${TMP}
#echo 1;
fi


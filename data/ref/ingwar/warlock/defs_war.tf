; Automagicly added line: tf_ver=1.0.0
;------------------------------------------------------------------------------
;|                           System i inne takie                              |
;------------------------------------------------------------------------------
/undef ping
/def ping = \
    /sys ping -i2 -c5 warlock.zdz.krakow.pl

/undef tfver
/def tfver = \
    /_echo%;\
    /echo -p -aCgreen Tiny Fugue Script for @{B}Warlock @{n}version @{n}%{tf_version}%;\
    /echo -p -aCgreen Powered by @{n}Ingwar Swenson%;\
    /_echo %;\
    /echo -p -aCgreen Ta wersja jest obcieta wersja przeznaczona do rozpowszechniania publicznego.%;\
    /echo -p -aCgreen Z tego powodu moze zawierac mase bledow i niedociagniec.%;\
    /_echo %;\
    /echo -p -aCgreen Wpisz "@{B}/pomoc@{n}" lub wcisnij "@{B}F1@{n}" azeby uzyskac @{BCwhite}Pomoc@{nCgreen}!



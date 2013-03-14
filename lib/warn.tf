/def warn = \
    /test $[getopts("s#c:", "")]%;\
    /beep%;\
    /set msg=$[toupper({*})]%;\
    /echo -p @{Cbgrgb330}$[strrep("-", 80)]%;\
    /echo -p @{Cbgrgb320}$[strrep("-", 80)]%;\
    /echo -p @{Cbgrgb310}$[strrep("-", 80)]%;\
    /echo -p @{Cbgrgb300}$[pad(pad({opt_c}, 50), -79)].%;\
    /echo -p @{Cbgrgb300}$[pad(pad({msg}, 50), -79)].%;\
    /echo -p @{Cbgrgb300}$[pad(pad({opt_c}, 50), -79)].%;\
    /echo -p @{Cbgrgb310}$[strrep("-", 80)]%;\
    /echo -p @{Cbgrgb320}$[strrep("-", 80)]%;\
    /echo -p @{Cbgrgb330}$[strrep("-", 80)]

/def -ag -t'* rozpada sie!' _warn_trigger_1 = /warn %{*}
/def -ag -t'* peka!*' _warn_trigger_2 = /warn %{*}
/def -ag -t'Uderzenie jest tak silne, ze bezwiednie puszczasz *' _warn_trigger_3 = /warn %{*}

/def -ag -t'Gubisz gdzies za soba *' zgubiony = /warn %{*}


/def -p999999 -t'* przymierza sie do odciecia ci drogi ucieczki.' _warn_trigger_4 = /warn -c'BLOK      BLOK     BLOK' %{*}


; ## Linie dodane automagicznie   : tf_ver=1.0.2
; ## 
; ## Wersja pliku                 : 1.0.2
; ## Ostatnia zmiana pliku        : 2009-01-06 21:07:41
; ## Plik pobrany                 : 2009-01-06 21:08:12
; ## Wersja Tfupdate              : 2.0.1
; ##
; ##
;**************************************************************************************
;					MAPPER
;**************************************************************************************


/def mapper = \
    /if ({*}=~"off") \
        /purge _mapper_* %;\
        /purge map_* %;\
        /fg -> %;\
        /dc mapa %;\
        /fg -> %;\
        /rstart -1 1 /unworld mapa %;\
        /return %;\
    /endif %;\
    /if (!getopts("m:l:s#", "")) /return 0%; /endif %;\
    /if (!{#}) \
        /msg Usage: /mapper -m<map> -l<location> -s<size> <IP_adress> %;\
        /msg More: /pomoc mapper %;\
        /return %;\
    /endif %;\
    /let _IP=%{*} %;\
    /let _map=%{opt_m} %;\
    /let _location=%{opt_l} %;\
    /let _size=%{opt_s} %;\
    /if ({_map} =~ NULL) \
        /if ({ogolne_mapper_map} =~ NULL) \
            /msg W zaden sposob nie zdefiniowales mapy %;\
            /return %;\
        /else \
            /let _map=%{ogolne_mapper_map} %;\
        /endif %;\
    /endif %;\
    /if ({_location} =~ NULL) \
        /if ({ogolne_mapper_location} =~ NULL) \
            /msg W zaden sposob nie zdefiniowales poczatkowej lokacji %;\
            /return %;\
        /else \
            /let _location=%{ogolne_mapper_location} %;\
        /endif %;\
    /endif %;\
    /if ({_size} =~ NULL) \
        /if ({ogolne_mapper_size} =~ NULL) \
            /msg W zaden sposob nie zdefiniowales wielkosci mapy %;\
            /return %;\
        /else \
            /let _size=%{ogolne_mapper_size} %;\
        /endif %;\
    /endif %;\
    /addworld mapa %{_IP} 2300 %;\
    /connect -b mapa %;\
    /load -q mapik.tf %;\
    /map_send set map dep %{_size} %;\
    /map_load %{_map} %;\
    /map_postaw %{_location} 

/def map_define_map = \
    /if (!{#}) \
        /msg Usage: /map_define_map <map> %;\
        /return %;\
    /endif %;\
    /set ogolne_mapper_map %{*} %;\
    /msg Bede ladowal @{B}%{*}@{n}

/def map_define_location = \
    /if (!{#}) \
        /msg Usage: /map_define_location <location> %;\
        /return %;\
    /endif %;\
    /set ogolne_mapper_location %{*} %;\
    /msg Bede ustawial na/w: @{B}%{*}@{n}

/def map_define_size = \
    /if (!{#}) \
        /msg Usage: /map_define_size <size> %;\
        /return %;\
    /endif %;\
    /set ogolne_mapper_size %{*} %;\
    /msg Wielkosc widocznej mapy to: @{B}%{*}@{n} lokacji wokolo.




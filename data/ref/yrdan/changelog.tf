; ## Linie dodane automagicznie   : tf_ver=1.0.5
; ## 
; ## Wersja pliku                 : 1.0.5
; ## Ostatnia zmiana pliku        : 2005-07-01 16:27:03
; ## Plik pobrany                 : 2005-07-01 16:27:09
; ## Wersja Tfupdate              : 2.0.0 alfa 3
; ##
; ##


; Hmm to bedzie tool do historii... i juz nawet dziala..

/def changelog = \
    /if ({*}=~NULL | {*}=~'wysiwetl') \
      /_changelog_wyswietl %;\
    /elseif ({*}=/'{wszystko|all}') \
      /_changelog_wyswietl all %;\
    /elseif ({*}=/'{czysc|wyczysc|clear|zaznacz}') \
      /_changelog_ustaw %;\
    /else \
      /echo Uzycie: /changelog [czysc|wyswietl] %;\
    /endif

/def _changelog_sprawdz = \
    /quote -S /_changelog_sprawdz2 'changelog.txt %;\
    /if ({_change_ready}==1) \
      /echo +$[strrep('-',columns()-2)] %;\
      /echo -p | Od twojego ostatniego uzywania @{B}tf@{n}-a zmienila sie zawartosc twoich skryptow!!! %;\
      /echo -p | Zeby zobaczyc zmiany wpisz @{B}"/changelog"@{n}%;\
      /echo -p | Zeby nieogloadac tego wpisz @{B}"/changelog czysc"@{n}%;\
      /echo +$[strrep('-',columns()-2)] %;\
      /unset _change_ready %;\
    /endif

/def _changelog_sprawdz2 = \
    /if ({1}=~"#") \
      /let _change=$[{2} - $(/time %%Y:%%m:%%d)] %;\
      /let _change=$[{2} - {ogolne_changelog}] %;\
      /if ({_change}>0) \
        /set _change_ready=1 %;\
      /endif %;\
    /endif

/def _changelog_wyswietl = \
    /if ({*}=~'all') \
      /set _change_ready=1 %;\
    /endif %;\
    /echo +$[strrep('-',columns()-2)] %;\
    /quote -S /_changelog_wyswietl2 'changelog.txt %;\
    /echo +$[strrep('-',columns()-2)] %;\
    /unset _change_ready

/def _changelog_wyswietl2 = \
    /if ({1}!~"#" & {_change_ready}==1 & {*}!~NULL) \
      /echo -p -- %{*} %;\
    /elseif ({1}=~"#") \
      /let _change=$[{2} - {ogolne_changelog}] %;\
      /if ({_change}>0 | {_change_ready}==1) \
        /set _change_ready=1 %;\
        /echo -p -- |@{B}>@{n} Dnia @{B}%{2} %;\
      /endif %;\
    /endif

/def _changelog_ustaw = \
    /set ogolne_changelog=$[ftime("%Y:%m:%d",time())] %;\
    /echo Zaznaczam ze przeczytales changeloga... chociaz osobiscie w to watpie...



; ## Linie dodane automagicznie   : tf_ver=1.0.4
; ## 
; ## Wersja pliku                 : 1.0.4
; ## Ostatnia zmiana pliku        : 2004-05-22 12:46:52
; ## Plik pobrany                 : 2004-05-22 14:52:29
; ## 
; ##



/def _drzwiczki_ustaw = \
    /if ({1} == 1) \
	/let ktore=pierwsze %;\
    /elseif ({1} == 2) \
	/let ktore=drugie %;\
    /elseif ({1} == 3) \
	/let ktore=trzecie %;\
    /elseif ({1} == 4) \
	/let ktore=czwarte %;\
    /endif %;\
    /echo ustaw %{ktore} pokretlo na %{2} %;\
    /if ({1} == 4) \
	/echo otworz drzwiczki %;\
    /endif

/def drzwiczki = \
    /for i 0 31 \
	/echo %%{i} %%;\
	/_drzwiczki_ustaw 1 $$[mod({i}, 16)/8] %%;\
	/_drzwiczki_ustaw 2 $$[mod({i}, 8)/4] %%;\
	/_drzwiczki_ustaw 3 $$[mod({i}, 4)/2] %%;\
	/_drzwiczki_ustaw 4 $$[mod({i}, 2)]


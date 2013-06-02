INSTRUKCJA
==========

**Uwaga: Config jest pisany pod straznika!**

###Exp###

Wszelkie aliasy pomocnicze umieszcozne sa w pliku combat/exp.tf i uaktywnia sie je albo triggeren na lokacji albo poprzez nastepujace defy

```
/mahak
/redcapy
/ruiny 
/lorenzo
/orson
/grzyby
/kurhan
/mustafa
/karawana
```

Ustawienia te podpinaja nazwy przeciwnikow  wkolejnosci do bicia pod sekwencje /1, /2, /3 etc

pozniej przykladowe wywolanie /mahak

```
ustawiono expowisko na MAHAKAM
% 3500: /def 1 = /zabij oficera
% 3501: /def 2 = /zabij kobolda
% 3502: /def 3 = /zabij goblina
% 3503: /def 4 = /zabij pukacza
% 3504: /def 5 = /zabij trolla
% 3505: /def 6 = /zabij echinopsa
% 3506: /def 7 = /zabij barbegazi
% 3507: /def 8 = /zabij poteznego dostojnego goblina
% 3508: /def 9 = /zabij siodmego goblina
```

**Pierwsze 4 opcje podbindowane sa rowniez na F9-F12**

###Walka i dowodzenie###

Podstawowe komendy to

- /druzyna - zlapie imiona czlonkow druzyny zeby wszystko ustawic
 
- /z [0-9] - wykonuje zaslon czlonka druzyny numer [0-9]
- z [imie] - wykonuje zaslon [imie]
- z [imie] [wrogiem] - wykonuje zaslon [imie] przed wrogiem
- z [imie] grupa - wykonuje zaslon [imie] przed grupa
- /zg [0-9] - wykonuje zaslon czlonka druzyny numer [0-9] przed grupa
- /zr [o-0] - wykonuje rozkaz druzynie zaslonic czlonka druzyny przed grupa
- zz - przestan zaslaniac
- zzz - wyjdz zza zaslony

- /zabij [kogo] - atakuje [kogo], jesli jestes liderem to takze wskaze cel/popatrzy

- /d [0-9] - ustawia czlonka druzyny jako cel obrony

Klawiszologia do walki

Tutaj wazne jest, zeby pamietac ze esc_key to sekwencja najpierw ESC pozniej klawisz.

- F1 - zabij cel ataku
- ESC_F1 - przelamanie celu ataku
- F2 - zaslona celu obrony
- ESC_F2 - zaslona grupowa celu obrony
- F3 - ponowne wskazanie celu dla druzyny
- ESC_F3 - rozkaz zabicia celu
- F4 - weskazanie celu obrony dla druzyny
- ESC_F4 - rozkaz zasloniecia celu obrony
- F5 - zaslona przelamanego czlonka druzyny
- ESC_F5 - rozkaz zaslony przelamanego czlonka druzyny

Zaslony z numeryka

Kombinacja ESC + numpad

ESC_NUM1 -> zaslon pierwszego czlonka druzyny

Reszta analogicznie

Dodatkowo

ESC+NUM0 -> wskazanie siebie jako celu obrony

Ustawianie lapania/wskazywania

/targetting [1,2,3] - ustawia tryb lapania dowodcy

```
Setting atack mode
      1   -   by setting target
      2   -   by looking
      3   -   by pointing
```

/pointing [+/-,+/-,+/-] - ustawia jak ty wskazujesz jako dowodca, opcje to (jako cel, popatrz morderczo/opiekunczo, wskaz)

/move [+/-] - wylacza poruszanie sie na numeryku

###Fastbind###

W niektorych sytuacjach pojawi sie opcja z fastbindem, wtedy wystarczy wdusic F5 zeby sie wykonal, zostanie to zakomunikowane w status barze.

###Inne pomocnicze####

- /koksik - kupno zabojcy w browarze
- /koks - jeden lyk z buklaka
- /pij - napicie sie do syta
- mm - wez monety z plecaka
- mmm - schowaj monety do plecaka

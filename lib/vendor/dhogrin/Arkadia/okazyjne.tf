/def exp = \
  /def r = wskaz przeciwnika jako cel ataku%; \
  /def rk = rozkaz druzynie zabic przeciwnika%; \
  /def zas = rozkaz druzynie zaslonic %%{*}%%; wskaz %%{*} jako cel obrony%; \
  /def db = dobadz jednorecznego topora%; \
  /def key_f2=wes

/exp

/def kurhan = \
  /def zk = /zabij kosciotrupa%; \
  /def zz = /zabij zombiego%; \
  /def zo = /zabij ozywienca%; \
  /def przk = /prz kosciotrupa%; \
  /def przz = /prz zombiego%; \
  /def przo = /prz ozywienca%; \
  /def z=zetrzyj symbol
  
/def gobliny = \
  /def wk = /zabij oficera%; \
  /def wkk = /zabij kobolda%; \
  /def zt = /zabij trolla%; \
  /def zs = /zabij goblina

/gobliny
  
/def gnshin = \
  /def lec = wejdz w szczeline%%; e%%; e%%; ob dostojnego goblina%%; w%%; w%%; s%; \
  /def o = wejdz w szczeline%; \
  /def zg = /zabij dostojnego goblina%; \
  /def przg = /prz dostojnego goblina%; \
  /def zs = /zabij siodmego goblina%; \
  /def zz = /zabij goblina%; \
  /def buty = przeszukaj buty%; \
  /def przs = /prz siodmego goblina%; \
  /def ll = wez runiczny mlot z ciala%%; wez buty z ciala%%; wez kamien z ciala%; \
  /def topor = otworz skrzynie kluczem%%; otworz skrzynie%%; wez topor ze skrzyni

/def vrany = \
  alias zs /zabij vrana%; \
  /def zs = /zabij drugiego vrana%; \
  /def ll=zajrzyj do szkatulki%; \
  /def lol=mon%%; wez klucz z ciala%%; otworz skrzynie kluczem%%; otworz skrzynie%%; wez monety ze skrzyni%%; wloz klucz do skrzyni

/def pajaki = \
  /def a=/repeat -0 2 wytnij kiel z %%{*} ciala%; \
  /def b=/repeat -0 2 wytnij pazur z %%{*} ciala%; \
  /def c=/repeat -0 6 wytnij odnoze z %%{*} ciala%; \
  /def q=/a %%{*}%%; /b %%{*}%%; /c %%{*}%; \
  /def qq=/q pierwszego%%; /q drugiego%; \
  /def qqq=/qq%%; /q trzeciego%; \
  /def qqqq=/qqq%%; /q czwartego

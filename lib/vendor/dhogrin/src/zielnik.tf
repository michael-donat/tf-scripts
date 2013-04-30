
/def -Fp200 -mregexp -t'([Zz]olt(y|e|ych) jasn(y|e|ych) kwiat(|y|ow))([ .,])' _ziolo_Deliona = /substitute -p %{PL}%{P1} @{BxCgreen}(Deliona [zjedz = sprint])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Cc]iemn(y|e|ych) splatan(y|e|ych) korzen(|ie|iow))([ .,])' _ziolo_Ciemiernik = /substitute -p %{PL}%{P1} @{BxCgreen}(Ciemiernik [trucizna])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Zz]ielon(y|e|ych) miesist(y|e|ych) kwiat(|y|ow))([ .,])' _ziolo_Ciemiezyca = /substitute -p %{PL}%{P1} @{BxCgreen}(Ciemiezyca [zjedz = -spostrzegawczosc, -zrecznosc)@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Cc]iemn(e|ych) poskrecan(e|ych) klacz(|e|a))([ .,])' _ziolo_Pieciornik = /substitute -p %{PL}%{P1} @{BxCgreen}(Pieciornik [rozgryz = leczy])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Kk]olczast(a|e|ych) wysuszon(a|e|ych) roslin(e|a|y))([ .,])' _ziolo_Oset = /substitute -p %{PL}%{P1} @{BxCgreen}(Oset [trucizna])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Gg]rub(e|ych) walcowat(e|ych) klacz(|e|a))([ .,])' _ziolo_Pokrzyk = /substitute -p %{PL}%{P1} @{BxCgreen}(Pokrzyk [zjedz = spowalnia, -spostrzegawczosc])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Rr]ozetkowat(y|e|ych) lancetowat(y|e|ych) lisc(|ie|i))([ .,])' _ziolo_Babka = /substitute -p %{PL}%{P1} @{BxCgreen}(Babka [zjedz = meczy; przyloz = leczy])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Cc]iemnozielon(a|e|ych) rozwart(a|e|ych) rozycz(ka|ke|ek))([ .,])' _ziolo_Rojnik = /substitute -p %{PL}%{P1} @{BxCgreen}(Rojnik [zjedz = upija, meczy mentalnie])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Nn]iewielk(i|ie|ich) czerwon(y|e|ych) owoc(|e|ow))([ .,])' _ziolo_Poziomka = /substitute -p %{PL}%{P1} @{BxCgreen}(Poziomka)@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Zz]ielon(y|e|ych) galezist(y|e|ych) ped(|y|ow))([ .,])' _ziolo_Rdest = /substitute -p %{PL}%{P1} @{BxCgreen}(Rdest [zjedz = wzdryganie sie, przyloz = leczy])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Ss]zaraw(e|ych) pogiet(e|ych) klacz(|e|a))([ .,])' _ziolo_Rauwolfia = /substitute -p %{PL}%{P1} @{BxCgreen}(Rauwolfia [przezuj = leczy])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Zz]drewnial(a|e|ych) rozgalezion(a|e|ych) krzewink(a|i|ek))([ .,])' _ziolo_Macznica = /substitute -p %{PL}%{P1} @{BxCgreen}(Macznica [rozgryz ususzona = leczy])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Zz]locisozolt(y|e|ych) kwiat(|y|ow))([ .,])' _ziolo_Mniszek = /substitute -p %{PL}%{P1} @{BxCgreen}(Mniszek [zjedz = leczy])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Bb]ial(y|e|ych) mal(y|e|ych) kwiat(|y|ow))([ .,])' _ziolo_Glog = /substitute -p %{PL}%{P1} @{BxCgreen}(Glog [przezuj = leczy; zjedz = regeneruje])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Mm]al(y|e|ych) czerwon(y|e|ych) kwiat(|y|ow))([ .,])' _ziolo_SerceKapitana = /substitute -p %{PL}%{P1} @{BxCgreen}(Serce kapitana [przezuj = leczy])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Jj]asnopomaranczow(y|e|ych) kwiat(|y|ow))([ .,])' _ziolo_Nagietek = /substitute -p %{PL}%{P1} @{BxCgreen}(Nagietek [przyloz = leczy])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Cc]zteroplytkow(y|e|ych) zolt(y|e|ych) kwiat(ek|ki|kow))([ .,])' _ziolo_Glistnik = /substitute -p %{PL}%{P1} @{BxCgreen}(Glistnik [leczy])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Nn]iewielk(i|ie|ich) fioletow(y|e|ych) kwiat(|y|ow))([ .,])' _ziolo_Makownik = /substitute -p %{PL}%{P1} @{BxCgreen}(Makownik [prawdopodobnie leczy])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Ww]zniesion(a|e|ych) ukwiecon(a|e|ych) lodyg(|a|i))([ .,])' _ziolo_Tojad = /substitute -p %{PL}%{P1} @{BxCgreen}(Tojad [przezuj = leczy])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Oo]kraglaw(y|e|ych) aromatyczn(y|e|ych) lisc(|ie|i))([ .,])' _ziolo_Mieta = /substitute -p %{PL}%{P1} @{BxCgreen}(Mieta [rozetrzyj = leczy; powachaj = regeneruje])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Zz]aostrzon(y|e|ych) podluzn(y|e|ych) lisc(|ie|i))([ .,])' _ziolo_Szalwia = /substitute -p %{PL}%{P1} @{BxCgreen}(Szalwia [zjedz = leczy])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Pp]iekn(y|e|ych) czerwon(y|e|ych) kwiat(|y|ow))([ .,])' _ziolo_Mak = /substitute -p %{PL}%{P1} @{BxCgreen}(Mak [zjedz = leczy(skutki uboczne)])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Uu]kwiecion(a|e|ych) lodyg(|a|e|i))([ .,])' _ziolo_Krwawnik = /substitute -p %{PL}%{P1} @{BxCgreen}(Krwawnik [leczy])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Ff]ioletow(y|e|ych) zwart(y|e|ych) kwiatostan(|y|ow))([ .,])' _ziolo_Lawenda = /substitute -p %{PL}%{P1} @{BxCgreen}(Lawenda [przyloz = leczy, meczy])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Kk]osmatoowlosion(y|e|ych) kwiatostan(|y|ow|))([ .,])' _ziolo_Kasztanowiec = /substitute -p %{PL}%{P1} @{BxCgreen}(Kasztanowiec [zjedz - regeneruje])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Ww]onn(y|e|ych) dzwonkowat(y|e|ych) kwiat(ek|ki|kow))([ .,])' _ziolo_Konwalia = /substitute -p %{PL}%{P1} @{BxCgreen}(Konwalia [powachaj = regeneruje])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Kk]remow(y|e|ych) owlosion(y|e|ych) (ususzon(y|e|ych) |)kwiat(|y|ow))([ .,])' _ziolo_Przelot = /substitute -p %{PL}%{P1} @{BxCgreen}(Przelot [sproszkuj suchy = regeneruje, skutki uboczne])@{n}%{P7}%{PR}

/def -Fp200 -mregexp -t'([Cc]zterokanciast(a|e|ych) rozgalezion(a|e|ych) lodyg(|a|i))([ .,])' _ziolo_Dziurawiec = /substitute -p %{PL}%{P1} @{BxCgreen}(Dziurawiec [rozgryz = leczy])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([^o][Kk]anciast(a|e|ych) rozgalezion(a|e|ych) lodyg(|a|i))([ .,])' _ziolo_Bylica = /substitute -p %{PL}%{P1} @{BxCgreen}(Bylica [przyloz = regeneruje])@{n}%{P5}%{PR}


/def -Fp200 -mregexp -t'([Jj]asnozielon(a|e|ych) nieowlosion(a|e|ych) lodyg(|a|i))([ .,])' _ziolo_Lulecznica = /substitute -p %{PL}%{P1} @{BxCgreen}(Lulecznica [przyloz = regeneruje])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Ss]ztywn(a|e|ych) smukl(a|e|ych) lodyg(|a|i))([ .,])' _ziolo_Lak = /substitute -p %{PL}%{P1} @{BxCgreen}(Lak [przezuj = regeneruje])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Ss]rebrzystoszar(y|e|ych) owlosion(y|e|ych) lisc(|ie|i))([ .,])' _ziolo_Naparstnica = /substitute -p %{PL}%{P1} @{BxCgreen}(Naparstnica [zjedz = regeneruje])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Oo]wlosion(y|e|ych) aromatyczn(y|e|ych) lisc(|ie|i))([ .,])' _ziolo_Melisa = /substitute -p %{PL}%{P1} @{BxCgreen}(Melisa [zjedz = regeneruje])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Bb]razow(e|ych) okragl(e|ych) nasion(ko|ka|ek))([ .,])' _ziolo_Kola = /substitute -p %{PL}%{P1} @{BxCgreen}(Kola [rozgryz = regeneruje])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Mm]acznistoowlosion(a|e|ych) szaraw(a|e|ych) roslin(|a|y))([ .,])' _ziolo_Komosa = /substitute -p %{PL}%{P1} @{BxCgreen}(Komosa [przezuj = regeneruje, +wyt])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Ss]zar(y|e|ych) kolczast(y|e|ych) korzen(|ie|i))([ .,])' _ziolo_Aralia = /substitute -p %{PL}%{P1} @{BxCgreen}(Aralia [zjedz = regeneruje, skutki uboczne])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Jj]asnobrunatn(a|e|ych) popekan(a|e|ych) galaz(ka|ki|ek))([ .,])' _ziolo_BezCzarny = /substitute -p %{PL}%{P1} @{BxCgreen}(Bez Czarny [przezuj = odtrutka])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Zz]oltoszar(y|e|ych) niepozorn(y|e|ych) korze(n|nie|ni))([ .,])' _ziolo_Ranog = /substitute -p %{PL}%{P1} @{BxCgreen}(Ranog [przezuj = odtrutka])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Zz]oltaw(y|e|ych) powyginan(y|e|ych) korze(n|nie|ni))([ .,])' _ziolo_Krzyzownica = /substitute -p %{PL}%{P1} @{BxCgreen}(Krzyzownica [przezuj = odtrutka])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Bb]ial(y|e|ych) rozgalezion(y|e|ych) korze(n|nie|ni))([ .,])' _ziolo_Mandragora = /substitute -p %{PL}%{P1} @{BxCgreen}(Mandragora [przezuj = mana])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Dd]robn(y|e|ych) bial(y|e|ych) kwiat(ek|ki|kow))([ .,])' _ziolo_Rumianek = /substitute -p %{PL}%{P1} @{BxCgreen}(Rumianek [powachaj = odtrutka])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Ww]ysok(i|ie|ich) blekitn(y|e|ych) kwiat(|y|ow))([ .,])' _ziolo_Chaber = /substitute -p %{PL}%{P1} @{BxCgreen}(Chaber [przezuj, powachaj = odtrutka])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Jj]asnobrazow(a|e|ych) ulistnion(a|e|ych) lodyg(a|i|e|))([ .,])' _ziolo_Nawloc = /substitute -p %{PL}%{P1} @{BxCgreen}(Nawloc [rozgryz = odtrutka, skutki uboczne])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Dd]uz(a|e|ych) granatow(a|e|ych) jagod(a|y|))([ .,])' _ziolo_Siezygron = /substitute -p %{PL}%{P1} @{BxCgreen}(Siezygron [rozgryz = odtrutka])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Ss]zarozielon(y|e|ych) gabczast(y|e|ych) porost(|y|ow))([ .,])' _ziolo_Plucnica = /substitute -p %{PL}%{P1} @{BxCgreen}(Plucnica [sproszkuj = odtrutka])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Bb]rudnozolt(y|e|ych) fioletowo-zylkowan(y|e|ych) kwiat(|y|ow))([ .,])' _ziolo_Lulek = /substitute -p %{PL}%{P1} @{BxCgreen}(Lulek [trucizna])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Mm]al(y|e|ych) czarn(y|e|ych) owoc(|e|ow))([ .,])' _ziolo_Jezyna = /substitute -p %{PL}%{P1} @{BxCgreen}(Jezyna)@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Ss]mukl(a|e|ych) zielon(a|e|ych) lodyg(|e|a|i))([ .,])' _ziolo_Nostrzyk = /substitute -p %{PL}%{P1} @{BxCgreen}(Nostrzyk [przezuj = regeneruje])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Ww]iotk(a|ie|ich) drobn(a|e|ych) lodyz(ka|ki|ek|ke))([ .,])' _ziolo_Kurzyslad = /substitute -p %{PL}%{P1} @{BxCgreen}(Kurzyslad [trucizna])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Ss]zorstk(a|ie|ich) ciemnozielon(a|e|ych) galaz(ka|ke|ki|ek))([ .,])' _ziolo_Poziewnik = /substitute -p %{PL}%{P1} @{BxCgreen}(Poziewnik)@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Kk]anciast(a|e|ych) parzac(a|e|ych) lodyg(a|i|e|))([ .,])' _ziolo_Pokrzywa = /substitute -p %{PL}%{P1} @{BxCgreen}(Pokrzywa [zjedz = glodzi i spragnia])@{n}%{P5}%{PR}

/def -Fp200 -mregexp -t'([Cc]zarn(y|e|ych) niewielk(i|ie|ich) owoc(e|em|ow|))([ .,])' _ziolo_SliwaTarnina = /substitute -p %{PL}%{P1} @{BxCgreen}(Sliwa Tarnina [zjedz = glodzi])@{n}%{P5}%{PR}
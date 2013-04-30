; Automagicly added line: tf_ver=1.2.3


;------------------------------------------------------------------------------
;|                        Rozne cuda niewidy.. Statystyki wykresy             |
;------------------------------------------------------------------------------
/require -q textutil.tf

/if ($(/listvar -s zabici_ostatnio_suma_zabitych)=~NULL) /set zabici_ostatnio_suma_zabitych=0 %;/endif
/if ($(/listvar -s zabici_ostatnio_suma_poleglych)=~NULL) /set zabici_ostatnio_suma_poleglych=0 %;/endif
/if ($(/listvar -s zabici_calkowicie_data)=~NULL) /eval /set zabici_calkowicie_data=$[ftime("%d.%m.%Y",time())] %;/endif
/if ($(/listvar -s zabici_calkowicie_suma_zabitych)=~NULL) /set zabici_calkowicie_suma_zabitych=0 %;/endif
/if ($(/listvar -s zabici_calkowicie_suma_poleglych)=~NULL) /set zabici_calkowicie_suma_poleglych=0 %;/endif
/if ($(/listvar -s ogolne_wykres_slupkowy)=~NULL) /eval /set ogolne_wykres_slupkowy=$[strcat(ftime("%H:%M",time()),"#",time(),"$")] %;/endif

;------------------------------------------------------------------------------
;|                        Wykresy i inne statystykiyki                        |
;------------------------------------------------------------------------------

/def -Fp160 -mregexp -t'^(.+?) (?:\\(.*\\) |)zabil(?:a|o|) (.+)\.$' _ktos_zabil_cosik_licz = \
    /_dodaj_do_kto_zabil %{P1}%;\
    /_dodaj_do_poleglych %{P2}%;
;    /_zapisz
/def -Fp160 -mregexp -t'^Zabil[ea]s (.+)\\.$' zabiles_cosik_licz = \
    /_dodaj_do_zabitych %{P1}%;\
;    /_zapisz

/def _dodaj_do_zabitych = \
    /let zabity=$[substr({L1}, 0, 13)] %;\
    /if ($(/listvar -s zabici_ostatnio_polegle_%{zabity})=~NULL) \
      /set zabici_ostatnio_zabite_%{zabity}=0 %;\
      /set zabici_ostatnio_polegle_%{zabity}=0 %;\
      /if ($(/listvar -s zabici_calkowicie_polegle_%{zabity})=~NULL) \
        /set zabici_calkowicie_zabite_%{zabity}=0 %;\
        /set zabici_calkowicie_polegle_%{zabity}=0 %;\
      /endif %;\
    /endif %;\
    /test ++zabici_ostatnio_zabite_%{zabity} %;\
    /test ++zabici_ostatnio_polegle_%{zabity} %;\
    /test ++zabici_calkowicie_zabite_%{zabity} %;\
    /test ++zabici_calkowicie_polegle_%{zabity} %;\
    /test ++zabici_ostatnio_suma_zabitych %;\
    /test ++zabici_ostatnio_suma_poleglych  %;\
    /test ++zabici_calkowicie_suma_zabitych %;\
    /test ++zabici_calkowicie_suma_poleglych

/def _dodaj_do_poleglych = \
    /let zabity=$[substr({L1},0,13)] %;\
    /if ($(/listvar -s zabici_ostatnio_polegle_%{zabity})=~NULL) \
      /set zabici_ostatnio_zabite_%{zabity}=0 %;\
      /set zabici_ostatnio_polegle_%{zabity}=0 %;\
      /if ($(/listvar -s zabici_calkowicie_polegle_%{zabity})=~NULL) \
        /set zabici_calkowicie_zabite_%{zabity}=0 %;\
        /set zabici_calkowicie_polegle_%{zabity}=0 %;\
      /endif %;\
    /endif %;\
    /test ++zabici_ostatnio_polegle_%{zabity} %;\
    /test ++zabici_calkowicie_polegle_%{zabity} %;\
    /test ++zabici_ostatnio_suma_poleglych %;\
    /test ++zabici_calkowicie_suma_poleglych

/def _dodaj_do_kto_zabil = \
    /let zabity=$[substr({L1},0,13)] %;\
    /if ($(/listvar -s zabici_ostatnio_ktozabil_%{zabity})=~NULL) \
      /set zabici_ostatnio_ktozabil_%{zabity}=0 %;\
    /endif %;\
    /test ++zabici_ostatnio_ktozabil_%{zabity}

/def zabici2 = \
    /if (!getopts("s", "")) /return 0%; /endif %;\
    /let po_ile=%{1} %;\
    /if ({po_ile} < 1) \
      /let po_ile=2%;\
    /endif  %;\
    /let linia1=$[strrep("=========================+",po_ile-1)] %;\
    /let linia= %;\
    /let cc=0 %;\
    /_echo +%{linia1}=========================+%;\
    /let zabici_lista=$(/listvar -s -mglob zabici_ostatnio_polegle_*) %;\
    /if ({opt_s}) \
        /let zabici_lista=$(/quote -S -decho !echo %{zabici_lista}|tsort|sort) %;\
    /endif %;\
    /let zabici_lista=$[strcat(zabici_lista," end")] %;\
    /while /let i=$[strstr(zabici_lista," ")]%; /@test i > 0%; /do \
      /let ktory_var=$[substr(zabici_lista,0,i)] %;\
      /let ktory_ile=$(/eval /listvar -v %{ktory_var}) %;\
      /let ktory_nazwa=$[substr(ktory_var,strrchr(ktory_var,"_")+1)] %;\
      /let ktory_ile2=$(/eval /listvar -v zabici_ostatnio_zabite_%{ktory_nazwa}) %;\
      /if (cc<{po_ile}) \
        /let linia=$[strcat(linia,"|",pad(ktory_nazwa,13),": (",pad(ktory_ile2,3),"/",pad(ktory_ile,4),")")] %;\
        /test ++cc %;\
        /let zabici_lista=$[substr(zabici_lista,i+1)] %;\
      /else \
	/_echo %{linia}| %;\
	/let cc=0 %;\
	/let linia= %;\
      /endif %;\
    /done %;\
    /if (cc>0) \
      /_echo $[strcat(linia,strrep("|             : (        )",po_ile-cc),"|")] %;\
    /endif %;\
    /let linia=$[strcat("(@{BCyellow}  ",pad(zabici_ostatnio_suma_zabitych,6),"@{n})|")] %;\
    /if (wrapsize > {po_ile}*27+6) \
      /let linia=$[strcat(linia," @{BCyellow}<@{BCgreen}<@{BCmagenta}<@{BCblue}<@{Bn}-")] %;\
    /endif %;\
    /echo -p +%{linia1}===== W sumie: %{linia}  %;\
    /_echo +%{linia1}=========================+%;\
    /let linia= %;\
    /let cc=0 %;\
    /let zabici_lista=$(/listvar -s -mglob zabici_ostatnio_ktozabil_*) %;\
    /if ({opt_s}) \
        /let zabici_lista=$(/quote -S -decho !echo %{zabici_lista}|tsort|sort) %;\
    /endif %;\
    /let zabici_lista=$[strcat(zabici_lista," end")] %;\
    /while /let i=$[strstr(zabici_lista," ")]%; /@test i > 0%; /do \
      /let ktory_var=$[substr(zabici_lista,0,i)] %;\
      /let ktory_ile=$(/eval /listvar -v %{ktory_var}) %;\
      /let ktory_nazwa=$[substr(ktory_var,strrchr(ktory_var,"_")+1)] %;\
      /if (cc<{po_ile}) \
        /let linia=$[strcat(linia,"|",pad(ktory_nazwa,13),": (     ",pad(ktory_ile,3),")")] %;\
        /test ++cc %;\
        /let zabici_lista=$[substr(zabici_lista,i+1)] %;\
      /else \
	/_echo %{linia}| %;\
	/let cc=0 %;\
	/let linia= %;\
      /endif %;\
    /done %;\
    /if (cc>0) \
      /_echo $[strcat(linia,strrep("|             : (        )",po_ile-cc),"|")] %;\
    /endif %;\
    /let linia=$[strcat("(@{BCyellow}  ",pad(zabici_ostatnio_suma_poleglych,6),"@{n})|")] %;\
    /if (wrapsize > {po_ile}*27+6) \
      /let linia=$[strcat(linia," @{BCyellow}<@{BCgreen}<@{BCmagenta}<@{BCblue}<@{Bn}-")] %;\
    /endif %;\
    /echo -p +%{linia1}===== W sumie: %{linia}  %;\
    /_echo +%{linia1}=========================+



/def zabici3 = \
    /if (!getopts("s", "")) /return 0%; /endif %;\
    /let po_ile=%{1} %;\
    /if ({po_ile} < 1) \
      /let po_ile=2%;\
    /endif  %;\
    /let linia1=$[strrep("=========================+",po_ile-1)] %;\
    /let linia= %;\
    /let cc=0 %;\
    /_echo +%{linia1}=========================+%;\
    /let zabici_lista=$(/listvar -s -mglob zabici_calkowicie_polegle_*) %;\
    /if ({opt_s}) \
        /let zabici_lista=$(/quote -S -decho !echo %{zabici_lista}|tsort|sort) %;\
    /endif %;\
    /let zabici_lista=$[strcat(zabici_lista," end")] %;\
    /while /let i=$[strstr(zabici_lista," ")]%; /@test i > 0%; /do \
      /let ktory_var=$[substr(zabici_lista,0,i)] %;\
      /let ktory_ile=$(/eval /listvar -v %{ktory_var}) %;\
      /let ktory_nazwa=$[substr(ktory_var,strrchr(ktory_var,"_")+1)] %;\
      /let ktory_ile2=$(/eval /listvar -v zabici_calkowicie_zabite_%{ktory_nazwa}) %;\
      /if (cc<{po_ile}) \
        /let linia=$[strcat(linia,"|",pad(ktory_nazwa,13),": (",pad(ktory_ile2,3),"/",pad(ktory_ile,4),")")] %;\
        /test ++cc %;\
        /let zabici_lista=$[substr(zabici_lista,i+1)] %;\
      /else \
	/_echo %{linia}| %;\
	/let cc=0 %;\
	/let linia= %;\
      /endif %;\
    /done %;\
    /if (cc>0) \
      /_echo $[strcat(linia,strrep("|             : (        )",po_ile-cc),"|")] %;\
    /endif %;\
    /let linia=$[strcat("(@{BCyellow}",pad(zabici_calkowicie_suma_zabitych,4),"@{BCblue}/","@{BCyellow}",pad(zabici_calkowicie_suma_poleglych,4),"@{n})|")]%;\
    /if (wrapsize > {po_ile}*27+6) \
      /let linia=$[strcat(linia," @{BCyellow}<@{BCgreen}<@{BCmagenta}<@{BCblue}<@{Bn}-")] %;\
    /endif %;\
    /echo -p +%{linia1}===== W sumie:%{linia}  %;\
    /_echo +======= %{zabici_calkowicie_data} ======+%{linia1}

 

/def _wykres_base = \
    /let ile_zabitych=$[{zabici_ostatnio_suma_zabitych}-{zabici_ostatnio_suma_zabitych_1-0}]%;\
    /let ile_poleglych=$[{zabici_ostatnio_suma_poleglych}-{zabici_ostatnio_suma_poleglych_1-0}]%;\
    /if ({ile_poleglych}==0) \
      /if (substr({ogolne_wykres_slupkowy},strlen({ogolne_wykres_slupkowy})-1)!~"!") \
        /set ogolne_wykres_slupkowy=$[strcat({ogolne_wykres_slupkowy},"!")]%;\
      /endif %;\
    /else \
      /if (substr({ogolne_wykres_slupkowy},strlen({ogolne_wykres_slupkowy})-1)=~"!") \
        /set ogolne_wykres_slupkowy=$[strcat(substr({ogolne_wykres_slupkowy},0,strlen({ogolne_wykres_slupkowy})-1),ftime("%H:%M",time()-600),"|",0,"/",0,"#")]%;\
      /endif %;\
      /set ogolne_wykres_slupkowy=$[strcat({ogolne_wykres_slupkowy},ftime("%H:%M",time()),"|",{ile_zabitych},"/",{ile_poleglych},"#")]%;\
      /set zabici_ostatnio_suma_zabitych_1=%{zabici_ostatnio_suma_zabitych}%;\
      /set zabici_ostatnio_suma_poleglych_1=%{zabici_ostatnio_suma_poleglych}%;\
    /endif

/def wykres = \
    /let i=%;\
    /let _wykres=%{ogolne_wykres_slupkowy}%;\
    /let _time=$[substr({_wykres},0,5)]%;\
    /echo -p +-=============== Zabiles dzis od @{BCgreen}%{_time} @{BCyellow}!!@{nCwhite} ==============-+%;\
    /let _time=$[(time()-substr({_wykres},6,strstr({_wykres},"$")-6))/3600.0]%;\
    /let _wykres=$[substr({_wykres},strstr({_wykres},"$")+1)]%;\
    /while /let i=$[strstr({_wykres},"#")] %; /@test i > 0 %; /do \
      /let _wyk=$[substr({_wykres},0,i)]%;\
      /let _ja=$[substr({_wyk},6,strstr({_wyk},"/")-6)]%;\
      /let _oni=$[substr({_wyk},strstr({_wyk},"/")+1)]%;\
      /let linia=$[pad("|",1,substr({_wyk},0,5),6,"  (",2,{_ja},3,"/",1,{_oni},3,")  ",3,"@{BCyellow}",0,strrep("#",{_ja}),0,"@{nCyellow}",0,strrep("#",{_oni}-{_ja}),0)]%;\
      /echo -p %{linia} %;\
      /let _wykres=$[substr({_wykres},i+1)]%;\
    /done %;\
    /let ile_zabitych=$[{zabici_ostatnio_suma_zabitych}-{zabici_ostatnio_suma_zabitych_1}]%;\
    /let ile_poleglych=$[{zabici_ostatnio_suma_poleglych}-{zabici_ostatnio_suma_poleglych_1}]%;\
    /let linia=$[pad("|",1,ftime("%H:%M",time()),6,"  (",2,{ile_zabitych},3,"/",1,{ile_poleglych},3,")  ",3,"@{BCyellow}",0,strrep("#",{ile_zabitych}),0,"@{nCyellow}",0,strrep("#",{ile_poleglych}-{ile_zabitych}),0)]%;\
    /echo -p %{linia} %;\
    /echo +---------------------------------------------------------+ %;\
    /echo -p +-== Srednia szybkosc zabijania: (@{BCgreen}$[pad(substr({zabici_ostatnio_suma_zabitych}/{_time},0,5),5)]@{BCred}/@{nCgreen}$[pad(substr({zabici_ostatnio_suma_poleglych}/{_time},0,5),5)]@{BCblue}/@{BCwhite}Godzine@{nCwhite}) ==-+

; Statystki ciosow, specow (mc)

/def sets_stats = \
	/set statsid=1%;\
	/quote -S /test set_stat('"~/tf/db/stats.db")%;\
	/set statsid=1
/def set_stat = \
	/set _stat_%{statsid}=%{*}%;\
        /test ++statsid

/def zapiszstaty = \
  /if ((uchwyt:=tfopen("tf/db/stats.db", "w"))<0) \
    /return 0%; \
    /echo Blad zapisu licznika ofiar do pliku "tf/db/stats.db"!%; \
  /endif%;\
  /test tfflush(uchwyt, 0)%; \
  /doeach /nagraj_stat $(/listvar -s _stat_*)%;\
  /test tfclose(uchwyt)%;
/def nagraj_stat = \
 /let _qpa=$(/listvar -v %1)%;\
 /eval /test tfwrite(uchwyt, _qpa)
/sets_stats

/def -Fp300 -mregexp -t'^Probujesz trafic '               			      stats_1 = /test ++_stat_1
/def -Fp300 -mregexp -t'^Trafiasz (.*), lecz caly impet '    			      stats_2 = /test ++_stat_2
/def -Fp300 -mregexp -t'^(Wyprowadzasz szybkie pchniecie|Robisz zamach|Wykonujesz zamaszyste ciecie) .*\, lecz .* (zbija|paruje)'          stats_3 = /test ++_stat_3
/def -Fp300 -mregexp -t'^(Wyprowadzasz szybkie pchniecie|Robisz zamach|Wykonujesz zamaszyste ciecie) .*\, lecz .* oslania'        stats_4 = /test ++_stat_4
/def -Fp300 -mregexp -t'^Ledwo muskasz '          				      stats_5 = /test ++_stat_5
/def -Fp300 -mregexp -t'^Lekko ranisz '                                              stats_6 = /test ++_stat_6
/def -Fp300 -mregexp -t'^Ranisz '	                                              stats_7 = /test ++_stat_7
/def -Fp300 -mregexp -t'^Powaznie ranisz '                                           stats_8 = /test ++_stat_8
/def -Fp300 -mregexp -t'^Bardzo ciezko ranisz '                                      stats_9 = /test ++_stat_9
/def -Fp300 -mregexp -t'^Masakrujesz '                                               stats_10 = /test ++_stat_10
/def -Fp300 -mregexp -t'probuje cie trafic .* lecz tobie udaje sie uniknac '         stats_19 = /test ++_stat_19
/def -Fp300 -mregexp -t'(lecz tobie udaje sie oslonic|lecz udaje ci sie oslonic)'     stats_20 = /test ++_stat_20
/def -Fp300 -mregexp -t'(lecz tobie udaje sie je zbic|lecz tobie udaje sie go sparowac|lecz tobie udaje sie zbic je)' stats_21 = /test ++_stat_21
/def -Fp300 -mregexp -t'trafia cie (.*), lecz caly impet uderzenia zostaje'           stats_22 = /test ++_stat_22
/def -Fp300 -mregexp -t' ledwo muska cie ' 					      stats_23 = /test ++_stat_23
/def -Fp300 -mregexp -t' lekko rani cie '					      stats_24 = /test ++_stat_24
/def -Fp300 -mregexp -t' ((?<!lekko |powaznie |bardzo ciezko )rani) cie '            stats_25 = /test ++_stat_25
/def -Fp300 -mregexp -t' powaznie rani cie '					      stats_26 = /test ++_stat_26
/def -Fp300 -mregexp -t' bardzo ciezko rani cie '				      stats_27 = /test ++_stat_27
/def -Fp300 -mregexp -t' masakruje cie ' 					      stats_28 = /test ++_stat_28

/def ciosy = \
	/set all_ciosym=$[{_stat_1}+{_stat_2}+{_stat_3}+{_stat_4}+{_stat_5}+{_stat_6}+{_stat_7}+{_stat_8}+{_stat_9}+{_stat_10}+\
				{_stat_11}+{_stat_12}+{_stat_13}+{_stat_14}+{_stat_15}+{_stat_16}+{_stat_17}+{_stat_18}]%;\
	/set all_ciosynt=$[{_stat_1}+{_stat_2}+{_stat_3}+{_stat_4}]%;\
	/set all_ciosyzw=$[{_stat_1}+{_stat_2}+{_stat_3}+{_stat_4}+{_stat_5}+{_stat_6}+{_stat_7}+{_stat_8}+{_stat_9}+{_stat_10}]%;\
	/set all_ciosyt=$[{_stat_5}+{_stat_6}+{_stat_7}+{_stat_8}+{_stat_9}+{_stat_10}]%;\
	/set all_ciosys=$[{_stat_11}+{_stat_12}+{_stat_13}+{_stat_14}+{_stat_15}+{_stat_16}+{_stat_17}+{_stat_18}]%;\
	/set all_ciosya $[{_stat_19}+{_stat_20}+{_stat_21}+{_stat_22}+{_stat_23}+{_stat_24}+{_stat_25}+{_stat_26}+{_stat_27}+{_stat_28}]%;\
	/set all_ciosyaN=$[{_stat_19}+{_stat_20}+{_stat_21}+{_stat_22}]%;\
	/set all_ciosyaT=$[{_stat_23}+{_stat_24}+{_stat_25}+{_stat_26}+{_stat_27}+{_stat_28}]%;\
	/echo -p +-------------- Statystyka ciosow ---------------+%;\
	/echo -p |%;\
	/echo -p |  Ciosy oddane przez Ciebie......... %{all_ciosym}%;\
        /echo -p |                                                   %;\
	/echo -p |    Ciosy nietrafione............... %{all_ciosynt} $[strrep(" ",6-$[strlen({all_ciosynt})])]\[$[$[{all_ciosynt}*100]/{all_ciosyzw}]%%\]  %;\
	/echo -p |	Unikniete..................... %{_stat_1} $[strrep(" ",6-$[strlen({_stat_1})])]\[$[$[{_stat_1}*100]/{all_ciosyzw}]%%\]  %;\
	/echo -p |	Wyparowane przez zbroje....... %{_stat_2} $[strrep(" ",6-$[strlen({_stat_2})])]\[$[$[{_stat_2}*100]/{all_ciosyzw}]%%\]  %;\
	/echo -p |      Sparowane bronia.............. %{_stat_3} $[strrep(" ",6-$[strlen({_stat_3})])]\[$[$[{_stat_3}*100]/{all_ciosyzw}]%%\]  %;\
	/echo -p |	Osloniete tarcza.............. %{_stat_4} $[strrep(" ",6-$[strlen({_stat_4})])]\[$[$[{_stat_4}*100]/{all_ciosyzw}]%%\]  %;\
	/echo -p |    Ciosy trafione.................. %{all_ciosyt} $[strrep(" ",6-$[strlen({all_ciosyt})])]\[$[$[{all_ciosyt}*100]/{all_ciosyzw}]%%\]  %;\
	/echo -p |	Ledwo musnales................ %{_stat_5} $[strrep(" ",6-$[strlen({_stat_5})])]\[$[$[{_stat_5}*100]/{all_ciosyzw}]%%\] %;\
	/echo -p |	Lekko raniles................. %{_stat_6} $[strrep(" ",6-$[strlen({_stat_6})])]\[$[$[{_stat_6}*100]/{all_ciosyzw}]%%\] %;\
        /echo -p |      Raniles....................... %{_stat_7} $[strrep(" ",6-$[strlen({_stat_7})])]\[$[$[{_stat_7}*100]/{all_ciosyzw}]%%\] %;\
        /echo -p |      Powaznie raniles.............. %{_stat_8} $[strrep(" ",6-$[strlen({_stat_8})])]\[$[$[{_stat_8}*100]/{all_ciosyzw}]%%\] %;\
        /echo -p |	Bardzo ciezko raniles......... %{_stat_9} $[strrep(" ",6-$[strlen({_stat_9})])]\[$[$[{_stat_9}*100]/{all_ciosyzw}]%%\] %;\
        /echo -p |	Masakrowales.................. %{_stat_10} $[strrep(" ",6-$[strlen({_stat_10})])]\[$[$[{_stat_10}*100]/{all_ciosyzw}]%%\] %;\
	/echo -p |                                                   %;\
        /echo -p |  Ciosy mierzone w Ciebie........... %{all_ciosya}            %;\
        /echo -p |                                                   %;\
        /echo -p |    Ciosy nietrafione............... %{all_ciosyaN} $[strrep(" ",6-$[strlen({all_ciosyaN})])]\[$[$[{all_ciosyaN}*100]/{all_ciosya}]%%\]  %;\
        /echo -p |	Uniknales..................... %{_stat_19} $[strrep(" ",6-$[strlen({_stat_19})])]\[$[$[{_stat_19}*100]/{all_ciosyaN}]%%\]  %;\
        /echo -p |	Osloniles sie tarcza.......... %{_stat_20} $[strrep(" ",6-$[strlen({_stat_20})])]\[$[$[{_stat_20}*100]/{all_ciosyaN}]%%\]  %;\
	/echo -p |	Sparowales bronia............. %{_stat_21} $[strrep(" ",6-$[strlen({_stat_21})])]\[$[$[{_stat_21}*100]/{all_ciosyaN}]%%\]  %;\
        /echo -p |      Wyparowane przez twoja zbroje. %{_stat_22} $[strrep(" ",6-$[strlen({_stat_22})])]\[$[$[{_stat_22}*100]/{all_ciosyaN}]%%\]  %;\
        /echo -p |    Ciosy trafione.................. %{all_ciosyaT} $[strrep(" ",6-$[strlen({all_ciosyaT})])]\[$[$[{all_ciosyaT}*100]/{all_ciosya}]%%\]  %;\
        /echo -p |	Ledwo musnieto Cie............ %{_stat_23} $[strrep(" ",6-$[strlen({_stat_23})])]\[$[$[{_stat_23}*100]/{all_ciosyaT}]%%\]  %;\
        /echo -p |	Lekko raniono Cie............. %{_stat_24} $[strrep(" ",6-$[strlen({_stat_24})])]\[$[$[{_stat_24}*100]/{all_ciosyaT}]%%\]  %;\
        /echo -p |	Raniono Cie................... %{_stat_25} $[strrep(" ",6-$[strlen({_stat_25})])]\[$[$[{_stat_25}*100]/{all_ciosyaT}]%%\]  %;\
        /echo -p |	Powaznie raniono Cie.......... %{_stat_26} $[strrep(" ",6-$[strlen({_stat_26})])]\[$[$[{_stat_26}*100]/{all_ciosyaT}]%%\]  %;\
        /echo -p |	Bardzo ciezko raniono Cie..... %{_stat_27} $[strrep(" ",6-$[strlen({_stat_27})])]\[$[$[{_stat_27}*100]/{all_ciosyaT}]%%\]  %;\
        /echo -p |	Masakrowano Cie............... %{_stat_28} $[strrep(" ",6-$[strlen({_stat_28})])]\[$[$[{_stat_28}*100]/{all_ciosyaT}]%%\]  %;\
	/echo -p |                                              %;\
	/echo -p +------------------------------------------------+


; by Ingwar

/def -Fp2 -mregexp -t'Zabil.s ' _zabiles_cosik_licz = %;\
 	/_dodaj_do_zabitych %{PR}%;\
	/substitute -p @{BC%kolor_crit}%{PL}%{P0}%{PR} (%{ownkills}/%{allkills})@{n}

/def -Fp2 -mregexp -t'( | \\(.*\\) )zabil.' _ktos_zabil_cosik_licz = \
	/_dodaj_do_kto_zabil %{PL} %;\
	/_dodaj_do_poleglych %{PR}

/def _dodaj_do_zabitych = \
	/if (strstr({L1},".")>=0) \
		/let zabity=$[substr({L1},0,strlen({L1})-1)] %;\
	/else \
		/let zabity=%{L1} %;\
	/endif %;\
	/let zabity=$[substr({zabity},0,13)] %;\
	/if ($(/listvar -s allkilled_%{zabity})=~NULL) \
		/set ownkilled_%{zabity}=0 %;\
		/set allkilled_%{zabity}=0 %;\
	/endif %;\
	/test ++ownkilled_%{zabity} %;\
	/test ++allkilled_%{zabity} %;\
	/test ++ownkills%;\
	/test ++allkills

/def _dodaj_do_poleglych = \
	/if (strstr({L1},".")>=0) \
		/let zabity=$[substr({L1},0,strlen({L1})-1)] %;\
	/else \
		/let zabity=%{L1} %;\
	/endif %;\
	/let zabity=$[substr({zabity},0,13)] %;\
	/if ($(/listvar -s allkilled_%{zabity})=~NULL) \
		/set ownkilled_%{zabity}=0 %;\
		/set allkilled_%{zabity}=0 %;\
	/endif %;\
	/test ++allkilled_%{zabity} %;\
	/test ++allkills

/def _dodaj_do_kto_zabil = \
	/if (strstr({L1},".")>=0) \
		/let zabity=$[substr({L1},0,strlen({L1})-1)] %;\
	/else \
		/let zabity=%{L1} %;\
	/endif %;\
	/let zabity=$[substr({zabity},0,13)] %;\
	/if ($(/listvar -s killer_%{zabity})=~NULL) \
		/set killer_%{zabity}=0 %;\
	/endif %;\
	/test ++killer_%{zabity}

/def zabici = \
	/let po_ile=%{1} %;\
	/if ({po_ile} < 1) \
		/let po_ile=2%;\
	/endif  %;\
	/let linia1=$[strrep("-------------------------+",po_ile-1)] %;\
	/let linia= %;\
	/let cc=0 %;\
	/echo -p #@{BC%kolor_info}#@{n}# +%{linia1}-------------------------+%;\
	/let zabici_lista=$(/listvar -s -mglob allkilled_*) %;\
	/let zabici_lista=$[strcat(zabici_lista," end")] %;\
	/while /let i=$[strstr(zabici_lista," ")]%; /@test i > 0%; /do \
		/let ktory_var=$[substr(zabici_lista,0,i)] %;\
		/let ktory_ile=$(/eval /listvar -v %{ktory_var}) %;\
		/let ktory_nazwa=$[substr(ktory_var,strrchr(ktory_var,"_")+1)] %;\
		/let ktory_ile2=$(/eval /listvar -v ownkilled_%{ktory_nazwa}) %;\
		/if (cc<{po_ile}) \
			/let linia=$[strcat(linia,"|",pad(ktory_nazwa,13),": (",pad(ktory_ile2,3),"/",pad(ktory_ile,4),")")] %;\
			/test ++cc %;\
			/let zabici_lista=$[substr(zabici_lista,i+1)] %;\
		/else \
			/echo -p #@{BC%kolor_info}#@{n}# %{linia}| @{n}%;\
			/let cc=0 %;\
			/let linia= %;\
		/endif %;\
	/done %;\
	/if (cc>0) \
		/echo -p #@{BC%kolor_info}#@{n}# $[strcat(linia,strrep("|             : (        )",po_ile-cc),"|")] @{n}%;\
	/endif %;\
	/let linia=$[strcat("(@{BCmagenta}  ",pad(ownkills,6),"@{n} |")] %;\
	/if (wrapsize > {po_ile}*27+6) \
		/let linia=$[strcat(linia,"@{n}")] %;\
	/endif %;\
	/echo -p #@{BC%kolor_info}#@{n}# +%{linia1}----- W sumie: %{linia}  %;\
	/echo -p #@{BC%kolor_info}#@{n}# +%{linia1}-------------------------+%;\
	/let linia= %;\
	/let cc=0 %;\
	/let zabici_lista=$(/listvar -s -mglob killer_*) %;\
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
			/echo -p #@{BC%kolor_info}#@{n}# %{linia}| @{n}%;\
			/let cc=0 %;\
			/let linia= %;\
		/endif %;\
	/done %;\
	/if (cc>0) \
		/echo -p #@{BC%kolor_info}#@{n}# $[strcat(linia,strrep("|             : (        )",po_ile-cc),"|")] @{n}%;\
	/endif %;\
	/let linia=$[strcat("(@{BCmagenta}  ",pad(allkills,6),"@{n} |")] %;\
	/if (wrapsize > {po_ile}*27+6) \
		/let linia=$[strcat(linia," @{n}")] %;\
	/endif %;\
	/echo -p #@{BC%kolor_info}#@{n}# +%{linia1}----- W sumie: %{linia}  %;\
	/echo -p #@{BC%kolor_info}#@{n}# +%{linia1}-------------------------+@{n}

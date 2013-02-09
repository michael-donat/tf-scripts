/def -mregexp -Fp2 -t'(.*) uciekl(|a) ci.' ktos_mi_uciekl = \
	/set kto_uciekl=%{P1} %;\
	/_pokaz_ucieczke %P1 %;\
	/return substitute(decode_attr("@{BCbg%kolor_main}UCIECZKA ---> %P1 <--- UCIECZKA"))

/def _pokaz_ucieczke = \
	/runne %{*} %;\
	/runnw %{*} %;\
	/runse %{*} %;\
	/runsw %{*} %;\
	/rune  %{*} %;\
	/runw  %{*} %;\
	/runn  %{*} %;\
	/runs  %{*} %;\
	/runu  %{*} %;\
	/rund  %{*} %;\
	/runx  %{*}

/def dobind_war = \
	%{*} %;\
	/f4 empty

/def runne = /def -mglob -aBC%kolor_alarm -Fp2 -t"*%{kto_uciekl} * na polnocny-wschod." runne2 = \
	/echo %%;\
	/test echo(decode_attr("        # # #  "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("          # #  @{BCwhite}%{kto_uciekl} F4"), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("        #   #  "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("      #        "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("    #          "), "BC%kolor_alarm") %%;\
	/echo %%;\
	/beep 1 %%;\
	/f4 /dobind_war ne

/def runnw = /def -mglob -aBC%kolor_alarm -Fp2 -t"*%{kto_uciekl} * na polnocny-zachod." runnw2 = \
	/echo %%;\
	/test echo(decode_attr("   # # #          "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("   # #       @{BCwhite}%{kto_uciekl} F4"), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("   #   #          "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("         #        "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("           #      "), "BC%kolor_alarm") %%;\
	/echo %%;\
	/beep 1 %%;\
	/f4 /dobind_war nw

/def runse = /def -mglob -aBC%kolor_alarm -Fp2 -t"*%{kto_uciekl} * na poludniowy-wschod." runse2 = \
	/echo %%;\
	/test echo(decode_attr("   #           "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("     #         @{BCwhite}%{kto_uciekl} F4"), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("       #   #   "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("         # #   "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("       # # #   "), "BC%kolor_alarm") %%;\
	/echo %%;\
	/beep 1 %%;\
	/f4 /dobind_war se

/def runsw = /def -mglob -aBC%kolor_alarm -Fp2 -t"*%{kto_uciekl} * na poludniowy-zachod." runsw2 = \
	/echo %%;\
	/test echo(decode_attr("           #   "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("         #     @{BCwhite}%{kto_uciekl} F4"), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("   #   #       "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("   # #         "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("   # # #       "), "BC%kolor_alarm") %%;\
	/echo %%;\
	/beep 1 %%;\
	/f4 /dobind_war sw

/def rune = /def -mglob -aBC%kolor_alarm -Fp2 -t"*%{kto_uciekl} * na wschod." rune2 = \
	/echo %%;\
	/test echo(decode_attr("          #    "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("           #   @{BCwhite}%{kto_uciekl} F4"), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("    #########  "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("           #   "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("          #    "), "BC%kolor_alarm") %%;\
	/echo %%;\
	/beep 1 %%;\
	/f4 /dobind_war e

/def runw = /def -mglob -aBC%kolor_alarm -Fp2 -t"*%{kto_uciekl} * na zachod." runw2 = \
	/echo %%;\
	/test echo(decode_attr("     #         "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("    #          @{BCwhite}%{kto_uciekl} F4"), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("   ##########  "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("    #          "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("     #         "), "BC%kolor_alarm") %%;\
	/echo %%;\
	/beep 1 %%;\
	/f4 /dobind_war w

/def runn = /def -mglob -aBC%kolor_alarm -Fp2 -t"*%{kto_uciekl} * na polnoc." runn2 = \
	/echo %%;\
	/test echo(decode_attr("       #       "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("      ###      @{BCwhite}%{kto_uciekl} F4"), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("     # # #     "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("       #       "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("       #       "), "BC%kolor_alarm") %%;\
	/echo %%;\
	/beep 1 %%;\
	/f4 /dobind_war n

/def runs = /def -mglob -aBC%kolor_alarm -Fp2 -t"*%{kto_uciekl} * na poludnie." runs2 = \
	/echo %%;\
	/test echo(decode_attr("       #       "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("       #       @{BCwhite}%{kto_uciekl} F4"), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("     # # #     "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("      ###      "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("       #       "), "BC%kolor_alarm") %%;\
	/echo %%;\
	/beep 1 %%;\
	/f4 /dobind_war s

/def runu = /def -mglob -aBC%kolor_alarm -Fp2 -t"*%{kto_uciekl} * na gore." runu2 = \
	/echo %%;\
	/test echo(decode_attr("     #    #    "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("     #    #    @{BCwhite}%{kto_uciekl} F4"), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("     #    #    "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("     #    #    "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("      ####     "), "BC%kolor_alarm") %%;\
	/echo %%;\
	/beep 1 %%;\
	/f4 /dobind_war u

/def rund = /def -mglob -aBC%kolor_alarm -Fp2 -t"*%{kto_uciekl} * na dol." rund2 = \
	/echo %%;\
	/test echo(decode_attr("     #####     "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("     #    #    "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("     #     #   @{BCwhite}%{kto_uciekl} F4"), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("     #     #   "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("     #    #    "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("     #####     "), "BC%kolor_alarm") %%;\
	/echo %%;\
	/beep 1 %%;\
	/f4 /dobind_war d

/def runx = /def -mglob -aBC%kolor_alarm -Fp2 -t"*%{kto_uciekl} * do wyjscia." runx2 = \
	/echo %%;\
	/test echo(decode_attr("    #   #      "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("     # #       @{BCwhite}%{kto_uciekl} F4"), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("      #        "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("     # #       "), "BC%kolor_alarm") %%;\
	/test echo(decode_attr("    #   #      "), "BC%kolor_alarm") %%;\
	/echo %%;\
	/beep 1 %%;\
	/f4 /dobind_war wyjscie

/def nohunt = /purge -i run*2

/def -Fp666 -aBCyellow -mregexp -t'^(.*(?<!duch).*) uciekl(a|o|) ci\.$' pogon1 = \
/let _tmp=%{P1}%;\
/let _tmp=$[strcat({P1},"|",tolower({P1}))]%;\
/purge pgn_* %;\
/def -Fp666 -mregexp -t"adasdas (wbiega, dasdasdrzac ze strachu|pasdasrzybywa)" pgn_wrocil = /echo -p @{BCwhite,Cbgred}*** @{Cblue,Cbgred}WROCIL GONIONY!!! @{BCwhite,Cbgred}***@{n} %;\
/def -Fp666 -mregexp -t"(%{_tmp}).* (przemyka|podaza|w panice (umyka|wybiega)|szarpiac sie z galeziami przedziera sie)(ja|) na gore.$$" pgn_u = /zwialu %;\
/def -Fp666 -mregexp -t"(%{_tmp}).* (przemyka|podaza|w panice (umyka|wybiega)|szarpiac sie z galeziami przedziera sie)(ja|) na dol.$$" pgn_d = /zwiald %;\
/def -Fp666 -mregexp -t"(%{_tmp}).* (przemyka|podaza|w panice (umyka|wybiega)|szarpiac sie z galeziami przedziera sie)(ja|) na polnoc.$$" pgn_n = /zwialn %;\
/def -Fp666 -mregexp -t"(%{_tmp}).* (przemyka|podaza|w panice (umyka|wybiega)|szarpiac sie z galeziami przedziera sie)(ja|) na poludnie.$$" pgn_s = /zwials %;\
/def -Fp666 -mregexp -t"(%{_tmp}).* (przemyka|podaza|w panice (umyka|wybiega)|szarpiac sie z galeziami przedziera sie)(ja|) na wschod.$$" pgn_e = /zwiale %;\
/def -Fp666 -mregexp -t"(%{_tmp}).* (przemyka|podaza|w panice (umyka|wybiega)|szarpiac sie z galeziami przedziera sie)(ja|) na zachod.$$" pgn_w = /zwialw %;\
/def -Fp666 -mregexp -t"(%{_tmp}).* (przemyka|podaza|w panice (umyka|wybiega)|szarpiac sie z galeziami przedziera sie)(ja|) na polnocny-zachod.$$" pgn_nw = /zwialnw %;\
/def -Fp666 -mregexp -t"(%{_tmp}).* (przemyka|podaza|w panice (umyka|wybiega)|szarpiac sie z galeziami przedziera sie)(ja|) na polnocny-wschod.$$" pgn_ne = /zwialne %;\
/def -Fp666 -mregexp -t"(%{_tmp}).* (przemyka|podaza|w panice (umyka|wybiega)|szarpiac sie z galeziami przedziera sie)(ja|) na poludniowy-wschod.$$" pgn_se = /zwialse %;\
/def -Fp666 -mregexp -t"(%{_tmp}).* (przemyka|podaza|w panice (umyka|wybiega)|szarpiac sie z galeziami przedziera sie)(ja|) na poludniowy-zachod.$$" pgn_sw = /zwialsw

/def zwialw = \
/echo -p -aBCwhite .                    #            %;\
/echo -p -aBCwhite .                  #              %;\
/echo -p -aBCwhite .                #########       %;\
/echo -p -aBCwhite .                  #              %;\
/echo -p -aBCwhite .                    #           


/def zwiald = \
/echo -p -aBCwhite .                VV     VV            %;\
/echo -p -aBCwhite .                 VV   VV               %;\
/echo -p -aBCwhite .                  VV VV       %;\
/echo -p -aBCwhite .                   VVV                %;\
/echo -p -aBCwhite .                    V             


/def zwialu = \
/echo -p -aBCwhite .                    A        %;\
/echo -p -aBCwhite .                   AAA           %;\
/echo -p -aBCwhite .                  AA AA %;\
/echo -p -aBCwhite .                 AA   AA         %;\
/echo -p -aBCwhite .                AA     AA       




/def zwiale = \
/echo -p -aBCwhite .                    #           %;\
/echo -p -aBCwhite .                      #         %;\
/echo -p -aBCwhite .                #########       %;\
/echo -p -aBCwhite .                      #         %;\
/echo -p -aBCwhite .                    #           


/def zwialn = \
/echo -p -aBCwhite .                     #             %;\
/echo -p -aBCwhite .                    ###           %;\
/echo -p -aBCwhite .                   # # #     %;\
/echo -p -aBCwhite .                     #            %;\
/echo -p -aBCwhite .                     #           


/def zwials = \
/echo -p -aBCwhite .                     #              %;\
/echo -p -aBCwhite .                     #              %;\
/echo -p -aBCwhite .                   # # #     %;\
/echo -p -aBCwhite .                    ###     %;\
/echo -p -aBCwhite .                     #         


/def zwialne = \
/echo -p -aBCwhite .                      # # #      %;\
/echo -p -aBCwhite .                        # #      %;\
/echo -p -aBCwhite .                      #   #        %;\
/echo -p -aBCwhite .                    #             %;\
/echo -p -aBCwhite .                  #       


/def zwialse = \
/echo -p -aBCwhite .                  #           %;\
/echo -p -aBCwhite .                    #             %;\
/echo -p -aBCwhite .                      #   #      %;\
/echo -p -aBCwhite .                        # #      %;\
/echo -p -aBCwhite .                      # # #


/def zwialsw = \
/echo -p -aBCwhite .                          #                 %;\
/echo -p -aBCwhite .                        #                 %;\
/echo -p -aBCwhite .                  #   #                %;\
/echo -p -aBCwhite .                  # #                %;\
/echo -p -aBCwhite .                  # # #           


/def zwialnw = \
/echo -p -aBCwhite .                  # # #            %;\
/echo -p -aBCwhite .                  # #             %;\
/echo -p -aBCwhite .                  #   #            %;\
/echo -p -aBCwhite .                        #             %;\
/echo -p -aBCwhite .                          #             

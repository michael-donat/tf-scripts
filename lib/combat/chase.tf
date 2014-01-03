/def -Fp10 -mregexp -t'^([^()]*)(?: (.*)|) uciekl(|a|o) ci\.$' chase_event_1 = \
    /substitute -p @{Cbgyellow}@{Cred}      --------       %{P1} - UCIEKA      --------       .%;\
    /set chased=%{P1}%;\
    /chase_prepare

/def chase_prepare = \
    /eval /def -Fp1 -mregexp -t'^(?i)(%{chased}) podaza (?:na |)(.*)\.' chase_event_2 = /chase_prompt%;\
    /eval /def -Fp3 -mregexp -t'^(?i)(%{chased}) w panice wybiega (?:na |)(.*)\.' chase_event_3 = /chase_prompt%;\
    /eval /def -Fp3 -mregexp -t'^(?i)(%{chased}) przemyka sie (?:na |)(.*)\.' chase_event_4 = /chase_prompt%;\
    /eval /def -Fp3 -mregexp -t'^(?i)(%{chased}) w panice umyka (?:na |)(.*)\.' chase_event_5 = /chase_prompt%;\
    /eval /def -Fp3 -mregexp -t'(?i)(%{chased})(?: i .* |, .* | )podazaja (?:na |)(.*)\.' chase_event_6 = /chase_prompt


/def chase_prompt = \
    /let _uciekl=$[toupper({P1})] %;\
    /let _kierunek=$[replace(".", "", {P2})] %;\
    /if (_kierunek =~ 'polnoc') \
        /echo -p .                #         %;\
        /echo -p .               ###        %;\
        /echo -p .              # # #       %;\
        /echo -p .                #         %;\
        /echo -p .                #         @{B}%{_uciekl}@{n}  %;\
    /elseif (_kierunek =~ 'polnocny-wschod') \
        /echo -p .            # # # #       %;\
        /echo -p .                # #       %;\
        /echo -p .              #   #       %;\
        /echo -p .            #     #       %;\
        /echo -p .          #               @{B}%{_uciekl}@{n}  %;\
    /elseif (_kierunek =~ 'wschod') \
        /echo -p .                #         %;\
        /echo -p .                 #        %;\
        /echo -p .        # # # # # #       %;\
        /echo -p .                 #        %;\
        /echo -p .                #         @{B}%{_uciekl}@{n}  %;\
    /elseif (_kierunek =~ 'poludniowy-wschod') \
        /echo -p .         #                %;\
        /echo -p .           #     #        %;\
        /echo -p .             #   #        %;\
        /echo -p .               # #        %;\
        /echo -p .           # # # #        @{B}%{_uciekl}@{n}  %;\
    /elseif (_kierunek =~ 'poludnie') \
        /echo -p .               #          %;\
        /echo -p .               #          %;\
        /echo -p .             # # #        %;\
        /echo -p .              ###         %;\
        /echo -p .               #          @{B}%{_uciekl}@{n}  %;\
    /elseif (_kierunek =~ 'poludniowy-zachod') \
        /echo -p .                #         %;\
        /echo -p .        #     #           %;\
        /echo -p .        #   #             %;\
        /echo -p .        # #               %;\
        /echo -p .        # # # #           @{B}%{_uciekl}@{n}  %;\
    /elseif (_kierunek =~ 'zachod') \
        /echo -p .            #             %;\
        /echo -p .          #               %;\
        /echo -p .        # # # # # #       %;\
        /echo -p .          #               %;\
        /echo -p .            #             @{B}%{_uciekl}@{n}  %;\
    /elseif (_kierunek =~ 'polnocny-zachod') \
        /echo -p .        # # # #           %;\
        /echo -p .        # #               %;\
        /echo -p .        #   #             %;\
        /echo -p .        #     #           %;\
        /echo -p .                #         @{B}%{_uciekl}@{n}  %;\
    /elseif (_kierunek =~ 'gore') \
        /echo -p .               ###        %;\
        /echo -p .              #   #       %;\
        /echo -p .             #  #  #      GORA%;\
        /echo -p .              #   #       %;\
        /echo -p .               ###        @{B}%{_uciekl}@{n}  %;\
    /elseif (_kierunek =~ 'dol') \
        /echo -p .              #   #       %;\
        /echo -p .               # #        %;\
        /echo -p .                #         DOL%;\
        /echo -p .               # #        %;\
        /echo -p .              #   #       @{B}%{_uciekl}@{n}  %;\
   /else \
        /echo -p .                                      %;\
        /echo -p .                                      %;\
        /echo -p .      $[toupper({_kierunek})]         %;\
        /echo -p .                                      %;\
        /echo -p .                          @{B}%{_uciekl}@{n}  %;\
    /endif

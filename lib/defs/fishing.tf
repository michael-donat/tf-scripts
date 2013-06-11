/def r1 = zarzuc siec
/def r2 = zawies kotwiczke na wedce%;zawies rybke na wedce%;zarzuc wedke
/def r3 = /dd ryby%;sprzedaj je%;mmm
/def r0 = wyciagnij siec%;wyciagnij wedke


/def -mregexp -p2 -t'Sprawnie wyciagasz z wody siec rybacka' ryba0 =    /test _fast_bind_set(decode_attr("     -- SIEC  --     ", "BCbgblue"),'zarzuc siec',1)
/def -mregexp -p2 -t'Zawieszasz kotwiczke na ' ryba1 =                  /test _fast_bind_set(decode_attr("   -- PRZYNETA  --   ", "BCbgblue"),'zawies rybke na wedce',1)
/def -mregexp -p2 -t'A na czym chcesz zawiesic przynete?' ryba2 =       /test _fast_bind_set(decode_attr("   -- KOTWICZKA  --  ", "BCbgblue"),'zawies kotwiczke na wedce',1)
/def -mregexp -p2 -t'Zawieszasz niewielka rybke na kotwiczce*' ryba3 =  /test _fast_bind_set(decode_attr("   --   ZARZUC   --  ", "BCbgblue"),'zarzuc wedke',1)
/def -mregexp -p2 -t'Nagle dostrzegasz, ze zanurzony w wodzie' ryba4 =  /test _fast_bind_set(decode_attr("   --   ZATNIJ   --  ", "BCbgred"), 'zatnij rybe na wedce',1)
/def -mregexp -p2 -t'Wyciagasz zlapana rybe na powierzchnie' ryba5 =    /test _fast_bind_set(decode_attr("   --   BINGO!   --  ", "BCbggreen"), 'zawies rybke na wedce %%; ocen rybe %%; /dp ryby',1)
/def -mregexp -p2 -t'Sznurek .* opada swobodnie' ryba6 =                /test _fast_bind_set(decode_attr("   --   ZAWIES   --  ", "BCbgblue"), 'zawies rybke na wedce',1)
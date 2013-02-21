/def zr0 = rozkaz druzynie zaslonic ciebie%;popatrz opiekunczo na siebie%;wskaz siebie jako cel obrony
/def z0 = popatrz opiekunczo na siebie%;\wskaz siebie jako cel obrony

/def zaslon = \
    /if ({2} =~ "") \
        /send zaslon %{1}%;\
    /else \
        /send zaslon %{1} przed %{-1}%;\
    /endif

/alias z /zaslon %{*}

/def zaslon_przed = \
    /send zaslon przed %{*}

/alias zp /zaslon_przed %{*}

/alias zz /send przestan zaslaniac
/alias zzz /send przestan kryc sie za zaslona



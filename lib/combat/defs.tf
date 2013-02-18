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

/def key_esc_nkp1=/z1
/def key_esc_nkp2=/z2
/def key_esc_nkp3=/z3
/def key_esc_nkp4=/z4
/def key_esc_nkp5=/z5
/def key_esc_nkp6=/z6
/def key_esc_nkp7=/z7
/def key_esc_nkp8=/z8
/def key_esc_nkp9=/z9

/def _bind_kb_key_nkpEquals = ws

/def key_f6 = ob wglebienia%;ob mozaike%; wcisnij kafelek%;przekrec rubin%;ob oltarz%;ob sarkofag
/def klucz = zloz pierwsza polkule z druga polkula
/def brama = otworz brame kula

/def -t'Zatopione w mroku, krecone schody.' _blavi_telepyrt = /_map_teleport 410c7658-9fc9-11e2-85de-9c4e368dac0c
/def -t'Sala ceremonialna.' _blavi_telepyrt2 = /_map_teleport 7d3ece6c-cbd1-11e2-a5b3-9c4e368dac0c

/def -mregexp -t'\. (.*) oczy jarza sie delikatna poswiata' _exp_blavi_smok = \
    /let _exp_blavi_smok_color=$[tolower({P1})]%;\
    /def _exp_blavi_smok_action=/send przestaw figurke smoka na %{_exp_blavi_smok_color} pole

/def -mregexp -t' oczy gryfa lsnia niebezpiecznie' _exp_blavi_gryf = \
    /let _exp_blavi_gryf_color=$[tolower({PL})]%;\
    /def _exp_blavi_gryf_action=/send przestaw figurke gryfa na %{_exp_blavi_gryf_color} pole

/def -mregexp -t'Jego ([a-zA-Z]+).* oczy zwrocone sa gdzies w przestrzen' _exp_blavi_jednorozec = \
    /let _exp_blavi_jednorozec_color=%{P1}%;\
    /def _exp_blavi_jednorozec_acti`on=/send przestaw figurke jednorozca na %{_exp_blavi_jednorozec_color} pole

/def figurki = \
    /_exp_blavi_smok_action%;\
    /_exp_blavi_gryf_action%;\
    /_exp_blavi_jednorozec_action

/def -t'Olbrzymi oltarz zajmuje centrum tej niezwyklej komnaty. *' _exp_blavi_kielich = \
    /def c = postaw kielich na oltarzu%;\
    /echo -p @{Cgreen}[CUSTOM] /c = postaw kielich na oltarzu

/def -t'Marmurowy kloc wyrasta z ziemi, pokryty mchem i zielonym zarostem, rozszerzajac sie do sporej*' _exp_blavi_zagadka = \
    /def c = /figurki%;\
    /echo -p @{Cgreen}[CUSTOM] /c = /figurki
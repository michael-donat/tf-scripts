/def key_f6 = ob wglebienia%;ob mozaike%; wcisnij kafelek%;przekrec rubin%;ob oltarz%;ob sarkofag
/def klucz = zloz pierwsza polkule z druga polkula
/def brama = otworz brame kula



/def -mregexp -t'\. (.*) oczy jarza sie delikatna poswiata' _exp_blavi_smok = \
    /let _exp_blavi_smok_color=$[tolower({P1})]%;\
    /def _exp_blavi_smok_action=/send przestaw figurke smoka na %{_exp_blavi_smok_color} pole

/def -mregexp -t' oczy gryfa lsnia niebezpiecznie' _exp_blavi_gryf = \
    /let _exp_blavi_gryf_color=$[tolower({PL})]%;\
    /def _exp_blavi_gryf_action=/send przestaw figurke gryfa na %{_exp_blavi_gryf_color} pole

/def -mregexp -t'Jego (.*) niczym slonce oczy zwrocone sa gdzies w przestrzen' _exp_blavi_jednorozec = \
    /let _exp_blavi_jednorozec_color=%{P1}%;\
    /def _exp_blavi_jednorozec_action=/send przestaw figurke jednorozca na %{_exp_blavi_jednorozec_color} pole

/def figurki = \
    /_exp_blavi_smok_action%;\
    /_exp_blavi_gryf_action%;\
    /_exp_blavi_jednorozec_action



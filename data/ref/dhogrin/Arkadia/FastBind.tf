/def FBDoIt = /let FBComm %{*}%; /echo -p @{BxCyellow}    *  F2 - %{FBComm}  *%; /def key_f2 = %{FBComm}

/def -F -mregexp -t'Probujesz otworzyc (.*), ale nie udaje ci sie to.' _FastBindBrama = /FBDoIt uderz we wrota
/def -F -mregexp -t' wspina sie po scianie jaru\.' _FastBindShaerraweddUp = /FBDoIt wespnij sie po scianie	

;/def -F -mregexp -t'^Waski przesmyk.$' _FB_Baccala_Luk1 = /echo -p @{BxCyellow}    *  F2 - wejdz na luk  *%; /def key_f2 = wejdz na luk
;/def -F -mregexp -t'^Na luku skalnym.$' _FB_Baccala_Luk2 = /echo -p @{BxCyellow}    *  F2 - zeskocz na placyk  *%; /def key_f2 = zeskocz na placyk
;/def -F -mregexp -t'^Zaulek heliktytowy.$' _FB_Baccala_Luk3 = /echo -p @{BxCyellow}    *  F2 - wejdz na luk  *%; /def key_f2 = wejdz na luk
;/def -F -mregexp -t'^Wieza alarmowa.$' _FB_Baccala_schodki1 = /echo -p @{BxCyellow}    *  F2 - wejdz po schodkach  *%; /def key_f2 = wejdz po schodkach
;/def -F -mregexp -t'^Na pietrze.$' _FB_Baccala_schodki2 = /echo -p @{BxCyellow}    *  F2 - zejdz po schodkach  *%; /def key_f2 = zejdz po schodkach


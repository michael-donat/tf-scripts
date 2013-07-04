/set fastbindkey=_bind_kb_key_nkpTimes

/def _fast_bind_set = \
    /beep%;\
    /set _fast_bind_label=%{1}%;\
    /if ({3}==1) \
        /def %{fastbindkey} = %{2}%%;/_fast_bind_clear%;\
    /else \
        /def %{fastbindkey} = %{2}%;\
    /endif

/def _fast_bind_clear = \
    /set _fast_bind_label=%;\
    /def %{fastbindkey}=

/def key_esc_nkp* = /_fast_bind_clear

/def %{fastbindkey}=

; ------------------------------------------------------------------------------
; fastbind triggers
; ------------------------------------------------------------------------------

/def -ab -t'Probujesz otworzyc *, ale nie udaje ci sie to.' _fast_bind_trigger_1 = \
    /let label=$[strcat(decode_attr(" -- OTWORZ BRAME --  ", "BCbgblue"), "  ")]%;\
    /test _fast_bind_set({label}, "uww", 1)

/def -ab -t'Nie jestes zbyt pewny swojej umiejetnosci latania...' _fast_bind_trigger_2 = \
    /let label=$[strcat(decode_attr("  --  WYSUN MOST  -- ", "BCbgblue"), "  ")]%;\
    /test _fast_bind_set({label}, "pociagnij linke%%;uderz w dzwon", 1)

/def -ab -t'* przybija do brzegu.' _fast_bind_trigger_3 = \
    /let label=$[strcat(decode_attr("  --   STATEK   --   ", "BCbgblue"), "  ")]%;\
    /test _fast_bind_set({label}, "mm%%;wns", 1)

/def -ab -t'* schodzi z * na brzeg.' _fast_bind_trigger_4 = \
    /let label=$[strcat(decode_attr("  --   ZEJDZ    --   ", "BCbgblue"), "  ")]%;\
    /test _fast_bind_set({label}, "mm%%;zzs", 1)

/def -ab -t'Rany! Wali sie wszystko powoli!' _fast_bind_trigger_5 = \
    /let label=$[strcat(decode_attr("  -- SZKATULKA  --   ", "BCbgblue"), "  ")]%;\
    /test _fast_bind_set({label}, "zajrzyj do szkatulki", 0)

/def -ab -t'W szkatulce znajdujesz *, ktore szybko zabierasz.' _fast_bind_trigger_6 = \
    /_fast_bind_clear

/def -t'Siegasz * dobywajac z niej dlugiego krwistego sztyletu.' _krwiak_prompt_button = \
    /let label=$[strcat(decode_attr("  --   TRUJ    --   ", "BCbgblue"), "  ")]%;\
    /test _fast_bind_set({label}, "nacisnij przycisk sztyletu", 1)

/def -t'* wiec trucizna musi juz plonac  w * zylach.' _krwiak_prompt_done = \
    /let label=$[strcat(decode_attr("  --   OK    --   ", "BCbggreen"), "  ")]%;\
    /test _fast_bind_set({label}, "/kreww", 1)




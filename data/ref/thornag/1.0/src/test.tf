/def showme = /test $[fake_recv({*})]

/def testInfoEvents = \
    /showme Mowisz w jezyku Krasnoludow Mahakamskich: Nooo%;\
    /showme Mowisz: Noooo%;\
    /showme Paskudny goblin mowi: Spieprzaj stad baranie!%;\
    /showme Trebhar mowi do ciebie: Naramiennik nie nadaje sie do naprawy.%;\
    /showme Kiliana mowi do Groda w jezyku Krasnoludow Mahakamskich: Dobrze zes sie spisal, czas cobys klamre dostal od Dramliego.%;\
    /showme Kiliana mowi do ciebie w jezyku Krasnoludow Mahakamskich: Dobrze zes sie spisal, czas cobys klamre dostal od Dramliego.%;\

/def testTeam = \
    /showme Druzyne prowadzi Hunvert i oprocz ciebie sa w niej jeszcze: Varriz i Yrdan.

/def testTeamHealth = \
    /showme Jestes lekko ranny.%;\
    /showme Varriz jest w dobrym stanie.%;\
    /showme Yrdan jest w zlej kondycji.%;\
    /showme Ursa jest w dobrym stanie.%;\
    /showme Brodaty pukacz jest ciezko ranny.

/def testCombatEvents = \
    /showme Brodaty pukacz atakuje cie!%;\
    /showme Maly kudlaty barbegazi umarl.%;\
    /showme Zabiles malego kudlatego barbegazi.%;\
    /showme Uderzenie jest tak silne, z e agresywny goblin bezwiednie opuszcza drewniana wielka maczuge.%;\
    /showme Hunvert zrecznie zaslania Yrdana przed ciosami wscieklego pukacza.%;\
    /showme Zrecznie zaslaniasz Yrdana przed ciosami wscieklego pukacza.%;\
    /showme Hunvert zrecznie zaslania cie przed ciosami wscieklego pukacza.%;\
    /showme Varriz wspiera Hunverta w walce z potwornym wysokim goblinem.%;\
    /showme Nie jestes jeszcze gotow do wykonania kolejnego manewru.%;\
    /showme Probujesz zaslonic Hunverta przed ciosami szkaradnego wysokiego goblina, jednak nie jestes w stanie tego uczynic.%;\
    /showme Uderzenie jest tak silne, ze bezwiednie puszczasz ciezki krotki topor.%;\
    /showme Ciezka wielka tarcza rozpada sie!%;\
    /showme Ciezka wielka tarcza peka!

/def testHitsWKS = \
    /showme Wykorzystujac brak broni u przeciwnika, w mgnieniu oka wyprowadzasz cios runiczna dluga halabarda mierzac w duzego kudlatego barbegazi. Wypracowanym uderzeniem trafiasz go w kudlate cialo, pozostawiajac krwawiace zadrapanie.%;\
    /showme Wykorzystujac brak broni u przeciwnika, z wyuczona wprawa wyprowadzasz cios runiczna dluga halabarda mierzac w duzego kudlatego barbegazi. Wypracowanym uderzeniem trafiasz go w kudlate cialo, zadajac smiertelne obrazenia.%;\
    /showme Wykorzystujac brak broni u przeciwnika, blyskawicznie wyprowadzasz cios runiczna dluga halabarda mierzac w malego kudlatego barbegazi. Wypracowanym uderzeniem trafiasz go w kudlate cialo, zadajac smiertelne obrazenia.%;\
    /showme Wykorzystujac brak broni u przeciwnika, z wyuczona wprawa wyprowadzasz cios runiczna dluga halabarda mierzac w duzego kudlatego barbegazi. Wypracowanym uderzeniem trafiasz  go w kudlate cialo, pozostawiajac krwawiace zadrapanie.


/def testHits = \
    /showme Agresywny goblin ledwo muska cie w noge.%;\
    /showme Agresywny goblin lekko rani cie w noge.%;\
    /showme Agresywny goblin rani cie w noge.%;\
    /showme Agresywny goblin powaznie rani cie w noge.%;\
    /showme Agresywny goblin bardzo ciezko rani cie w noge.%;\
    /showme Agresywny goblin masakruje cie w noge.%;\
    \
    /showme Varriz ledwo muska cie w noge.%;\
    /showme Varriz lekko rani cie w noge.%;\
    /showme Varriz rani cie w noge.%;\
    /showme Varriz powaznie rani cie w noge.%;\
    /showme Varriz bardzo ciezko rani cie w noge.%;\
    /showme Varriz masakruje cie w noge.%;\
    \
    /showme Agresywny tlusty goblin ledwo muska cie w noge.%;\
    /showme Agresywny tlusty goblin lekko rani cie w noge.%;\
    /showme Agresywny tlusty goblin rani cie w noge.%;\
    /showme Agresywny tlusty goblin powaznie rani cie w noge.%;\
    /showme Agresywny tlusty goblin bardzo ciezko rani cie w noge.%;\
    /showme Agresywny tlusty goblin masakruje cie w noge.%;\
    \
    /showme Probujesz trafic brodatego pukacza ciezkim krotkim toporem, lecz ten unika twojego ciosu.%;\
    /showme Wykonujesz zamaszyste ciecie ciezkim krotkim toporem mierzac w brodatego pukacza, lecz ten zbija je z linii ataku drewniana kolczasta maczuga.%;\
    /showme Wykorzystujac dogodny moment probujesz wyprowadzic celne ciecie ciezkim krotkim toporem w wscieklego pukacza, lecz ten zwinnie unika ciosu.%;\
    /showme Wykorzystujac dogodny moment wyprowadzasz celne ciecie ciezkim krotkim toporem w brodatego pukacza, lecz ten zbija cios drewniana kolczasta maczuga.%;\
    /showme Duzemu kudlatemu barbegazi nie udaje sie trafic ciebie dlugimi zoltymi zebami.%;\
    \
    /showme Wykorzystujac dogodny moment wyprowadzasz celne ciecie gwiezdnym toporem w niebezpieczne swietliste widmo, lecz to oslania sie w pore polyskliwa trojkatna tarcza.%;\
    /showme Wykorzystujac dogodny moment wyprowadzasz celne ciecie gwiezdnym toporem w niebezpieczne swietliste widmo, powaznie raniac je w korpus.

/def testHealth = \
    /showme Jestes w swietnej kondycji.%;\
    /showme Jestes w dobrym stanie.%;\
    /showme Jestes lekko ranny.%;\
    /showme Jestes ranny.%;\
    /showme Jestes w zlej kondycji.%;\
    /showme Jestes ciezko ranny.%;\
    /showme Jestes ledwo zywy.%;\
    \
    /showme Varriz jest w swietnej kondycji.%;\
    /showme Varriz jest w dobrym stanie.%;\
    /showme Varriz jest lekko ranny.%;\
    /showme Varriz jest ranny.%;\
    /showme Varriz jest w zlej kondycji.%;\
    /showme Varriz jest ciezko ranny.%;\
    /showme Varriz jest ledwo zywy.%;\
    \
    /showme Ursa jest w swietnej kondycji.%;\
    /showme Ursa jest w dobrym stanie.%;\
    /showme Ursa jest lekko ranna.%;\
    /showme Ursa jest ranna.%;\
    /showme Ursa jest w zlej kondycji.%;\
    /showme Ursa jest ciezko ranna.%;\
    /showme Ursa jest ledwo zywa.%;\
    \
    /showme Brodaty pukacz jest w swietnej kondycji.%;\
    /showme Brodaty pukacz jest w dobrym stanie.%;\
    /showme Brodaty pukacz jest lekko ranny.%;\
    /showme Brodaty pukacz jest ranny.%;\
    /showme Brodaty pukacz jest w zlej kondycji.%;\
    /showme Brodaty pukacz jest ciezko ranny.%;\
    /showme Brodaty pukacz jest ledwo zywy.%;\
    \
    /showme Dziwna zmora jest w swietnej kondycji.%;\
    /showme Dziwna zmora jest w dobrym stanie.%;\
    /showme Dziwna zmora jest lekko ranna.%;\
    /showme Dziwna zmora jest ranna.%;\
    /showme Dziwna zmora jest w zlej kondycji.%;\
    /showme Dziwna zmora jest ciezko ranna.%;\
    /showme Dziwna zmora jest ledwo zywa.%;\
    \
    /showme Agresywny wysoki goblin jest w swietnej kondycji.%;\
    /showme Agresywny wysoki goblin jest w dobrym stanie.%;\
    /showme Agresywny wysoki goblin jest lekko ranny.%;\
    /showme Agresywny wysoki goblin jest ranny.%;\
    /showme Agresywny wysoki goblin jest w zlej kondycji.%;\
    /showme Agresywny wysoki goblin jest ciezko ranny.%;\
    /showme Agresywny wysoki goblin jest ledwo zywy.%;\
    \
    /showme Wielka straszna zmora jest w swietnej kondycji.%;\
    /showme Wielka straszna zmora jest w dobrym stanie.%;\
    /showme Wielka straszna zmora jest lekko ranna.%;\
    /showme Wielka straszna zmora jest ranna.%;\
    /showme Wielka straszna zmora jest w zlej kondycji.%;\
    /showme Wielka straszna zmora jest ciezko ranna.%;\
    /showme Wielka straszna zmora jest ledwo zywa.
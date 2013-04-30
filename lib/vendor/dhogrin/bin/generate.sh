g++ -O2 mc.cpp -o mc
g++ -O2 ok.cpp -o ok
g++ -O2 sc.cpp -o sc
g++ -O2 se.cpp -o se
g++ -O2 ohm.cpp -o ohm
g++ -O2 ohmk.cpp -o ohmk
g++ -O2 wr.cpp -o wr
./mc < ../raw/listy/MCLista > MC.tf
./ok < ../raw/listy/OKLista > OK.tf
./sc < ../raw/listy/SCLista > SC.tf
./se < ../raw/listy/SELista > SE.tf
./ohm < ../raw/listy/OHMLista > OHM.tf
./ohmk < ../raw/listy/OHMkLista > OHMk.tf
./wr < ../raw/listy/WRLista > WR.tf
mv *.tf ../Arkadia/enemies/
/*
 Skrypt generujący plik tf kolorujący wrogów.
 Użycie:
 ./mc < ListaWrogow > MC.tf
 ListaWrogow powinna miec postac:
    "Zly brzydki elf Uglum
    Fajny ciekawy krasnolud Dhogrin
    (...)"
*/

#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <string>
using namespace std;

int main()
{
    int n=0;
    cout << "/set OHMsign=@{BxCyellow}(@{BxCmagenta}~OHM~@{BxCyellow})@{n}\n";
    while(cin.good())
    {
	char first;
	string a, b, c, d;
	cin >> first;
	cin >> a;
	cin >> b;
	cin >> c;
	cin >> d;
	cout << "/def -Fp3 -mregexp -t'((" << first <<"|" << char(first+32)<<")"<<a<<" "<<b<<" "<<c<<"|"<<d<<")([*,.\\] ]|$)' _ohm_kolorek_"<<n<<" = /substitute -p @{}%{PL}%{P1}%{OHMsign}%{P3}%{PR}\n";
	n++;
    }
        
}
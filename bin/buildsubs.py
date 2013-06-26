#!/usr/bin/python -O

import sys, getopt, glob, os

class Callbacks:

    counter = 0

    def getLine(self, type, *args):
        self.counter += 1
        return getattr(self, 'line'+type)(*args)

    def getFile(self, type, subs):
        self.counter += 1
        header = getattr(self, 'header'+type)()
        reply = header+"\n"
        reply += "\n".join(subs)
        return reply

    def headerWR(self):
        return """\
/set WRsign=@{BxCyellow}(@{BxCred}~WR~@{BxCyellow})@{n}
/def _WR_player_sub = \\
    /substitute -p @{}%{PL}%{P1}%{WRsign}%{P4- }%{PR}%;\\
    /if ({P3}=~"." | {P3}=~",") \
        /let target=$(/_odmien_M_B %{P1})%;\\
        /eval /def key_f6 = /zabij %{target}%;\\
    /endif
"""

    def lineWR(self, p1, p2, r, i):
        return "/def -Fp3 -mregexp -t'(("+p1[:1].lower()+"|"+p1[:1].upper()+")"+p1[1:]+" "+p2+" (?:mutant|mutantka|"+r+")|"+i+")([*,.\] ]|$)' _player_sub_"+str(self.counter)+" = /_WR_player_sub"

    def lineOK(self, p1, p2, r, i):
        return "/def -Fp3 -mregexp -t'(("+p1[:1].lower()+"|"+p1[:1].upper()+")"+p1[1:]+" "+p2+" "+r+"|"+i+")([*,.\] ]|$)' _player_sub_"+str(self.counter)+" = /_OK_player_sub"

    def headerMC(self):
        return "/set MCsign=@{BxCyellow}(@{BxCred}~MC~@{BxCyellow})@{n}"

    def lineMC(self, p1, p2, r, i):
        return "/def -Fp3 -mregexp -t'(("+p1[:1].lower()+"|"+p1[:1].upper()+")"+p1[1:]+" "+p2+" (?:mutant|mutantka|"+r+")|"+i+")([*,.\] ]|$)' _player_sub_"+str(self.counter)+" = /substitute -p @{}%{PL}%{P1}%{MCsign}%{P4- }%{PR}"

    def headerOHM(self):
        return "/set OHMsign=[OHM] @{n}"

    def lineOHM(self, p1, p2, r, i):
        return "/def -Fp3 -mregexp -t'(("+p1[:1].lower()+"|"+p1[:1].upper()+")"+p1[1:]+" "+p2+" "+r+"|"+i+")([*,.\] ]|$)' _player_sub_"+str(self.counter)+" = /substitute -p @{}%{PL}%{P1}%{OHMsign}%{P4- }%{PR}"

    def headerSC(self):
        return "/set SCsign=@{BxCyellow}(@{BxCgreen}~SC~@{BxCyellow})@{n}"

    def lineSC(self, p1, p2, r, i):
        return "/def -Fp3 -mregexp -t'(("+p1[:1].lower()+"|"+p1[:1].upper()+")"+p1[1:]+" "+p2+" "+r+"|"+i+")([*,.\] ]|$)' _player_sub_"+str(self.counter)+" = /substitute -p @{}%{PL}%{P1}%{SCsign}%{P4- }%{PR}"

    def headerOK(self):
        return """
/set OKsign=@{BxCyellow}(@{BxCred}~OK~@{BxCyellow})@{n}
/def _OK_player_sub = \\
    /substitute -p @{}%{PL}%{P1}%{OKsign}%{P4- }%{PR}%;\\
    /echo 1: %{P1}%;\\
    /echo 2: %{P2}%;\\
    /echo 3: %{P3}%;\\
    /echo 4: %{P4}%;\\
    /echo 5: %{P5}%;\\
    /if ({P4}=~"." | {P4}=~",") \
        /let target=$(/_odmien_M_B %{P1})%;\\
        /eval /def key_f6 = /zabij %{target}%;\\
    /endif
"""


def usage():
    print 'buildsubs --source= --destination='

def main(argv):
    opts, args = getopt.getopt(argv[1:], "", ["source=", "destination="])

    callbacks = Callbacks()

    source = None
    destination = None
    for o, a in opts:
        if o == '--source':
            source = a
        if o == '--destination':
            destination = a

    if source is None or destination is None:
        return usage()

    for path in glob.glob(source+'/*.db'):
        filename = os.path.normpath(path)
        print 'Reading ' + filename
        type = os.path.splitext(os.path.basename(filename))[0]
        lines = []
        for line in file(filename):
            p1, p2, r, i = line.split()
            lines.append(callbacks.getLine(type, p1, p2, r, i))
        contents = callbacks.getFile(type, lines)
        writeFile =  destination+'/'+type+'.db'
        print 'Writing ' + writeFile

        with open(writeFile, 'w+') as f:
            f.write(contents)
        print '-----'

if __name__ == '__main__':
    main(sys.argv)

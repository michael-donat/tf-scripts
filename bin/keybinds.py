__author__ = 'thornag'


shiftValue  = '0x220000'
ctrlValue   = '0x240000'
altValue    = '0x280000'

keyStartValue = 30

shiftStartSequence = 200
ctrlStartSequence = 100
altStartSequence = 300

def printBlock(key, type, value):
    print '<key>0x%s-%s</key>' % (key, type)
    print '<dict>'
    print ' <key>Action</key>'
    print ' <integer>10</integer>'
    print ' <key>Text</key>'
    print ' <string>[%s~</string>' % value
    print '</dict>'

for index in range(0, 10):
    printBlock(keyStartValue+index,ctrlValue,ctrlStartSequence+index)
for index in range(0, 10):
    printBlock(keyStartValue+index,shiftValue,shiftStartSequence+index)
for index in range(0, 10):
    printBlock(keyStartValue+index,altValue,altStartSequence+index)
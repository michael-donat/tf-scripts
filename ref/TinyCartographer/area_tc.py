#/usr/bin/env python

# TinyCartographer base room module.
# Author: Dra <drakener@o2.pl>
# License: GNU GPL v 3.0 or later
# http://www.gnu.org/licenses/gpl.txt

path_to_maps = 'atlas/'

from re import split

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

class Room:
  
  def __init__ (self, x, y, exits={}, color="grey", description="\n"):
    self.x = x
    self.y = y
    self.exits = exits
    self.color = color
    self.description = description

  def setColor (self, color):
    self.color = color

  def getxy (self):
    return (self.x, self.y)
  
  def setDescription (self, s):
    self.description = s + '\n'

  def setExit (self, which, x, y):
    self.exits[which] = (x, y)
  
  def rmExit (self, s):
    del self.exits[s]

  def setPos (self, x, y):
    self.x = x
    self.y = y

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

class Area:
  
  def __init__(self, description = ""):
    self.map = {}  # hash containing (x, y) as key and room as value
    self.description = "Area"

  def add (self, r):
    self.map[(r.x, r.y)] = r

  def remove (self, x, y):
    del self.map[(x, y)]

  def rmExit (self, x, y, s):
    try:
      r = self.map[(x, y)]
      l = self.map[r.exits[s]]
      r.rmExit(s)
      for k in l.exits:
        if l.exits[k] == (x, y): del l.exits[k]
    except: pass

  def moveAll (self, x, y):
    for k in self.map:
      r = self.map[k]
      for e in r.exits:
	r.exits[e] = (r.exits[e][0] + x, r.exits[e][1] + y)
      r.x += x
      r.y += y

# each room in file looks as this:
# X Y; {exits}; color; description
  def load (self, filename):
    global path_to_maps
    file = path_to_maps + filename
    self.description = filename
    try:
      reader = open (file, 'r')
    except:
      print "Exception while loading file: ", file
      return -1
    for i in reader:
      s = split ("; ", i)
      pos = split(" ", s[0])
      x = int(pos[0])
      y = int(pos[1])
      exits = eval(s[1])
      if len(s) > 3: d = s[3]
      else: d = '\n'
      r = Room (x, y, exits, s[2], d)
      self.map[(x, y)] = r
    reader.close()
  
  def save (self, filename):
    global path_to_maps
    file = path_to_maps + filename
    self.description = filename
    writer = open (file, 'w')
    for k in self.map:
      i = self.map[k]
      writer.write("%s %s; %s; %s; %s" % (i.x, i.y, repr(i.exits), i.color, i.description))
    writer.close()

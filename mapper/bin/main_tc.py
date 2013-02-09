#!/usr/bin/env python

# TinyCartographer main mapper class.
# Author: Dra <drakener@o2.pl>
# License: GPL v 3.0 or later
# http://www.gnu.org/licenses/gpl.txt

path_to_fifo = '../io.stream'

import thread
from area_tc import *
from drawer_tc import *
from re import split
from sys import exit

class TinyCartographer:

  def __init__(self):
# actual position 
    self.ax = 510
    self.ay = 510
# last position    
    self.lx = 510
    self.ly = 510
# just try to guess
    self.colors = ["grey", "darkgreen", "blue", "yellow", "cyan", "red", "orange"]
    self.colorindex = 0
    self.color = self.colors[self.colorindex]
    self.area = Area()
    self.drawer = Drawer()
# finally, start to listening commands and events
    thread.start_new_thread (self.getCommand, ())
    self.drawer.root.mainloop()
  
  def getCommand(self):
    global path_to_fifo
    while 1:
# reads one line from named pipe
      reader = open (path_to_fifo, 'r')
      cmd = reader.readline()
      reader.close()
      cmd = cmd.replace ("\n", "")
# and tries to do something useful    
      if cmd == 'FINISH':
        self.drawer.root.destroy()
      	exit()
        return
      if cmd == 'CLEAN':
        self.clean()
	continue
      if cmd == 'REV':
	self.rmRoom (self.ax, self.ay)
        self.drawer.c.create_rectangle (self.ax -15, self.ay-15, self.ax+15, self.ay+15, fill="black")
	try:
	  r = self.area.map[(self.lx, self.ly)]
	  for k in r.exits:
	    if r.exits[k] == (self.ax, self.ay): del r.exits[k]
	except: pass   
	self.setActual (self.lx, self.ly)
	continue
      t = split (": ", cmd)
      if t[0] == 'ADD': 
        self.addLocation (t[1])
      	continue
      if t[0] == 'GO':
        self.goDirection (t[1])
        continue
      if t[0] == 'BLINDGO':
        self.goBlind (t[1])
	continue
      if t[0] == 'RMEXIT':
        self.area.rmExit (self.ax, self.ay, t[1])
	continue
      if t[0] == 'LINK':
        self.linkExits (t[1])
	continue
      if t[0] == 'MOVEALL':
        pos = split(" ", t[1])
	self.moveAll (int(pos[0]), int(pos[1])*20)
	continue
      if t[0] == 'SAVE':
        self.area.save(t[1])
	self.drawer.root.title(self.area.description + " - TinyCartographer")
	continue
      if t[0] == 'LOAD':
	self.clean()
        if self.area.load(t[1]) == -1: continue
	self.drawer.root.title(self.area.description + " - TinyCartographer")
	self.drawer.c
	for r in self.area.map:
	  self.drawer.drawRoom (self.area.map[r])
	self.setActual (self.area.map[r].x, self.area.map[r].y)  
      	continue
      if t[0] == 'ACTUAL':
        pos = split (" ", t[1])
        self.setActual (int(pos[0]), int(pos[1]))
      	continue
      if t[0] == 'COLOR':
        pos = split (" ", t[1])
        self.setColor(int(pos[0]), int(pos[1]))      
	continue
      if t[0] == 'REMOVE':
        pos = split (" ", t[1])
        self.rmRoom (int(pos[0]), int(pos[1]))
	continue
      if t[0] == 'DESCRIPT':
        try:
	  r = self.area.map[self.ax, self.ay]
          r.setDescription(t[1])
          self.drawer.drawRoom(r)
	  self.drawer.putActual(r.x, r.y, r.description)
	except: pass  
 
  def clean (self):
    self.area = Area()
    self.drawer.c.delete(ALL)
    self.ax = 510
    self.ay = 510
    self.setActual
	
  def addLocation (self, s):
    ax = self.ax
    ay = self.ay  
    if (ax, ay) in self.area.map: 
      return
    s = s.replace (" ", "")  
    w = split (";", s)
    h = {}
    if 'polnoc' in w: 
      h['polnoc'] = (ax, ay-20)
      w.remove('polnoc')
    if 'polnocny-wschod' in w:
      h['polnocny-wschod'] = (ax+20, ay-20)
      w.remove('polnocny-wschod')
    if 'wschod' in w:
      h['wschod'] = (ax+20, ay)
      w.remove('wschod')
    if 'poludniowy-wschod' in w:
      h['poludniowy-wschod'] = (ax+20, ay+20)
      w.remove('poludniowy-wschod')
    if 'poludnie' in w:
      h['poludnie'] = (ax, ay+20)
      w.remove('poludnie')
    if 'poludniowy-zachod' in w:
      h['poludniowy-zachod'] = (ax-20, ay+20)
      w.remove('poludniowy-zachod')
    if 'zachod' in w:
      h['zachod'] = (ax-20, ay)
      w.remove('zachod')
    if 'polnocny-zachod' in w:
      h['polnocny-zachod'] = (ax-20, ay-20)
      w.remove('polnocny-zachod')
# non-standard exits point at start to the present room
    for key in w: h[key] = (ax, ay)
    r = Room (ax, ay, h, self.color)
    self.area.add(r)
    self.drawer.drawRoom(r)
    self.drawer.putActual(r.x, r.y, r.description)

  def goDirection (self, s):
    x = self.ax
    y = self.ay
    try:
      r = self.area.map[(x, y)]
      (x, y) = r.exits[s]
    except: 
      if 'polnoc' in s: y -= 20
      if 'poludni' in s: y += 20
      if 'zachod' in s: x -= 20
      if 'wschod' in s: x += 20
    self.setActual (x, y)

  def goBlind (self, s):
    x = self.ax
    y = self.ay
    if s == 'polnoc':
      y -= 20
      rev = 'poludnie'
    elif s == 'polnocny-wschod':
      x += 20
      y -= 20
      rev = 'poludniowy-zachod'
    elif s == 'wschod':
      x += 20
      rev = 'zachod'
    elif s == 'poludniowy-wschod':
      x += 20
      y += 20
      rev = 'polnocny-zachod'
    elif s == 'poludnie':
      y += 20
      rev = 'polnoc'
    elif s == 'poludniowy-zachod':
      x -= 20
      y += 20
      rev = 'polnocny-wschod'
    elif s == 'zachod':
      x -= 20
      rev = 'wschod'
    elif s == 'polnocny-zachod':
      x -= 20
      y -= 20
      rev = 'poludniowy-wschod'
    if not (x, y) in self.area.map:
      r = Room (x, y, {rev: (self.ax, self.ay)}, self.color)
      self.area.add(r)
    try:
      self.area.map[(self.ax, self.ay)].exits[s] = (x, y)
      self.area.map[(x, y)].exits[rev] = (self.ax, self.ay)
      self.drawer.drawRoom (self.area.map[(self.ax, self.ay)])
      self.drawer.drawRoom (self.area.map[(x, y)])
      self.setActual (x, y)
    except: pass  

  def setActual (self, x, y):
    self.lx = self.ax
    self.ly = self.ay
    self.ax = x
    self.ay = y
    desc = ""
    try:
      desc = self.area.map[(x, y)].description
    except: pass
    self.drawer.putActual(x, y, desc)

  def rmRoom (self, x, y): 
    try: self.area.remove (x, y)
    except: pass

  def setColor (self, x, y):
    try:
      r = self.area.map[(x, y)]
      if r.color == self.color:
        self.colorindex += 1
        if self.colorindex >= len(self.colors): self.colorindex = 0
        self.color = self.colors[self.colorindex]
      r.setColor(self.color)
      self.drawer.drawRoom(r)
      self.drawer.putActual(self.ax, self.ay)
    except: pass
  
  def linkExits (self, s):
    w = split (", ", s)
    if len(w) > 1:
      try:
        r = self.area.map[(self.ax, self.ay)]
	r.setExit (w[1], self.lx, self.ly)
	self.drawer.drawRoom(r)
	self.drawer.setActual(x, y, r.description)
      except: pass
    if len(w) > 0:
      try: 
        r = self.area.map[(self.lx, self.ly)]
        r.setExit (w[0], self.ax, self.ay)
	self.drawer.drawRoom(r)
      except: pass

  def moveAll (self, x, y):
    self.area.moveAll (x, y)
    self.drawer.c.delete(ALL) 
    for k in self.area.map:
      self.drawer.drawRoom (self.area.map[k])

if __name__ == '__main__':
  TinyCartographer()

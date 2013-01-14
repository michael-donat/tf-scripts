#!/usr/bin/env python

# TinyCartographer drawing module.
# Author: Dra <drakener@o2.pl>
# License: GPL v 3.0 or later
# http://www.gnu.org/licenses/gpl.txt

path_to_fifo = 'potok'

from Tkinter import *

class Drawer:
  def __init__(self, Width = 2000, Height = 2000):
# size and where the window is centered, in pixels
    self.Width = Width
    self.Height = Height
    self.xpos = 150
    self.ypos = 150
# create a window
    self.root = Tk()
    self.root.title('Area - TinyCartographer')
    self.root.geometry('+800+0')
    self.c = Canvas (self.root, width=2*self.xpos, height=2*self.ypos, background="black")
    self.c.config(scrollregion = (0, 0, self.Width, self.Height))
# place and set up scrollbars
    self.sbar = Scrollbar(self.root)
    self.sbar.config(command = self.c.yview)                   
    self.c.config(yscrollcommand = self.sbar.set)              
    self.sbar.pack(side = RIGHT, fill = Y)                     
    self.vbar = Scrollbar(self.root, orient='horizontal')
    self.vbar.config(command = self.c.xview)                   
    self.c.config(xscrollcommand = self.vbar.set) 
    self.vbar.pack(side = BOTTOM, fill = X)
# center view 
    self.c.xview_moveto(0.42)
    self.c.yview_moveto(0.42)
# bind something useful to clicking
    self.c.bind ("<F1>", self.setActual)
    self.c.bind ("<F2>", self.setColor)
    self.c.bind ("<F3>", self.rmRoom)
# and here we go 
    self.c.pack(expand = YES, fill = BOTH)
  
  def position (self, x, y):
# translate coordinates nicely
    x = int(self.c.canvasx(x))/20 * 20 + 10
    y = int(self.c.canvasy(y))/20 * 20 + 10
    return (x, y)

  def setActual (self, event):
# put a 'here I am' sign on a map and inform TC about actual position
   (x, y) = self.position (event.x, event.y)
   s = "ACTUAL: " + str(x) + " " + str(y) + "\n"
   self.tcsend(s)

  def putActual (self, x, y, desc=""):
# puts a 'here I am' sign
    self.c.delete("ACTUAL")
    self.c.delete("DESC")
    self.c.create_rectangle(x-3, y-3, x+3, y+3, fill="yellow", tag="ACTUAL")   
    self.c.xview_moveto (float(x - self.xpos)/float(self.Width))
    self.c.yview_moveto (float(y - self.ypos)/float(self.Height))
    self.c.create_text (self.c.canvasx(150), self.c.canvasy(20), text = desc, fill="white", tag="DESC")
   
  def setColor (self, event):
# toggle color for targeted room and set this color for next rooms
    (x, y) = self.position (event.x, event.y)
    s = "COLOR: " + str(x) + " " + str(y) + "\n"
    self.tcsend(s)

  def rmRoom (self, event):
# delete clicked room from map and paint it black on canvas
    (x, y) = self.position (event.x, event.y)
    self.c.create_rectangle (x-10, y-10, x+10, y+10, fill="black")   
    s = "REMOVE: " + str(x) + " " + str(y) + "\n"
    self.tcsend(s)
     
  def drawRoom (self, r):
    x = r.x
    y = r.y
    ex = r.exits 
    for i in ex:
      if ex[i] != (x, y): self.c.create_line (x, y, x+(ex[i][0]-x)/2, y+(ex[i][1]-y)/2, fill = "blue")
    self.c.create_rectangle (x-5, y-5, x+5, y+5, fill = r.color)

  def tcsend(self, s):
    global path_to_fifo
    writer = open (path_to_fifo, "w")
    writer.write(s)
    writer.close()

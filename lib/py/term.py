import curses
import time


def omg(self):

    curses.use_default_colors()
    curses.resizeterm(5,5)

    stdscr = curses.initscr()
    curses.noecho()

    stdscr.border()

    begin_x = 20; begin_y = 7
    height = 5; width = 40



    time.sleep(2)

    curses.endwin()

curses.wrapper(omg)
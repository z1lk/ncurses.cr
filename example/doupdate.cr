require "../src/ncurses"

NCurses.open do
  NCurses.cbreak
  NCurses.noecho
  NCurses.keypad(true)

  NCurses.refresh

  NCurses::Window.open(x: 10, y: 5, height: 10, width: 20) do |win|
    win.border
    win.mvaddstr("Press any key!", x: 1, y: 1)
    win.mvaddstr("I'm a subwindow", x: 1, y: 2)
    win.mvaddstr("x: #{win.maxx}, y: #{win.maxy}", x: 1, y: 3)
    win.noutrefresh
  end

  NCurses::Window.open(x: 12, y: 20, height: 10, width: 30) do |win|
    win.border
    win.mvaddstr("Press any key!", x: 1, y: 1)
    win.mvaddstr("I'm a second subwindow", x: 1, y: 2)
    win.mvaddstr("x: #{win.maxx}, y: #{win.maxy}", x: 1, y: 3)
    win.noutrefresh
  end

  NCurses.doupdate
  NCurses.notimeout(true)
  NCurses.getch
end

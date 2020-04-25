require 'gosu'


require_relative 'commands'
require_relative 'setting'
require_relative 'ZOrder'
require_relative 'tiles'
require_relative 'player'
require_relative 'map'
require_relative 'window'


Window_Width = Setting::WINDOW_WIDTH
Window_Height = Setting::WINDOW_HEIGHT
Fullscreen = Setting::FULLSCREEN



window = Window.new(nil, Window_Width, Window_Height,Fullscreen)
window.show

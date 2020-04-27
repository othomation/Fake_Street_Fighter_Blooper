#require gem/libs
require 'gosu'
require 'json'

#jsons files
$settings = JSON.parse(File.read('json/settings.json'))
$zorder = JSON.parse(File.read('json/zorder.json'))
$tiles = JSON.parse(File.read('json/tiles.json'))
#class requiring
require_relative 'map'
require_relative 'debug'
require_relative 'controls'
require_relative 'fighters/fighter' # parent class of sora / justice
require_relative 'fighters/sora' # < fighter class
require_relative 'fighters/justice' # < fighter class
require_relative 'game'




game = Game.new($settings['w_width'], $settings['w_height'], {
                                          fullscreen: $settings['w_fullscreen'],
                                          resizeable: $settings['w_resizeable']
                                         }, nil, nil) #nil here is the flename argument of game.rb. WHich is used for map
game.show

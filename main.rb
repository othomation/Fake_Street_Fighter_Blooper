require 'gosu'
require 'json'

require_relative 'game'

$settings = JSON.parse(File.read('settings.json'))


game = Game.new($settings['w_width'], $settings['w_height'], {
                                          fullscreen: $settings['w_fullscreen'],
                                          resizeable: $settings['w_resizeable']
                                         })
game.show

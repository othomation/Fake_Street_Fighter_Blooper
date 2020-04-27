class Debug < Gosu::Window

  def initialize(window, fontname, height)
  @font_debugging = Gosu::Font.new(self, Gosu::default_font_name, 32)
  end

  def update
  end
<<<<<<< HEAD

  def draw
@font_debugging.draw_text("Debug",
                                ($settings['w_width'].to_i/2)-38.75, #Set it to middle of screen. 38.75 is half the Debug text. I got this with .text_width
                                100, #Y position
                                $zorder['background'].to_i,
                                1, #scale x
                                1, #scale y
                                Gosu::Color::YELLOW )
=======
#THIS DOESNT WORK :(
#THIS DOESNT WORK :(
#THIS DOESNT WORK :(
#THIS DOESNT WORK :(
#THIS DOESNT WORK :(
#THIS DOESNT WORK :(
#THIS DOESNT WORK :(
#THIS DOESNT WORK :(
  def draw
# @font_debugging.draw_text("Debug",
#                                 ($settings['w_width'].to_i/2)-38.75, #Set it to middle of screen. 38.75 is half the Debug text. I got this with .text_width
#                                 100, #Y position
#                                 $zorder['background'].to_i,
#                                 1, #scale x
#                                 1, #scale y
#                                 Gosu::Color::YELLOW )
>>>>>>> 4d3efcad94f312f1b8e1e9b26a9902654eaf7254

  end
end

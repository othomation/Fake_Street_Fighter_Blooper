class Debug < Game
attr_reader :font_debugging
  def initialize(window, fontname, height)
  @font_debugging = Gosu::Font.new(self, Gosu::default_font_name, 32)
  end

  def update
  end

#this do not work sad sad sad
#this do not work sad sad sad
#this do not work sad sad sad
#this do not work sad sad sad
#this do not work sad sad sad
#this do not work sad sad sad
  def draw
@font_debugging.draw_text("Debug",
                                ($settings['w_width'].to_i/2)-38.75, #Set it to middle of screen. 38.75 is half the Debug text. I got this with .text_width
                              500, #Y position
                                $zorder['background'].to_i,
                                3, #scale x
                                1, #scale y
                                Gosu::Color::YELLOW )

  end
end

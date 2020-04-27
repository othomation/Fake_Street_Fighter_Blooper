class Game < Gosu::Window
  def initialize(filename, map, x, y, z)
    super
    self.caption = $settings['w_caption'] # Define the window's title. Refer to 'settings.rb'
    ## Fonts and stuff for visual debugging ##
    @font_debugging = Gosu::Font.new(self, Gosu::default_font_name, 32)
    ## End of fonts and stuff for visual debugging ##
    @map = Map.new("assets/map.txt") # its the filename arg in map.rb's initialize
    @sora = Sora.new # Instancing player sora
    p @sora #debug utility
    @justice = Justice.new # Instancing player justice
    p @justice #debug utility
  end

  def update
  end

  def draw
    ## Debug related ##
    @font_debugging.draw_text("Debug",
                                    ($settings['w_width'].to_i/2)-38.75, #Set it to middle of screen. 38.75 is half the Debug text. I got this with .text_width
                                    100, #Y position
                                    $zorder['background'].to_i,
                                    1, #scale x
                                    1, #scale y
                                    Gosu::Color::YELLOW )
    ## End of Debug related ##
    @map.draw # Draw the map ! That's it. I love commenting.
    @sora.draw
    @justice.draw
  end

  private
  def button_down(id)
    case id
    when $escape
      close
    else
      nil
    end
  end
    def needs_cursor?; true; end # Permit cursor visibility. Not useful but I feel insecure if I don't see my mouse.

end

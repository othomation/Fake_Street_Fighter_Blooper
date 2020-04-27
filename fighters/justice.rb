require File.join(File.dirname(__FILE__), 'fighter.rb')
class Justice < Fighter
  attr_reader  :x, :y, :dir, :vy, :map, :sora, :justice

  def initialize(filename, map, x, y, z)
    super
    @dir = :right
    @x, @y = x, y
    @x = - $settings['w_width'] + 100
    @y = $settings['w_height'] - 70
    @@name = "@justice"
    @@justice = Fighter.new("assets/img/char/two.png", @map, @x, @y ,$zorder['char'])
    p
  end

  def update
    p "test"
    button_down?(id)
    @@justice.update(move_x)
  end

  def draw
    @@justice.draw
  end

  private
  def button_down(id)
    move_x = 0
    case id
    when $justice_left
      move_x -= 5
    when $justice_right
      move_x += 5
    when $justice_jump
      @justice.try_to_jump
    else
      super
    end
  end

end

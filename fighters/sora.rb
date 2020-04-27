require File.join(File.dirname(__FILE__), 'fighter.rb')
class Sora < Fighter
  attr_reader :x, :y, :dir, :vy, :map, :sora, :justice

  def initialize(filename, map, x, y, z)
    super
    @dir = :right
    @x, @y = x, y
    @x = - $settings['w_width'] + 100
    @y = $settings['w_height'] - 70
    @@name = "Sora"
    @sora = Fighter.new("assets/img/char/one.png", @map, @x, @y ,$zorder['char'])
    p
  end

  def update
    p "test"
    button_down?(id)
    @sora.update(move_x)
  end

  def draw
    @sora.draw
  end

  private
  def button_down(id)
    move_x = 0
    case id
    when $sora_left
      move_x -= 5
    when $sora_right
      move_x += 5
    when $sora_jump
      @sora.try_to_jump
    else
      super
    end
  end

end

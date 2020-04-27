class Sora < Fighters
  attr_reader :x, :y, :dir, :vy, :map, :sora, :justice

  def initialize(name, filename, map, x, y, z)
    super("Sora", "assets/img/char/one.png", @map, @x, @y ,$zorder['char'])
    @dir = :left
    @x = - $settings['w_width'] + 100
    @y = $settings['w_height'] - 70
    @sora = Fighter.new
    @sora.draw
    p "test"
  end
  def name
    @name = "sora1"
    p @name
  end

  def update
    p "test"
    p @sora.to_s
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

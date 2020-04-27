class Sora < Fighters
  attr_reader :x, :y, :dir, :vy, :map,

  def initialize(filename, map, x, y, z)
    super(  "./assets/img/char/one.png",
            @map,
            100,
            500 ,
            4)
    @dir = :left
    p "test"
  end

  def update
  end

  def draw
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
      self.try_to_jump
    else
      super
    end
  end

end

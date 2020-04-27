class Justice < Fighters
  attr_reader :x, :y, :dir, :vy, :map,

  def initialize(filename, map, x, y, z)
    super(  "./assets/img/char/two.png",
            @map,
            600,
            500 ,
            $zorder['char'])
    @dir = :right
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
    when $justice_left
      move_x -= 5
    when $justice_right
      move_x += 5
    when $justice_jump
      self.try_to_jump
    else
      super
    end
  end

end

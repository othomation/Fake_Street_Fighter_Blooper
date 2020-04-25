class Player
  attr_reader :x, :y, :health

  def initialize(filename, map, x ,z)

    @x, @y = x, y
      @x, @y = Window_Width/2, Window_Height/2

      @dir = :left

      @vy = 0
      @map = map
      @states = [@standing, @walk1, @walk2, @jump]

    #  @states[0] = Gosu::Image.new("each part of the tileset in order from left to right")
    #  @states[1] = Gosu::Image.new("each part of the tileset in order from left to right")
    #  @states[2] = Gosu::Image.new("each part of the tileset in order from left to right")
    #  @states[3] = Gosu::Image.new("each part of the tileset in order from left to right")

       @states = Gosu::Image.load_tiles(filename, 33, 31)
         @player = @states[0]
         @health = 100.to_f
         @health = health

    end

  def draw
    if @dir == :left
      offs_x = -16
      factor = 1.0
    else
      offs_x = 16
      factor = -1.0
    end


    @player.draw(@x + offs_x, @y - 32, ZOrder::CHAR, factor, 1.0)

  end #end of draw

  def would_fit(offs_x, offs_y)
    not @map.solid?(@x + offs_x, @y + offs_y) and
      not @map.solid?(@x + offs_x, @y + offs_y - 29)
  end

def update(move_x)
  if (move_x == 0)
    @player = @states[0]
  else
    @player = (Gosu.milliseconds / 175 % 2 == 0) ? @states[1] : @states[2]
  end
  if (@vy < 0)
    @player = @states[3]
  end

  if move_x > 0
    @dir = :right
    move_x.times { if would_fit(1, 0) then @x += 1 end }
  end
  if move_x < 0
    @dir = :left
    (-move_x).times {if would_fit(-1, 0) then @x -= 1 end }
  end


  @vy += 1
  if @vy > 0
        @vy.times { if would_fit(0, 1) then @y += 1 else @vy = 0 end }
      end
      if @vy < 0
        (-@vy).times { if would_fit(0, -1) then @y -= 1 else @vy = 0 end }
      end
    end


  def try_to_jump
    if @map.solid?(@x, @y +1)
      @vy = -20
    end
  end


## COLLISIONS

  def check_for_collisions(other_player)
      if  collision_detected?(other_player)

        if @health >= 13
          @health -= 13
        elsif @health <= 14
          p "The player 2 has win"
          
          if other_player.health <= 14
            p "The player 1 has win"

          end

        else
          nil

end
      end
  end


  def collision_detected?(other_player)
       self.include?(other_player)
  end

  def include?(other_player)
    Gosu.distance(@x, @y, other_player.x, other_player.y) < 100 ? true : false
  end


## END COLLISIONS
## BLOCK

## END BLOCK



end

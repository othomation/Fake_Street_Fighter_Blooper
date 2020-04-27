class Fighters
  attr_reader :width,:height, :x, :y, :dir, :vy, :map, :sora, :justice, :move_x, :fighter_sprites, :fighter

  def initialize(filename, map, x, y, z)
    super
    @x, @y = x, y # For scalability
    @dir = dir # Initialize fighter's direction to right. This is also important beaucause my sprite are direction based. Just watch one.png or two.png on the assets/img/char directory.
    @vy = 0
    @map = map
    @fighters_sprites = Gosu::Image.load_tiles(filename, 60, 120)
    # fighter_sprites return a four element array with each of the sprite of the tileset we'll specify in each fighter class object
    @fighters = @fighters_sprites[0] # return the 'standing' animation (which is the first)
    @fighters = Fighters.new
    @fighters.draw
    p "test"
  end # initialize end

  def update(move_x)
    # Animation handling
    case (move_x) #I specify () because I use the argument thingy
    when 0
      @fighters = @fighters_sprites[0] # So when our velocity_x (move_x) is at a moment 0, we just use first sprite which is standing sprite
    else
      @fighters = @fighters_sprites[1+ Gosu.milliseconds/200 % 2] # It will use alternativly first and second walk sprite, one after another, infintly as long we move !
    end # case move_x end
    @fighters = @fighters_sprites[3] if @vy < 0 # Since more we jump more we go into 'lower' y numerical value, use the fourth sprite for the jump state ! limitation is : When we arrive in the extremum of our jump curve, it stop. So maybe I'll need to add a 'return to ground' sprite ! Will see

    # Horizontal movments
    if move_x > 0 # I don't think I can use case here... I'm note sure the < & > will work good with. maybe I'm not correct !
      @dir = :right
      move_x.times { if would_fit(1,0) then @x += 1 end }
    elsif move_x < 0
      @dir = :left
      (-move_x).times { if would_fit(-1,0) then @x -= 1 end  }
    else
      nil #There is no other condition I want to handle here.
    end # move_x > & < end For horizontal movments

    # Vertical movments
    @vy += 1 # Like constantly pushing the player to the ground, and unless the incomming condition, it will 'stick' to ground. This is why the player fall after extremum of the jump curve.
    if @vy > 0
      @vy.times { if would_fit(0,1) then @y += 1 else @vy = 0 end }
    elsif @vy <0
      (-@vy).times { if would_fit(0,-1) then @y -= 1 else @vy = 0 end }
    else
      nil #There is no other condition I want to handle here.
    end # @vy > & < end for vertical movments
  end # update method end

  def try_to_jump
    if @map.solid?(@x, @y +1)
      @vy = -20 # Jump height, sort of
    end
  end


  def draw
    case @dir # this case statement will help to 'flip' horizontally / mirror the sprite so it visually change direction
    when :left
      offs_x = -@fighters.width/2
      factor = 1.0
    else # so :right
      offs_x = @fighters.width/2
      factor = -1.0
    end # case @dir end
    # @fighter.draw
     @fighters.draw(@x + offs_x, @y - (@fighters.width/2), $zorder['char'], factor, 1.0)
  end # draw method end

  def would_fit(offs_x, offs_y) #It's to verify 'collision' (sort of) with correlation with the solid? method of Map class.
    !@map.solid?(@x + offs_x, @y + offs_y) &&
    !@map.solid?(@x + offs_x, @y + offs_y - @fighters.height)
  end


end # class end

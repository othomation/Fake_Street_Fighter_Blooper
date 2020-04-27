class Map

  attr_reader :width, :height, :map #make those value accessible !

  def initialize(filename)
    # Grounds tileset information :
    # We can display 20 times one tile fully on the x axis. (Basically w_width / 20 = 60)
    # We can display 12 times one tile fully on the y axis (Basically w_height / 12 = 60)
    @grounds = Gosu::Image.load_tiles("assets/img/env/grounds.png", 60, 60, tileable: true)
    lines = File.readlines(filename).map { |line|
                                          line.chomp }
    #@height = lines.size # Since I use a single-line tileset, it take the general height
    #@width = lines[0].size # So It use the width of only one element (since .load_tiles)
    @height, @width = lines.size, lines[0].size # height take general height of tile, since it's a single line tile.
    @tiles = Array.new(@width) do |x|
      Array.new(@height) do |y|
        case lines[y][x,1]
        when 'L' # for Ground left (first tile)
          $tiles['GroundLeft']
        when 'R' #for Ground right (second tile)
          $tiles['GroundRight']
        else
          nil # Just... nothing ! So we will just see the background img that will be displayed in game.rb draw method
        end # case end
      end #Array height end
    end  # @tiles end
  end # initialize end

  def update
    # We don't need update for now, but let it live !
  end

  def draw
    @height.times do |y|
      @width.times do |x|
        tile = @tiles[x][y]
           @grounds[tile].draw(x * 60, y * 60, $zorder['ground']) if tile # I specify 60 (which is my tile width, because It's a simple square for now. No need to specify a specific overlap)
      end # Width.times x end
    end # Height.times y End
  end # Draw method end

  def solid?(x, y)# IT IS SOLID? TELL ME DAVE? IT IS SOLID? WHY IT IS SOLID ? TELL ME DAVE
    y < 0 || @tiles[x/60][y/60]
  end # solid? method end

end

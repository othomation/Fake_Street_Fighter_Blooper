class Map
  attr_reader :width, :height

  def initialize(filename)

    @tileset = Gosu::Image.load_tiles("assets/img/ground_s.png", 60 , 60, tileable: true)
  #  @sky = Gosu::Image.load_tiles("assets/img/bg.png", 1366, 708, tileable: true)
    lines = File.readlines(filename).map { |line| line.chomp }
    @height = lines.size
    @width = lines[0].size
    @tiles = Array.new(@width) do |x|
      Array.new(@height) do |y|
        case lines[y][x,1]
        when '"'
          Tiles::GroundL
        when '#'
          Tiles::GroundR
        else
          nil
        end
      end
    end
  end

  def draw
    @height.times do |y|
      @width.times do |x|
        tile = @tiles[x][y]
        if tile
                  # Draw the tile with an offset (tile images have some overlap)
                  # Scrolling is implemented here just as in the game objects.
                  @tileset[tile].draw(x * 60, y * 60, ZOrder::GROUND)
                end
      end
    end
  end

  def solid?(x, y)
    y < 0 || @tiles[x/60][y/60]
  end


end

class Window < Gosu::Window
  def initialize(filename, map,y,z)

    super(Window_Width, Window_Height,Fullscreen)# Set width and height of the window and make in non tileable
    self.caption = Gosu::fps.to_s + " Fake street fighter blooper"# Set window title
    @bg = Gosu::Image.new("assets/img/bg.png", :tileable => false) # Set game principal background
    @map = Map.new("assets/map.txt")

    @player1 = Player.new("assets/img/char_one_tileset.png", @map, 100, Window_Height-91)
    @player2 = Player.new("assets/img/char_two_tileset.png", @map, 600, Window_Height-91)

    $font = Gosu::Font.new(self, Gosu::default_font_name, 30) #Set a 32 font

    @pause = false # Game isn't paused first
    $tile = Gosu::Image.new("assets/img/ground_s.png",tileable: false)


  end # end of initialize


  def update # executed 60 times per second

    update_player1
    update_player2
    Gosu.fps()
    fpsgosu = Gosu.fps()
  end # end of update


  def draw # called when called
  @time_elapsed = Gosu::Image.from_text("Time elapsed : " + (Gosu::milliseconds/100).to_s, 50, :font => Gosu::default_font_name)
  @time_elapsed.draw(Window_Width/2 - @time_elapsed.width/2, Window_Height/2 - @time_elapsed.height/2, 3)
  @pos_p1x = Gosu::Image.from_text("Joueur 1 => Position X : " + @player1.x.to_s + " | Position Y : " + @player1.y.to_s, 50, :font => Gosu::default_font_name)
  @pos_p2x = Gosu::Image.from_text("Joueur 2 => Position X : " + @player2.x.to_s + " | Position Y : " + @player2.y.to_s, 50, :font => Gosu::default_font_name)
  @pos_p1x.draw(Window_Width/2 - @pos_p1x.width/2, (Window_Height/2 - @time_elapsed.height/2)-50, 3)
  @pos_p2x.draw(Window_Width/2 - @pos_p2x.width/2, (Window_Height/2 - @time_elapsed.height/2)-150, 3)


  $font.draw("Health P1 : " + @player1.health.to_s, 200, 150, 3, 1.0, 1.0,Gosu::Color::YELLOW)
  $font.draw("Health P2 : " + @player2.health.to_s, 500, 150, 3, 1.0, 1.0,Gosu::Color::YELLOW)

    @map.draw
    @player1.draw
    @player2.draw

    @bg.draw(0, 0, ZOrder::BG)

  end # end of draw

  private

  def update_player1


    move_x = 0
    if Gosu::button_down?($p1_left)
        if @player2.x > @player1.x
          @dir = :left
          move_x -= 4
        else @player2.x < @player1.x
          @dir = :left
            move_x -= 6
        end
    end

    if Gosu::button_down?($p1_right)
      if @player2.x > @player1.x
        move_x += 6
        @dir = :right

      else @player2.x < @player1.x
          move_x += 4
        @dir = :right


      end
    end
    @player1.update(move_x)
  #  if Gosu::button_down?(Gosu::KbSpace)
    #  if Gosu::button_up(Gosu::KbSpace)
    #  @player1.check_for_collisions(@player2)
#  end
#    end

  end # end of update_player1


  def update_player2

    move_x = 0
    if Gosu::button_down?($p2_left)
        if @player1.x > @player2.x
          @dir = :left

          move_x -= 4

        else @player1.x < @player2.x
          @dir = :left

            move_x -= 6

        end

    end

    if Gosu::button_down?($p2_right)
      if @player1.x > @player2.x
        @dir = :right
        move_x += 6

      else @player1.x < @player2.x
        @dir = :right
          move_x += 4

      end
    end
    @player2.update(move_x)
  #  if Gosu::button_down?(Gosu::KbF)
    #  if Gosu::button_up(Gosu::KbQ)
  #  @player2.check_for_collisions(@player1)
  #end
  end

   # end of update_player2



  def button_down(id) # gosu class for detecting button press. button_up exist too, maybe use that for de-comboting ? Will see.
    case id
    when $p1_jump
      @player1.try_to_jump
    when $p2_jump
      @player2.try_to_jump
    when $p1_attack
      @player1.check_for_collisions(@player2)
    when $p2_attack
      @player2.check_for_collisions(@player1)
    when $Escape
      close
    else
      super
    end

  end #end of button_down

end #end of class Window

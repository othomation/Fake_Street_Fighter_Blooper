class Game < Gosu::Window

  def intialize
    super
    self.caption = $settings['w_caption'] # Define the window's title. Refer to 'settings.rb'

    p $settings.to_s
    p $settings
  end


  def update
  #  p $Win_Caption

  end

  def draw


  end

    private
    def needs_cursor?; true; end
end

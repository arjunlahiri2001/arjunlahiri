class UFO < Gosu::Image

  SPEED = 30 # speed of the UFO
  HEIGHT = 150 # height of the UFO

  attr_reader :x, :y # read the x and y positions

  # Intialize the UFO and its position
  def initialize(window)
    super("images/ufo.png")
    @x = window.width / 2
    @y = window.height - HEIGHT
    @velocity = SPEED
    @window = window
  end

  # Makes @x and @y refer to the middle of the image when drawn.
  # Draws the image
  def draw
    super(@x - radius, @y - radius, 1)
  end

  # Implements moving characteristics of the UFO
  def move(direction)
    @x += @velocity if direction == :right
    @x -= @velocity if direction == :left
  end

  #Private methods ----------------------------------------------------
  private 
  
  def radius
    width / 2
  end

end
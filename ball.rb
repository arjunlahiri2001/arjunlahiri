class FireBall < Gosu::Image

  SPEED = 20
  
  attr_reader :x, :y # program will read the x and y coordinates of the fireball
  attr_accessor :velocity_x, :velocity_y # the program will access velocities, especially if
                                         # fireball bounces off the walls

  def initialize(x, y, window)
    super("images/fireball.png")
    @x = x
    @y = y
    @velocity_x = SPEED
    @velocity_y = SPEED
    @window = window
  end

  #Makes @x and @y refer to the middle of the image when drawn.
  def draw
    super(@x - radius, @y - radius, 1)
  end

  def move
    move_position
    bounce_off_walls
  end

   
  #Helper methods for move --------------------------------------------
  def move_position
    @x += @velocity_x
    @y += @velocity_y
  end

  #Determines when the watermelon has hit a wall and needs to bounce
  #off it.
  def bounce_off_walls
    change_direction(:x) if hit_wall?(:left) || hit_wall?(:right)
    change_direction(:y) if hit_wall?(:top) || hit_wall?(:bottom) 
  end

  def change_vertical_direction
    @velocity_y *= -1 
  end

  #Helper methods for bounce_off_walls --------------------------------

  # Method changes direction of fireball by multiplying velocities by -1
  def change_direction(axis)
    if axis == :x
      @velocity_x *= -1
    elsif axis == :y
      @velocity_y *= -1
    end  
  end

  # Boolean method to check if fireball has hit the boundaries
  def hit_wall?(wall)
    if wall == :top
      hit_top_wall?
    elsif wall == :bottom
      hit_bottom_wall?
    elsif wall == :right
      hit_right_wall?
    elsif wall == :left
      hit_left_wall?
    end 
  end

  #Helper methods for hit_wall -----------------------------------------
  def hit_top_wall?
    @y - radius <= 0 && !positive?(@velocity_y)
  end

  def hit_bottom_wall?
    @y + radius >= @window.height && positive?(@velocity_y)
  end

  def hit_left_wall?
    @x - radius <= 0 && !positive?(@velocity_x)
  end

  def hit_right_wall?
    @x + radius >= @window.width && positive?(@velocity_x)
  end

  #General helper methods ----------------------------------------------
  def positive?(num)
    num > 0
  end

  def radius
    width / 2
  end

end



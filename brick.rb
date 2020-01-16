class Brick < Gosu::Image 

  attr_reader :x, :y

	def initialize(x, y, window)
		super("images/alien.png") 
		@x = x
    @y = y
    @window = window
	end

	def draw 
		super(@x - radius, @y - radius, 1)
	end

	
	def radius
    width / 2
  end


end
class Brick < Gosu::Image 

  attr_reader :x, :y

  	# initialize alien image for bricks
	def initialize(x, y, window)
		super("images/alien.png") 
		@x = x
   	    @y = y
   		@window = window
	end

	# Draw the aliens
	def draw 
		super(@x - radius, @y - radius, 1)
	end

	# Implement radius to maintain consistency of alien size
	def radius
    	width / 2
    end


end
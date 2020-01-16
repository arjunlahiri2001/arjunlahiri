class Lives < Gosu::Font 

	X = 2425 # x position
	Y = 200  # y position
	SIZE = 150b # font size

	attr_reader :lives # read the number of lives left

	# Initialize the number of lives at the beginning of the game
	def initialize 
		super(SIZE)
		@lives = 10
	end

	# Draw out the number of lives
	def draw 
		super("Lives: #{@lives.to_s}", X, Y, 5)
	end

	# Subtracts life if fireball hits the bottom wall
	def subtract_point 
		@lives -= 1
	end
end	
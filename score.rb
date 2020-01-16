class Score < Gosu::Font 

	X = 2400 # x position of the score
	Y = 10  # y position of the score
	SIZE = 150 # font size


	attr_reader :points	# reads the numbeer of points

	# Initialize the number of points to zero
	def initialize 
		super(SIZE)
		@points = 0
	end

	# Draw out the number of points
	def draw 
		super("Score: #{@points.to_s}", X, Y, 3)
	end

	# Add point if alien was hit
	def add_point
		@points += 1
	end
end	
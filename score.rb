class Score < Gosu::Font 

	X = 2400
	Y = 10 
	SIZE = 150


	attr_reader :points

	def initialize 
		super(SIZE)

		@points = 0
	end

	def draw 
		super("Score: #{@points.to_s}", X, Y, 3)
	end

	def add_point
		@points += 1
	end

	def subtract_point 
		@points -= 1
	end
end	
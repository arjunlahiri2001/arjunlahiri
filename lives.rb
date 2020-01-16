class Lives < Gosu::Font 

	X = 2425 
	Y = 200 
	SIZE = 150

	attr_reader :lives

	def initialize 
		super(SIZE)
		@lives = 10
	end

	def draw 
		super("Lives: #{@lives.to_s}", X, Y, 5)
	end

	def add_point
		@lives += 1
	end

	def subtract_point 
		@lives -= 1
	end
end	
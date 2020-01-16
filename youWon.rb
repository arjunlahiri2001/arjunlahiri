class YouWon < Gosu::Font 

	X = 550 
	Y = 1000 
	SIZE = 180

	def initialize 
		super(SIZE)
	end

	def draw 
		super("You Won!! Great Battle!!", X, Y, 5)
	end

end	
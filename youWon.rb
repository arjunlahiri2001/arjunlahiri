class YouWon < Gosu::Font 

	X = 550 # x position of first letter of the text
	Y = 1000  # y position of first letter of the text
	SIZE = 180 # font size

	# Initialize the text
	def initialize 
		super(SIZE)
	end

	# Draw out this text if all the aliens were destroyed
	def draw 
		super("You Won!! Great Battle!!", X, Y, 5)
	end

end	
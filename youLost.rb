class YouLost < Gosu::Font 

	X = 550 # x position of the first letter of the text
	Y = 1000  # y position of the first letter of the text
	SIZE = 180 # font size

	# Initializes the font size
	def initialize 
		super(SIZE)
	end

	# Draws out the text on the screen if player ran out of lives
	def draw 
		super("You Lost!! Meet your eternal death!!", X, Y, 5)
	end

end	
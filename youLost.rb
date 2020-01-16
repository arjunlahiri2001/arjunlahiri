class YouLost < Gosu::Font 

	X = 50 
	Y = 1000 
	SIZE = 180

	def initialize 
		super(SIZE)
	end

	def draw 
		super("You Lost!! Meet your eternal death!!", X, Y, 5)
	end

end	
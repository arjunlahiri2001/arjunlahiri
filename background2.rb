class Background2 < Gosu::Image 

	def initialize
		super("images/space.jpg") #Initializes background to space pic 
								  #when all aliens have been destroyed
	end

	def draw 
		super(0,0,0)
	end

end
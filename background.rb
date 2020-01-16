class Background < Gosu::Image 

	def initialize
		super("images/spaceImage.png") #Initializes background to the spaceImage pic
																	 #when game loads
	end

	def draw 
		super(0,0,0)
	end

end
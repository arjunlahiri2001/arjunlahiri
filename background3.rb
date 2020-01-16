class Background3 < Gosu::Image 

	def initialize
		super("images/blackhole.png") #Initializes background to blackhole image
									  #when player runs out of lives
	end

	def draw 
		super(0,0,0)
	end

end
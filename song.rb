class Song < Gosu::Song 

 	attr_reader :volume # reads the volume

 	# Initializes background music implementing song file
	def initialize(window)
		super("songs/Bowie-ArtofWar.mp3") 
    	@window = window
    	@volume = volume
	end

end
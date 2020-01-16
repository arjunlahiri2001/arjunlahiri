class Song < Gosu::Song 

 	attr_reader :volume

	def initialize(window)
		super("songs/Bowie-ArtofWar.mp3") 
    @window = window
    @volume = volume
	end

end
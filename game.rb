#Turn up the volume!! Here we are on a frightening day!!!! A battle against aliens near a dying star
#being sucked by a blackhole. Your job is to kill all the aliens and if you fail,
#YOU FAIL!!!!. If you win, YOU WIN!!!!. Do not let the ball fall below the ufo, or you will
#lose a life since the ship is powered by a source behind it. If you kill an alien you get 
#points. You kill all the aliens, you have officially beaten the game and are transported to a 
#a nearby nebula and if you lose, you get sucked into a blackhole for eternity
#To control the ship, the left key goes left and the right key goes right. Press the space
#bar to shoot a fireball!!! Have fun!!!!

require 'gosu'
require_relative 'ball.rb'
require_relative 'paddle.rb'
require_relative 'score.rb'
require_relative 'youLost.rb'
require_relative 'youWon.rb'
require_relative 'background.rb'
require_relative 'background2.rb'
require_relative 'background3.rb'
require_relative 'brick.rb'
require_relative 'lives.rb'
require_relative 'song.rb'

# Game engine
class Game < Gosu::Window

  WIDTH = 3000
  HEIGHT = 2000

  def initialize

    # Initialize dimensions of game
    super(WIDTH, HEIGHT)

    # Initialize backgrounds to be implemented
    @background = Background.new
    @background2 = Background2.new
    @background3 = Background3.new
    self.caption = "Destroy Ball"

    # Initialize objects like the UFO, the fireball, and the
    # characteristics of the game such as the music, number of lives,
    # score, and status of the game
    @ufo = UFO.new(self)
    @game_over = false
#    @song = Gosu::Song.new("songs/Bowie-ArtofWar.mp3")
    @sound  = Gosu::Sample.new("songs/shooting.wav")
    @destroyed = Gosu::Sample.new("songs/destroyed.wav")
    @destroyedAtVoid = Gosu::Sample.new("songs/bangLarge.wav")
    @ufoSound = Gosu::Sample.new("songs/thrust.wav") 
    @youLost = YouLost.new
    @youWon = YouWon.new
    @fireballs = []
    @score  = Score.new
    @lives = Lives.new


    # Initialize the aliens and each of the rows the aliens will be
    # inserted into the @aliens array
    @aliens = [] 
    aliens_row1 = []
    aliens_row2 = []
    aliens_row3 = []
    aliens_row4 = []
    aliens_row5 = []
    aliens_row6 = []
    aliens_row7 = []

    x = self.width - self.width
    while x <= self.width #This loop evens out the spacing between the aliens and the rows
      aliens_row1 << Brick.new(x,0,self)
      aliens_row2 << Brick.new(x,200,self)
      aliens_row3 << Brick.new(x,400,self)
      aliens_row4 << Brick.new(x,600,self)
      aliens_row5 << Brick.new(x,800,self) 
      aliens_row6 << Brick.new(x,1000,self) 
      aliens_row7 << Brick.new(x,1200,self) 

      x += 200
    end

    # Insert the the different rows of aliens into the aliens array
    @aliens << aliens_row1
    @aliens << aliens_row2
    @aliens << aliens_row3
    @aliens << aliens_row4
    @aliens << aliens_row5
    @aliens << aliens_row6
    @aliens << aliens_row7


   end

  # Draw out all the game components
  def draw

    # Keep all current components of the game if game is not over
    if @game_over != true
      @background.draw
      @ufo.draw
      @score.draw
      @lives.draw
      draw_balls
      create_aliens
    end    

    # Display black hole background and write text indicating you lost
    if @lives.lives == 0
      drawYouLost
      @background3.draw
      @game_over = true

    # If all aliens are destroyed meaning all the rows of the aliens are empty
    # then change the background to the nebula picture initialized in background2
    elsif @aliens == [[],[],[],[],[],[],[]]
      aliens_empty
      @background2.draw
      @game_over = true
    end
  end

  # Method to update game display 
  def update
    if @game_over != true
      move_ufo
      move_balls
      check_for_collision
      check_for_collision_ball 
      check_for_collion_ball_brick
      # @song.play
      def button_down(id) # Shoots a fireball if spacebar was pressed
        @fireballs << FireBall.new(@ufo.x,@ufo.y,self) && @sound.play if button_down?(Gosu::KbSpace)
        close if button_down?(Gosu::KbQ)
      end
    end

    # Keep the background song playing if the game is over
    if @lives.lives == 0 
      # @song.play
      @game_over = true
    elsif @aliens == [[],[],[],[],[],[],[]]
      # @song.play
      @game_over = true
    end
    #stopping the game
  end



 

  # Private methods to be implemented above
  private 


  # Method checks to see if fireball collides with spaceship and makes the fireball
  # bounce off if it collides just like the old Atari breakout game
  def check_for_collision  
    @fireballs.each do |fireball|
      distance = Gosu.distance(fireball.x, fireball.y, @ufo.x, @ufo.y)
      if distance <= fireball.radius + @ufo.radius && fireball.velocity_y > 0 
        fireball.change_vertical_direction 
        @sound.play      
      end
    end
  end

 
  # Method checks to if fireball has collided with the bottom wall
  def check_for_collision_ball 
    @fireballs.each do |fireball| 
      if fireball.y + fireball.radius >= self.height 
        @lives.subtract_point
        @fireballs.delete(fireball)
        @destroyedAtVoid.play
      end
    end
  end

  # Method draws out the text indicating you lost
  def drawYouLost
    if if_lives_none(true)
      @youLost.draw 
    end
  end

  # Method draws out the text indicating number of lives is 0
  def if_lives_none(status)
    status = true if @lives.lives == 0
  end

  # Method checks to see if fireball collides with aliens and deletes alien
  # from the @aliens array if that is the case
  def check_for_collion_ball_brick 
    @aliens.each do |alien|
      alien.each do |element|
        @fireballs.each do |fireball|
          distance = Gosu.distance(fireball.x, fireball.y, element.x, element.y)
          if distance <= fireball.radius + element.radius #&& ball.velocity_y < 0  
            fireball.change_vertical_direction
            @score.add_point
            alien.delete(element)
            @destroyed.play 
          end
        end 
      end
    end
  end

  # Method draws out the aliens for each row when initializing game
  def create_aliens 
     @aliens.each do |alien|
       alien.each do |element|
         element.draw
       end
     end
  end

  # Draw out the fireballs whenever spacebar is pressed
  def draw_balls 
    @fireballs.each {|fireball| fireball.draw}
  end

  # Make the fireballs move
  def move_balls 
    @fireballs.each {|fireball| fireball.move}
  end

  # Move the UFO with the left and right arrow keys
  def move_ufo 
    if button_down?(Gosu::KbRight) && @ufo.x + @ufo.radius <= self.width
      @ufo.move(:right) 
      @ufoSound.play
    elsif button_down?(Gosu::KbLeft) && @ufo.x - @ufo.radius >= 0
      @ufo.move(:left)
      @ufoSound.play
    end
  end


  # Draw out the text indicating you won if all aliens were destroyed
  def aliens_empty 
    @youWon.draw 
  end
end

# Displays game
window = Game.new
window.show
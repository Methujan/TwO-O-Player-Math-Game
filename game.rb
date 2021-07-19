class Game
  # puts "Welcome to the TwO-O-Player Math Game. What is Player 1's name?"
  # player1 = gets.chomp
  # puts "What is Player 2's name?"
  # player2 = gets.chomp
  LIVES = 3
  def initialize
    @player_1 = Players.new(1, LIVES)
    @player_2 = Players.new(2, LIVES)
    @question = Questions.new
    @player_turn = @player_1
  end


  def show_question
    @question.make_question
    puts "Player #{@player_turn}: #{@question.question}"
  end

  # def get_answer
  #   player_answer = gets.chomp.to_i
  # end

  # def check_answer
  #   player_answer == @question.answer
  # end

  def get_check_answer
    player_answer = gets.chomp.to_i
    player_answer == @question.answer
  end

  def next_player
    if @player_turn === @player_1
      @player_turn = @player_2
      puts "----- NEXT TURN -----"

    else @player_turn === @player_2
      @player_turn = @player_1
      puts "----- NEXT TURN -----"
    end
  end

  def start 
    while @player_1.lives > 0 && @player_2.lives > 0 do
      self.show_question
    
      # if correct, no change to score .. change player
      if self.get_check_answer
        puts "YES! you are correct."
        puts "P1:#{@player_1.lives}/3 vs P2:#{@player_2.lives}/3 "
        next_player
    
      # if incorrect, lose 1 life ..  change player
      else
        @player_turn.wrong
        puts "Seriously? No!"
        puts "P1:#{@player_1.lives}/3 vs P2:#{@player_2.lives}/3 "
        next_player
      end
    end 
  end 
end
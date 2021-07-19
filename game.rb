class Game
  puts "Welcome to the TwO-O-Player Math Game. What is Player 1's name?"
  player1_name = gets.chomp.to_s
  puts "What is Player 2's name?"
  player2_name = gets.chomp.to_s
  LIVES = 3

  def initialize
    @player_1 = Players.new(player1_name, LIVES)
    @player_2 = Players.new(player2_name, LIVES)
    @question = Questions.new
    @player_turn = @player_1
  end


  def show_question
    @question.make_question
    puts "#{@player_turn.name}"
    puts "Player #{@player_turn}: #{@question.question}"
  end


  def get_check_answer
    player_answer = gets.chomp.to_i
    player_answer == @question.answer
  end


  def next_turn
    if @player_1.lives > 0 && @player_2.lives > 0 
    puts "----- NEXT TURN -----"
    end
  end


  def next_player
    if @player_turn === @player_1
      @player_turn = @player_2
    else @player_turn === @player_2
      @player_turn = @player_1
    end
  end


  def game_over
    puts "#{@player_turn} wins with a score of #{@player_turn.lives}"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end 


  def start 
    while @player_1.lives > 0 && @player_2.lives > 0 do
      self.show_question
    
      # if correct, no change to score .. change player
      if self.get_check_answer
        puts "YES! you are correct."
        puts "P1:#{@player_1.lives}/3 vs P2:#{@player_2.lives}/3 "
        next_player
        next_turn
    
      # if incorrect, lose 1 life ..  change player
      else
        @player_turn.wrong
        puts "Seriously? No!"
        puts "P1:#{@player_1.lives}/3 vs P2:#{@player_2.lives}/3 "
        next_player
        next_turn
      end
    end 
    game_over
  end 
end
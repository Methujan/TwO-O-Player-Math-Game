# questions will use Math.random to generate random numbers
class Questions
  attr_reader :answer,:question
  def make_question 
  @first_number = rand(1..50)
  @second_number = rand(1..50)
  @answer = @first_number + @second_number
  @question = "What is #{@first_number} + #{@second_number}?"
  end
end 
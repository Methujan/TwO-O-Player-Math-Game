class Players
  attr_accessor :name, :lives

def initialize(name, lives) 
  @name = name
  @lives = lives
end

def wrong
  if @lives > 0
  @lives -= 1
  end
  @lives
end

end
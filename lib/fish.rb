class Fish
  
  attr_accessor :mood
  attr_reader :name 
  
  def initialze(name)
    @name = name 
    @mood = "nervous"
  end
end
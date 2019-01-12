class Owner
  
  attr_accessor :name, :pets
  attr_reader :species
  
  @@all = []
  
  def initialize
    @species = "human"
    @pets = {
      :fishes => [],
      :dogs => [],
      :cats => []
    }
  end 
  
  def self.count
    @@all.size 
  end 
  
  def say_species
    puts "I am a #{@species}."
  end
  
end
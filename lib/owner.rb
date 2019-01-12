class Owner
  
  attr_accessor :name, :pets
  attr_reader :species
  
  @@all = []
  
  def initialize(species)
    @species = species
    @pets = {
      :fishes => [],
      :dogs => [],
      :cats => []
    }
    @@all << self
  end 
  
  def self.count
    @@all.size 
  end 
  
  def self.all
    @@all
  end
  
  def say_species
    return "I am a #{@species}."
  end
  
end


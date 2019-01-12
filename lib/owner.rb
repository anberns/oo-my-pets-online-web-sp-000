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
  
  def self.reset_all
    @@all.clear
  end
  
  def say_species
    return "I am a #{@species}."
  end
  
  #pets 
  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish 
  end
  
  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat 
  end
  
  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog 
  end
  
  def walk_dogs
    @pets[:dogs].each do |dog|
      dog.mood = "happy"
    end 
  end
  
  def play_with_cats
    @pets[:cats].each do |cat|
      cat.mood = "happy"
    end 
  end
  
  def feed_fish
    @pets[:fishes].each do |fish|
      fish.mood = "happy"
    end 
  end
  
  def sell_pets
    @pets[:fishes].each do |fish|
      fish.mood = "nervous"
    end
    @pets.each do |species|
      species.clear
    end
  end
    
  def list_pets
    return "I have #{@pets[:fishes].size} fish, #{@pets[:dogs].size} dog(s), and #{@pets[:cats].size} cat(s)."
  end
    
end

describe "#sell_pets" do
      it 'can sell all its pets, which make them nervous' do
        fido = Dog.new("Fido")
        tabby = Cat.new("Tabby")
        nemo = Fish.new("Nemo")
        [fido, tabby, nemo].each {|o| o.mood = "happy" }
        owner.pets = {
          :dogs => [fido, Dog.new("Daisy")],
          :fishes => [nemo],
          :cats => [Cat.new("Mittens"), tabby]
        }
        owner.sell_pets
        owner.pets.each {|type, pets| expect(pets.empty?).to eq(true) }
        [fido, tabby, nemo].each { |o| expect(o.mood).to eq("nervous") }
      end
    end
 
    






    

    
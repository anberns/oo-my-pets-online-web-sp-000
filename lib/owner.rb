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
    @pets.each do |species|
      species.each do |animal|
        animal.mood = "nervous"
      end 
    end
    @pets.each do |species|
      species.clear
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

    describe "#list_pets" do
      it 'can list off its pets' do
        owner.buy_fish("Bubbles")
        owner.buy_fish("Nemo")
        owner.buy_cat("Crookshanks")
        owner.buy_dog("Fido")
        owner.buy_dog("Snuffles")
        owner.buy_dog("Charley")
        expect(owner.list_pets).to eq("I have 2 fish, 3 dog(s), and 1 cat(s).")
      end
    end
    

    






    

    
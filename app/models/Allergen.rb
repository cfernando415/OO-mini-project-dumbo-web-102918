class Allergen
  @@all = []
  attr_reader :user, :ingredient
  def initialize(user, ingredient)
    @user, @ingredient = user, ingredient
    @@all << self
  end
  def self.all
    @@all
  end
end

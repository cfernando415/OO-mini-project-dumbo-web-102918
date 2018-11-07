class RecipeIngredient
  attr_reader :recipe, :ingredient
  @@all = []
  def initialize(recipe, ingredient)
    @recipe, @ingredient = recipe, ingredient
    @@all << self
  end
  def self.all
    @@all
  end


end

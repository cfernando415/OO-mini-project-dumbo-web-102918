class Recipe
  @@all = []
  attr_accessor :name
  def initialize(name)
    @name = name
    @@all << self
  end
  def self.all
    @@all
  end
  def self.most_popular
    mpr = RecipeCard.all.map {|recipecard| recipecard.recipe.name}
    mpr.detect {|e| mpr.count(e) > 1}
  end
  def users
    RecipeCard.all.select {|recipecard| recipecard.recipe == self}.map{|recipecard| recipecard.user}
  end
  ###########
  # see there's another way to simplify the ingredients method
  def ingredients
    RecipeIngredient.all.select {|recipe_ingredient| recipe_ingredient.recipe == self}.map{|recipeingredient| recipeingredient.ingredient}
  end
  def allergens
    Allergen.all.select do |allergen|
      self.ingredients.include? allergen.ingredient
    end.map {|allergen| allergen.ingredient}
  end
  def add_ingredients(ingredient_array)
    ingredient_array.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end
end

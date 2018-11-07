class User
  @@all = []
  attr_reader :name
  def initialize(name)
    @name = name
    @@all << self
  end
  def self.all
    @@all
  end
##################
#establishes one to many relationship with RecipeCard class
#creates an indirect relationship with Recipe class through the RecipeCard class
  def recipes
    RecipeCard.all.select {|recipecard| recipecard.user == self}.map{|recipecard| recipecard.recipe}
  end
  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(date, rating, self, recipe)
  end
  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end
  def allergens
    Allergen.all.select {|allergen| allergen.user == self}.map {|allergen| allergen.ingredient}
  end
  def top_three_recipes
    recipes.sort {|first, second| first.rating <=> second.rating }[-3..-1]
  end
  def most_recent_recipe
    recipes.last
  end
  def safe_recipes
    recipes.select do |recipe|
      # binding.pry
      recipe.ingredients.select do |ingredient|
        # binding.pry
        allergens.select do |allergen|
          # binding.pry
          ingredient != allergen
        end
      end
    end
  end
end

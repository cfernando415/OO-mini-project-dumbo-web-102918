class RecipeCard
  @@all = []
  attr_reader :date, :rating, :user, :recipe
  def initialize(date, rating, user, recipe)
    @date, @rating, @user, @recipe = date, rating, user, recipe
    @@all << self
  end
  def self.all
    @@all
  end
end

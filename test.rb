require_relative "app/repositories/meal_repository"
require_relative "app/models/meal"
require_relative "app/controllers/meals_controller"
meal_repo = MealRepository.new(File.join(__dir__, 'data/meals.csv'))
meals_controller = MealsController.new(meal_repo)


# require_relative "app/models/meal"


# meal = Meal.new(name: "hamburger", price: 2, id: 1)
# p meal

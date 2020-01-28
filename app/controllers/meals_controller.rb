require_relative "../views/view"

class MealsController
  def initialize(meal_repo)
    @meal_repo = meal_repo
    @view = View.new
  end

  def list
    meals = @meal_repo.all
    @view.display(meals)
  end

  def add
    name = @view.ask_for("name")
    price = @view.ask_for("price").to_i
    meal = Meal.new(name: name, price: price)
    @meal_repo.add(meal)
    list
  end

  def destroy
    list
    id = @view.ask_for("id").to_i
    @meal_repo.delete(id)
    list
  end
end

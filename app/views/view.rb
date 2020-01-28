class View

  def display(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} - #{meal.price}"
    end
  end

  def ask_for(thing)
    puts "Please enter a #{thing} for the meal"
    gets.chomp
  end

end

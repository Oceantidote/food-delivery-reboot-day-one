# TODO: implement the router of your app.
class Router
  def initialize(meals_controller)
    @meals_controller = meals_controller
    @running = true
  end

  def run
    while @running
      display_menu
      choice = gets.chomp.to_i
      action(choice)
    end
    # write logic so that when we do router.run the program starts to ask
    # us what we want to do and routes us to the right action
  end

  private

  def display_menu
    puts "1. to list all meals"
    puts "2. to add a meal"
    puts "3. remove a meal"
    puts "4. to close app"
   # display menu options to user
  end

  def action(choice)
    case choice
      when 1
        @meals_controller.list
      when 2
        @meals_controller.add
      when 3
        @meals_controller.destroy
      when 4
        @running = false
    end
  end
end

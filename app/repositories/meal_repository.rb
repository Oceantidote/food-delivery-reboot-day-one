require_relative "../models/meal"
require 'csv'

class MealRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @csv_options = { headers: :first_row, header_converters: :symbol }
    @meals = []
    @next_id = 1
    load_csv
  end

  def all
    @meals
  end

  def add(meal)
    meal.id = @next_id
    @next_id += 1
    @meals << meal
    save_csv
  end

  def delete(id)
    @meals = @meals.reject { |meal| meal.id == id }
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, @csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
    end
    @meals.empty? ? @next_id = 1 : @next_id = @meals.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file_path, "wb", @csv_options) do |csv|
      csv << ["id","name","price"]
      @meals.each do |meal|
        csv << [meal.id,meal.name,meal.price]
      end
    end
  end
end

class AddMonthAndYearToBooks < ActiveRecord::Migration[5.2]
  def change
  	add_column :books, :month_assigned, :string
  	add_column :books, :year_assigned, :integer
  end
end

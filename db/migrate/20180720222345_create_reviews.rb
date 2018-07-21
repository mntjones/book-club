class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|

      t.text :comments
      t.integer :rating
      t.integer :user_id
      t.integer :book_id
      
    end
  end
end

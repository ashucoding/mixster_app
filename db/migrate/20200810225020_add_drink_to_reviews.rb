class AddDrinkToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :drink_id, :integer
  end
end

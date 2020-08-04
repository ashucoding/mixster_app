class CreateDrinks < ActiveRecord::Migration[6.0]
  def change
    create_table :drinks do |t|
      t.string :name
      t.text :ingredients
      t.string :taste
      t.string :bar_name
      t.text :bar_location
      t.string :bartender

      t.timestamps
    end
  end
end

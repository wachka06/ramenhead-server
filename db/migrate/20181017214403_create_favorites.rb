class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.boolean :saved
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end

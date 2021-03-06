class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :image_url
      t.float :rating
      t.string :price
      t.string :display_phone
      t.string :display_address
      t.string :longitude
      t.string :latitude
      t.string :api_id

      t.timestamps
    end
  end
end

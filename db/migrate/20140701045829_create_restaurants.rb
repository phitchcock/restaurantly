class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :street
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :phone
      t.text :description
      t.belongs_to :category

      t.timestamps
    end
  end
end

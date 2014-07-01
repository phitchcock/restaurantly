class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :body
      t.belongs_to :restaurant
      t.belongs_to :user

      t.timestamps
    end
  end
end

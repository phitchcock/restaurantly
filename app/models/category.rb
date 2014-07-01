class Category < ActiveRecord::Base
  has_many :restaurants
  validates :title, presence: true
end
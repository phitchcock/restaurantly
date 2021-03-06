class Category < ActiveRecord::Base
  extend FriendlyId

  has_many :restaurants, dependent: :destroy
  validates :title, presence: true

  friendly_id :title, use: :history

  mount_uploader :category_image, CategoryImageUploader
end
class Restaurant < ActiveRecord::Base
  extend FriendlyId
  
  belongs_to :category
  has_many :reviews, dependent: :destroy

  validates :name, presence: true

  friendly_id :name, use: :history
end
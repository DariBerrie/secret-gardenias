class Garden < ApplicationRecord
  has_many :plants, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true
  validates :image_url, presence: true
end

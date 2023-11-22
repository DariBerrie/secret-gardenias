class Plant < ApplicationRecord
  belongs_to :garden

  validates :name, :image_url, presence: true, uniqueness: true
end

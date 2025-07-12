class Goal < ApplicationRecord
  has_rich_text :description
  has_one_attached :featured_image
  validates :name, presence: true
  validates :status, presence: true
end

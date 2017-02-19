class Recipe < ApplicationRecord

  validates :title, :body, presence: true

  has_many :labelings
  has_many :labels, through: :labelings
end

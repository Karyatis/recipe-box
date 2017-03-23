class Label < ApplicationRecord
  has_many :labelings
  has_many :recipes, through: :labelings

  def to_s
  	description
  end
end

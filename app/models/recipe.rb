class Recipe < ApplicationRecord

  validates :title, :body, presence: true

  has_many :labelings
  has_many :labels, through: :labelings

  def label_list
  	labels.join(", ")
  end

  def label_list=(labels_string)
  	label_desciptions = labels_string.split(",").collect{|s| s.strip.downcase}.uniq
  	new_or_found_labels = label_names.collect { |description| Label.find_or_create_by(description: description) }
  	self.labels = new_or_found_labels
  end
end

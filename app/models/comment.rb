class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :target, class_name: 'User'
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end

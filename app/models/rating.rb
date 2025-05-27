class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :score, inclusion: { in: 0..10 }

end

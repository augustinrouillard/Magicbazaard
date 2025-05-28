class Review < ApplicationRecord

  RATING = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  belongs_to :item
  belongs_to :user
end

class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :target, class_name: 'User', foreign_key: 'target_id'
  RATING = [0, 1, 2, 3, 4, 5]
end

class Review < ApplicationRecord
  belongs_to :object
  belongs_to :user
end

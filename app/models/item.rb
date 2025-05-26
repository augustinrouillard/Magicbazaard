class Item < ApplicationRecord
  belongs_to :user
  has_many :reviews, :reservations, dependent: :destroy
  has_many :reservations, dependent: :destroy

end

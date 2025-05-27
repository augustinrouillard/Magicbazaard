class Item < ApplicationRecord

  CATEGORY = %w(baguette chaudron amulette balais cape)
  POWER = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

  has_one_attached :image


  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :reservations, dependent: :destroy

end

class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :item
  scope :past, -> { where('ending_date < ?', Date.today) }
  scope :current, -> { where('starting_date <= ? AND ending_date >= ?', Date.today, Date.today) }
  scope :upcoming, -> { where('starting_date > ?', Date.today) }
end

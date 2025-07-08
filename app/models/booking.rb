class Booking < ApplicationRecord
  belongs_to :user # to the lesee
  belongs_to :van

  validates :start_date, :end_date, presence: true
end

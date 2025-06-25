class Booking < ApplicationRecord
  belongs_to :user # to the lesee
  belongs_to :van
end

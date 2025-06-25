class Van < ApplicationRecord
  belongs_to :user # to van owner
  has_many :bookings

  validates :title, :price, :model, :seats, :size, presence: true
end

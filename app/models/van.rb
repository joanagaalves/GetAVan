class Van < ApplicationRecord
  belongs_to :user # to van owner
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :title, :price, :model, :seats, :size, presence: true
end

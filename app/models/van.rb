class Van < ApplicationRecord
  belongs_to :user # to van owner
  validates :title, :price, :model, :seats, :size, presence: true
end

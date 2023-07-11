class Record < ApplicationRecord
  
  belongs_to :user
  belongs_to :song
  
  validates :score, presence: true , numericality: {in: 0..100.00}
  validates :share, length: { maximum: 100 }
  validates :memo, length: { maximum: 100 }
end

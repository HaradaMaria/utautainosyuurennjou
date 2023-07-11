class Song < ApplicationRecord
  
  has_many :records
  has_many :bookmarks
  
  validates :name, presence: true
  validates :artist, presence: true, length: { maximum: 50 }
  validates :songwriter, presence: true, length: { maximum: 50 }
  validates :composer, presence: true, length: { maximum: 50 }
end

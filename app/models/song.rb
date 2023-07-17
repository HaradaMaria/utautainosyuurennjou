class Song < ApplicationRecord
  
  has_many :records
  has_many :bookmarks
  
  validates :name, presence: true
  validates :artist, presence: true, length: { maximum: 50 }
  validates :songwriter, presence: true, length: { maximum: 50 }
  validates :composer, presence: true, length: { maximum: 50 }
  
  # 検索機能
  def self.looks(colmn,ward)
    if colmn == "曲名"
      @songs = Song.where("name LIKE?","%#{ward}%")
    elsif colmn == "アーティスト名"
      @songs = Song.where("artist LIKE?","%#{ward}%")
    elsif colmn == "作詞者名"
      @songs = Song.where("songwriter LIKE?","%#{ward}%")
    elsif colmn == "作曲者名"
      @songs = Song.where("composer LIKE?","%#{ward}%")
    end
  end
  # scope :bookmark
end

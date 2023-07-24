class Song < ApplicationRecord

  has_many :records
  has_many :bookmarks

  validates :name, presence: true
  validates :artist, presence: true, length: { maximum: 50 }
  validates :songwriter, presence: true, length: { maximum: 50 }
  validates :composer, presence: true, length: { maximum: 50 }
  validates :tie_up, length: { maximum: 50 }

  def bookmarking_by?(user)
    bookmarks.exists?(user_id: user.id)
  end

 # ブックマーク絞り込み用
  scope :bookmarked_by, -> (user_id){joins(:bookmarks).where(bookmarks: {user_id: user_id})}

  # 検索機能

  def self.looks(colmn,ward,user,bookmark)

    if colmn == "曲名"
      songs = Song.where("name LIKE?","%#{ward}%")
    elsif colmn == "アーティスト名"
      songs = Song.where("artist LIKE?","%#{ward}%")
    elsif colmn == "作詞者名"
      songs = Song.where("songwriter LIKE?","%#{ward}%")
    elsif colmn == "作曲者名"
      songs = Song.where("composer LIKE?","%#{ward}%")
    end
    if user != 'guest_user' && 'current_admin'
      songs = songs.bookmarked_by(user.id) if bookmark == "true"
    end
    return songs
  end
end

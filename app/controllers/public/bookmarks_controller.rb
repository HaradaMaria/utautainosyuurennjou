class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  before_action :ensure_guest_user, only: [:create,:destroy]

  def create
    @song = Song.find(params[:song_id])
    bookmark = current_user.bookmarks.new(song_id: @song.id)
    bookmark.save
  end
  
  def destroy
    @song = Song.find(params[:song_id])
    bookmark = current_user.bookmarks.find_by(song_id: @song.id)
    bookmark.destroy
  end
  
end

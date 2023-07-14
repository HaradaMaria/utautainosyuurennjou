class Admin::SongsController < ApplicationController
  def index
    @songs = Song.all 
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end
  
  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      flash[:notice] = "曲情報を更新しました"
      redirect_to admin_song_path(@song)
    else
      render :edit
    end
  end
  
  
  private
  
  def song_params
    params.require(:song).permit(:name,:artist,:songwriter,:composer,:tie_up)
  end
end

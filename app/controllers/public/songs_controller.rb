class Public::SongsController < ApplicationController
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_param)
  end

  def index
    @songs = Song.all 
  end

  def show
    @song = Song.find(params[:id])
  end
  
  private

  def song_params
    params.require(:song).permit(:name,:artist,:songwriter,:composer,:tie_up)
  end
end

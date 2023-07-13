class Public::SongsController < ApplicationController
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      flash[:notice] = "曲を登録しました"
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def index
    @songs = Song.all 
  end

  def show
    @song = Song.find(params[:id])
  end
  
  def search
    @colmn = params[:colmn]
    @ward = params[:ward]
    @songs = Song.looks(params[:search],params[:ward])
  end
  
  private

  def song_params
    params.require(:song).permit(:name,:artist,:songwriter,:composer,:tie_up)
  end
end

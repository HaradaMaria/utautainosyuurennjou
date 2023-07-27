class Admin::SongsController < ApplicationController
  before_action :authenticate_admin!

  def index
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
  
  def search
    @colmn = params[:colmn]
    @ward = params[:ward]
    @song_looks = Song.looks(params[:colmn],params[:ward],current_admin,params[:bookmark])
    @songs = @song_looks.order(name_kana: :ASC).page(params[:page])
  end
  
  private
  
  def song_params
    params.require(:song).permit(:name,:name_kana,:artist,:songwriter,:composer,:tie_up)
  end
end

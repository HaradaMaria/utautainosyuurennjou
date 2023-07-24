class Public::SongsController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  before_action :ensure_guest_user, only: [:new,:create]

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
  end

  def show
    @song = Song.find(params[:id])
    @user = current_user
    @all_records = @song.records.page(params[:all_records]).order(id: :DESC)
    @user_records = @song.records.where(user_id:@user).page(params[:user_records]).order(id: :DESC)
    @user_graph = @song.records.where(user_id:@user).order(id: :DESC).limit(25)
    @user_records_max = @user_records.maximum(:score)
    @user_records_average = @user_records.average(:score)
  end

  def search
    @colmn = params[:colmn]
    @ward = params[:ward]
    @bookmark = params[:bookmark]
    @song_looks = Song.looks(params[:colmn],params[:ward],current_user,params[:bookmark])
    @songs = @song_looks.order(name_kana: :ASC).page(params[:page])
  end


  private

  def song_params
    params.require(:song).permit(:name,:name_kana,:artist,:songwriter,:composer,:tie_up)
  end
end

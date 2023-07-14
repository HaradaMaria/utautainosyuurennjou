class Public::RecordsController < ApplicationController
  def new
    @song = Song.find(params[:song_id])
    @record = Record.new
  end

  def create
    @song = Song.find(params[:song_id])
    @record = Record.new(record_params)
    @record.user_id = current_user.id
    @record.song_id = @song.id
    if @record.save
      flash[:notice] = "記録しました"
      redirect_to song_record_path(@record)
    else
      render :new
    end
  end

  def show
    @record = Record.find(params[:id])
    @song = Song.find(params[:song_id])
  end
  
  private
  
  def record_params
  params.require(:record).permit(:user_id, :song_id, :score, :key, :share, :memo)
  end
end

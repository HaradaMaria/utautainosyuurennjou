class Admin::RecordsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @song = Song.all
    @all_records = Record.page(params[:all_records]).order(id: :DESC)
  end

  def show
    @record = Record.find(params[:id])
    @song = @record.song
  end

  def edit
    @record = Record.find(params[:id])
    @song = @record.song
  end
  
  def update
    @record = Record.find(params[:id])
    @song = @record.song
    if @record.update(record_params)
      flash[:notice] = "記録を編集しました"
      redirect_to admin_song_record_path(@song,@record)
    else
      render :edit
    end
  end
  
  def destroy
    record = Record.find(params[:id])
    record.destroy
    flash[:notice] = "記録を削除しました"
    redirect_to admin_records_path
  end
  
  private
  
  def record_params
    params.require(:record).permit( :user_id, :song_id, :score, :key, :share, :memo, :created_at)
  end
  
end

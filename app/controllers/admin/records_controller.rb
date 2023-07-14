class Admin::RecordsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end
  
  def update
    
  end
  
  private
  
  def record_params
    params.require(:record).permit( :user_id, :song_id, :score, :key, :share, :memo, :created_at)
  end
end

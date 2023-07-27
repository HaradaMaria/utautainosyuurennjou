class Public::UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:show, :edit, :update]
  before_action :ensure_guest_user, only: [:show,:edit,:update,:check,:withdraw]
  def show
    @user = current_user
    @user_records = @user.records.page(params[:user_records]).order(id: :DESC)
    @user_graph =  @user_records.where(user_id:@user).order(id: :DESC).limit(25)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "修練者情報を更新しました"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def check
    
  end

  def withdraw
    user = current_user
    user.is_training = false
    user.save
    session.clear
    redirect_to root_path
  end

  private


  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to new_user_session_path
    end
  end

  def user_params
    params.require(:user).permit( :name, :email, :is_training)
  end
end

class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.where.not(id: User.find_by(email: User::GUEST_USER_EMAIL).id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @song = Song.all
    @user_records = @user.records.page(params[:user_records]).order(id: :DESC)
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "修練者情報を更新しました"
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit( :name, :email, :is_training)
  end
  
end

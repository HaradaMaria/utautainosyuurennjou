class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  before_action :is_matching_login_user, only: [:show, :edit, :update]
  def show
    @user = current_user
    @records = @user.records
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "会員情報を更新しました"
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

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to new_user_sessions_path
    end
  end

  def user_params
    params.require(:user).permit( :name, :email, :is_training)
  end
end

class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  before_action :is_matching_login_user, only: [:show, :edit, :update, :check]
  def show
    @user = current_user
  end

  def edit
  end

  def update

  end

  def check
  end

  def withdraw

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
      redirect_to post_images_path
    end
  end
end

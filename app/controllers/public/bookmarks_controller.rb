class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  before_action :ensure_guest_user, only: [:create,:destroy]

  def create
    
  end
  
  def destroy
    
  end
  
end

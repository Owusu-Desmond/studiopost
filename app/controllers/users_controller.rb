class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def show
    @user = User.find_by(username: params[:username])
    @posts = Post.where(user_id: @user.id).order(created_at: :desc)
    @latest_posts = Post.all.order(created_at: :desc).limit(5)
  end

  def index
    @users = User.all
    redirect_to root_path
  end

  def new
    @user = User.new
  end
end

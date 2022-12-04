class LikesController < ApplicationController
  before_action :set_user, only: %i[create destroy]
  before_action :set_post, only: %i[create destroy]

  def create
    @like = Like.new
    @like.user = current_user
    @like.post = @post
    redirect_to user_post_path(@user, @post) if @like.save
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    @post.likes_counter -= 1
    @post.save
    redirect_to user_post_path(@user, @post)
  end

  def new
    @like = Like.new
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end

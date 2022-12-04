class LikesController < ApplicationController
    before_action :set_user, only: [:create]
    before_action :set_post, only: [:create]
  
    def create
      @like = Like.new
      @like.user = current_user
      @like.post = @post
      if @like.save
        redirect_to user_post_path(@user, @post)
      end
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
  
class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :destroy]
  before_action :set_user, only: [:new, :create]

  def index
    @posts = Post.all.order(created_at: :desc)
    @popular_posts = Post.all.order(likes_counter: :desc).limit(5)
    @latest_posts = Post.all.order(created_at: :desc).limit(5)
  end

  def create 
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to user_post_path(@user, @post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @comment = Comment.new
    @like = Like.new
  end

  def new
    @post = Post.new
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end


  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

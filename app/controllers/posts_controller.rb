class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_post, only: %i[show destroy]
  before_action :set_user, only: %i[new create edit update]

  def index
    @posts = Post.all.order(created_at: :desc)
    @popular_posts = Post.all.order(likes_counter: :desc).limit(5)
    @latest_posts = Post.all.order(created_at: :desc).limit(10)
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @user.posts_counter += 1
    @user.save

    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to user_post_path(@user, @post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @comment = Comment.new
    @like = Like.new
  end

  def new
    @post = Post.new
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to user_post_path(@user, @post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @username = @post.user.username
    if @post.destroy
      flash[:notice] = 'Post was successfully deleted.'
      redirect_to user_path(@username)
    else
      flash[:alert] = 'Something went wrong'
      redirect_to user_posts_path(@user)
    end
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

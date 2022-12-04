class CommentsController < ApplicationController
    before_action :set_user, only: %i[create destroy show index]
    before_action :set_post, only: %i[create destroy show index]
  
    def create
      @comment = Comment.new(comment_params)
      @comment.user = current_user
      @comment.post = @post
      respond_to do |format|
        if @comment.save
          format.html { redirect_to user_post_path(@user, @post), notice: 'Comment was successfully created.' }
        end
      end
    end
  
    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      @post.comments_counter -= 1
      @post.save
      redirect_to user_post_path(@comment.post.user, @comment.post)
    end
  
    def new
      @comment = Comment.new
    end
  
    private
  
    def set_user
      @user = User.find(params[:user_id])
    end
  
    def set_post
      @post = Post.find(params[:post_id])
    end
  
    def comment_params
      params.require(:comment).permit(:text)
    end
  end
  
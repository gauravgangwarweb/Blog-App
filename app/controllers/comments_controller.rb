class CommentsController < ApplicationController
  load_and_authorize_resource
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.author = @user
    @comment.save
    redirect_to user_post_path(@user, @post)
  end

  def destroy
    @comment = Comment.includes(:author, :post).find(params[:id])
    user = @comment.author_id
    post = @comment.post_id


    if @comment.destroy
      flash[:success] = 'Comment was successfully deleted.'
    else
      flash[:error] = 'Error: Comment could not be deleted'
    end
    redirect_to user_post_path(user, post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

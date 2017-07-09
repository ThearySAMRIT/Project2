class CommentsController < ApplicationController

  def create
    @post = Post.find_by id: params[:post_id]
    @comment = @post.comments.build content: params[:comment][:content],
      user: current_user

    if @comment.save
      redirect_to @post
    end
  end

  def destroy
    @post = Post.find_by id: params[:post_id]
    @comment = @post.comments.find_by id: params[:id]
    @comment.destroy
    redirect_to @post
  end

  private

  def comment_params
    params.require(:comment).permit :content
  end
 end

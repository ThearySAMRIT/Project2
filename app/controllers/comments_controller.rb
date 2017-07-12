class CommentsController < ApplicationController

  def create
    if @post = Post.find_by(id: params[:post_id])

      @comment = @post.comments.build content: params[:comment][:content],
        user: current_user
      if @comment.save
        redirect_to @post
      end
    else
      flash[:danger]
      redirect_to @post
    end
  end

  def destroy
    if @post = Post.find_by(id: params[:post_id])

      @comment = @post.comments.find_by id: params[:id]
      @comment.destroy
      redirect_to @post
    else
      flash[:danger]
      redirect_to post
    end
  end

  private

  def comment_params
    params.require(:comment).permit :content
  end
end

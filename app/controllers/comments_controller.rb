class CommentsController < ApplicationController

  def create
    if @post = Post.find_by(id: params[:post_id])
      @comment = @post.comments.build content: params[:comment][:content],
        user: current_user

      if @comment.save
        flash[:success]
        redirect_to @post
      else
        flash[:danger]
        redirect_to @post
      end
    else
      flash[:danger]
      render file: "public/404.html"
    end
  end

  def destroy
    if @post = Post.find_by(id: params[:post_id])
      @comment = @post.comments.find_by id: params[:id]
      if @comment.destroy
        flash[:success]
        redirect_to @post
      else
        flash[:danger]
        redirect_to @post
      end
    else
      flash[:danger]
      render file: "public/404.html"
    end
  end

  private

  def comment_params
    params.require(:comment).permit :content
  end
 end

class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :edit]
  before_action :correct_user, only: :destroy
  before_action :verify_admin!, only: :destroy

  def create
    @post = current_user.posts.build post_params

    if @post.save
      flash[:success] = "Post has been created!"
      redirect_to root_url
    else
      @feed_items = []
      render "static_pages/home"
    end
  end

  def edit
    @post = Post.find_by id: params[:id]
  end

  def update
    @post = Post.find_by id: params[:id]

    if @post.update_attributes post_params
      flash[:success] = t ".updated"
      redirect_to root_url
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = t ".delete"
    redirect_to request.referrer || root_url
  end

  private

  def post_params
    params.require(:post).permit :content, :title, :picture
  end

  def correct_user
    @post = current_user.posts.find_by id: params[:id]
    redirect_to root_url unless @post
  end

  def verify_admin!
    redirect_to root_url unless current_user.admin?
  end
end

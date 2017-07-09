class UsersController < ApplicationController

  before_action :logged_in_user, except: :show
  before_action :correct_user, only: [:edit, :update]
  before_action :verify_admin!, only: :destroy

  def index
    @users = User.paginate page: params[:page], per_page:
      Settings.per_page.maximum
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save && verify_recaptcha(model: @user)
      log_in @user
      flash[:success] = t ".welcom"
      redirect_to @user
    else
      flash[:danger] = t ".wrong"
      render :new
    end
  end

  def show
    @user = User.find_by id: params[:id]
    @posts = @user.posts.paginate page: params[:page], per_page:
      Settings.per_page.maximum
    unless @user
      flash.now[:infor] = t ".info"
      render file: "public/404.html"
    end
  end

  def edit
    @user = User.find_by id: params[:id]
  end

  def update
    @user = User.find_by id: params[:id]
    if @user.update_attributes user_params
      flash[:success] = t ".updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if User.find_by(id: params[:id]).destroy
      flash[:success] = t ".destroied"
      redirect_to users_url
    else
      flash[:danger] = t ".dangers"
      redirect_to users_url
    end
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate page: params[:page]
    render :show_follow
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate page: params[:page]
    render :show_follow
  end

  private

  def user_params
    params.require(:user).permit :full_name, :email, :gender, :password, :content
  end

  def logged_in_user
    return if logged_in?
    flash[:danger] = "Please log in"
    redirect_to login_url
  end


  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to root_url unless current_user? @user
  end

  def verify_admin!
    redirect_to root_url unless current_user.admin?
  end
end

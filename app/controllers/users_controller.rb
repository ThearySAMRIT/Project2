class UsersController < ApplicationController
before_action :logged_in_user, only: [:edit, :update, :destroy]
before_action :correct_user, only: [:edit, :update]
before_action :admin_user, only: :destroy

  def index
    @users = User.paginate page: params[:page], per_page: Setting.per_page.maximum
  end

  def show
    @user = User.find_by id: params[:id]

    if @user.nil?
      flash.now[:infor] = t ".info"
      render file: "public/404.html"
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save && verify_recaptcha(model: @user)
      flash[:success] = t ".welcom"
      redirect_to @user
    else
      flash[:danger] = t ".wrong"
      render :new
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
    User.find_by id: params[:id].destroy
    flash[:success] = t ".deleted"
  end

  private

  def user_params
    params.require(:user).permit :full_name, :email, :gender, :password, :content
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end

  def admin_user
    redirect_to root_url unless correct_user.admin?
  end


end

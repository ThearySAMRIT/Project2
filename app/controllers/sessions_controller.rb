class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:session][:email].downcase

    if user
      log_in user
      redirect_to user
    else
      flash.now[:danger]  = t ".invalid"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def check_captcha
    return if verify_recaptcha
      self.resource = resource_class.new sign_up_params
      respond_with_navigational(resource) {render :new}
  end
end

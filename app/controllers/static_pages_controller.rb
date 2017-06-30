class StaticPagesController < ApplicationController
  def home
    return unless logged_in?
      @post = current_user.posts.build
      @user = current_user
      @feed_items = current_user.feed.paginate page: params[:page], per_page: Settings.per_page.maximum
  end
end

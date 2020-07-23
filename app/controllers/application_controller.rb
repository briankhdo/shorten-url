class ApplicationController < ActionController::Base
  before_action :load_urls

  def load_urls
    @urls = current_user.urls.order(id: :desc).limit(20)
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      user = User.create
      session[:user_id] = user.id
      user
    end
  end
end

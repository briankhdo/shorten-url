class HomeController < ApplicationController
  def index
    @url = Url.new
  end

  def redirect
    key = params[:key]
    if params[:key].present?
      url = Url.find_by_key(key)
      url.increment!(:clicks_count)
      redirect_to url.source
    else
      redirect_to root_path
    end
  end
end

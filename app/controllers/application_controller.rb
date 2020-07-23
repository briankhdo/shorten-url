class ApplicationController < ActionController::Base
  before_action :load_urls

  def load_urls
    @urls = Url.order(id: :desc).limit(20)
  end
end

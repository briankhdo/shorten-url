class UrlsController < ApplicationController
  # GET /urls/new
  def new
    @url = Url.new
  end

  # POST /urls
  def create
    @url = Url.new(url_params)

    if @url.save
      redirect_to root_url, notice: 'Url was successfully created.'
    else
      render 'home/index'
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def url_params
      params.require(:url).permit(:source, :key, :clicks_count)
    end
end

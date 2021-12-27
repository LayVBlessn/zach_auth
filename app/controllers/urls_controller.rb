class UrlsController < ApplicationController
  before_action :require_authentication

  def input
    @url = Url.new
  end

  def create
    if params[:url].nil?
      redirect_to '/urls'
    else
      url = params[:url].to_s
      url = url[9..(url.length - 3)]
      key = longURLToShortURL(url)
      @url = Url.create(long_url: url, key: key, user_id: current_user.id)
      @url.save
      redirect_to '/urls'
    end
  end

  private

  def longURLToShortURL(url)   
    chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    short_url = ""
    rnd = Random.new
    id = url.to_s.length + rnd.rand(10000..100000)
    while (id > 0) do
      short_url += chars[id % 62]
      id /= 62
    end
    short_url
  end
end


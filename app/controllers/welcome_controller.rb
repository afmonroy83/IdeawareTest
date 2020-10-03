class WelcomeController < ApplicationController
  def index
    @auth_url = authorization
    if params.has_key?(:code)
      cookies[:code]  = params[:code]
      redirect_to home_path
    end
    @random_images = Unsplash::Photo.search("cats").shuffle.first(12)
  end

  def authorization
    requested_scopes = ["public", "read_user", "write_likes", "read_collections"]
    auth_url = Unsplash::Client.connection.authorization_url(requested_scopes)
    return  auth_url
  end
end

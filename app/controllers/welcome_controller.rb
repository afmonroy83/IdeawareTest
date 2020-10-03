class WelcomeController < ApplicationController
  def index
    @auth_url = authorization
    @ut= params[:code]
  end

  def authorization
    requested_scopes = ["public", "read_user", "write_likes", "read_collections"]
    auth_url = Unsplash::Client.connection.authorization_url(requested_scopes)
    return  auth_url
  end
end

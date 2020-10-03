class WelcomeController < ApplicationController
  def index
  end

  def authorization
    requested_scopes = ["public", "read_user", "write_likes", "read_collections"]
    auth_url = Unsplash::Client.connection.authorization_url(requested_scopes)
  end
end

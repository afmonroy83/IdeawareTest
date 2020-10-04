class WelcomeController < ApplicationController
  def index
    @auth_url = authorization
    if params.has_key?(:code)
      oauth = Unsplash::Client.connection.authorize!(params[:code])
      cookies[:TOKEN_SESSION]  = oauth.token
      user_info
      redirect_to home_path
    end
    words = ['Edificios','cats','art']
    @random_images = Unsplash::Photo.search(words.sample).shuffle.first(12)
  end

  def authorization
    requested_scopes = ["public", "read_user", "write_likes", "read_collections"]
    auth_url = Unsplash::Client.connection.authorization_url(requested_scopes)
    return  auth_url
  end

  def user_info
    url = URI.parse('https://api.unsplash.com/me')
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    req = Net::HTTP::Get.new(url.to_s, {'Authorization' => "Bearer #{cookies[:TOKEN_SESSION]}"})
    res = http.request(req)
    body =JSON.load(res.body)
    cookies[:username]  = body["username"]
  end
end

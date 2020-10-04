class ImagesController < ApplicationController
  def show
    @photo = Unsplash::Photo.find(params[:id])
    @token = cookies[:TOKEN_SESSION]
    @token.to_s
    @image_id = params[:id]
  end

  def listLikes
    url = URI.parse("https://api.unsplash.com/users/#{cookies[:username]}/likes")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    req = Net::HTTP::Get.new(url.to_s, {'Authorization' => "Bearer #{cookies[:TOKEN_SESSION]}"})
    res = http.request(req)
    @images =JSON.load(res.body)
  end


end

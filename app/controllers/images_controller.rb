class ImagesController < ApplicationController
  def show
    @photo = Unsplash::Photo.find(params[:id])
  end

  def listLikes
  end
end

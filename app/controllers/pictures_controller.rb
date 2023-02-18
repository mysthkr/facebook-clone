class PicturesController < ApplicationController
  
  def new
    @picture = Picture.new
  end
  
  def index
    @pictures = Picture.all
  end
end

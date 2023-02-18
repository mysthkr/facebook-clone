class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  
  def index
    @pictures = Picture.all
  end
  
  def new
    @picture = Picture.new
  end
  
  def create
    @picture = Picture.new(post_params)
    if params[:back]
      render :new
    else
      if @picture.save
        redirect_to pictures_path, notice: "投稿しました！"
      else
        render :new
      end
    end
  end
  
  def show
    @picture = Picture.find(params[:id])
  end
  
  private
  
    def set_picture
      @picture = Picture.find(params[:id])
    end

  def post_params
    params.require(:picuture).permit(:image, :image_cache, :comment)
  end
end

class PicturesController < ApplicationController
  
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
  
  private

  def post_params
    params.require(:post).permit(:content)
  end
end

class ImagesController < ApplicationController

  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def index
    @colFotos = Image.all
  end

  def new
    @Foto = Image.new
  end

  def create
    #render plain: params[:image].inspect
    @Foto = Image.new image_params
    if @Foto.save
      return redirect_to images_path
    end
    render :new

  end

  def edit

  end

  def update
    @Foto.update image_params
    redirect_to @Foto
  end

  def destroy
    @Foto.destroy
    redirect_to images_path
  end

  def show

  end

  private

  def set_image
    @Foto = Image.find params[:id]
  end

  def image_params
    params.require(:image).permit :description, :picture
  end


end

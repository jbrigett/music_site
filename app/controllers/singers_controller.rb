# Singer
class SingersController < ApplicationController
  before_action :session?, only: %i[new create]
  def session?
    redirect_to new_user_session_path unless user_signed_in?
  end

  def index
    @singers = Singer.all
  end

  def new
    @singer = Singer.new
  end

  def create
    @singer = Singer.new(singer_params)
    if @singer.save
      flash[:success] = t(:'Singer added!')
      redirect_to singers_path
    else
      redirect_to singers_path,
                  notice: t(:'Singer did not added!')
    end
  end

  def edit
    @singer = Singer.find(params[:id])
  end

  def update
    @singer = Singer.find(params[:id])
    if @album.update_attributes(singer_params)
      flash[:success] = 'singer updated!'
      redirect_to singers_path
    else
      render :edit
    end
  end

  def show
    @singer = Singer.includes(:songs).find(params[:id])
  end

  def singer_params
    params.require(:singer).permit(:name, :description, :image, :remove_image)
  end
end

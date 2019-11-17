# songs
class SongsController < ApplicationController
    before_action :session?, only: [:new, :create]

  def session?
    redirect_to new_user_session_path unless user_signed_in?
  end

  def index
    @songs = Song.all
  end

  def new
    @singer = Singer.find(params[:singer_id])
    @song = @singer.songs.build
  end

  def create
    @singer = Singer.find(params[:singer_id])
    @song = @singer.songs.build(song_params)
    if @song.save
      redirect_to singer_path(@singer),
                  notice: t(:'Добаввлено!')
    else
      render :new
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :track)
  end
end

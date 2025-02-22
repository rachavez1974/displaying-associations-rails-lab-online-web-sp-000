class SongsController < ApplicationController
  before_filter :set_song, only: [:show, :update, :edit, :destroy]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title)
  end

  def set_song
    @song = Song.find(params[:id])
  end
end


class SongsController < ApplicationController
  def show
    # renders show.html.haml
  end

  def index
    render text: cell(:song).()
  end

  def new
    render text: cell(:song).url_for(Song.new)
  end

  def edit
    render text: cell(:song).video_path(1)
  end

  def with
    method = params[:song][:method]
    args   = params[:song][:args]

    render text: cell("songs_controller/asset").send(method, args)
  end

  def with_escaped
    render layout: false
  end

  require "cell/helper/asset_helper"
  class AssetCell < Cell::ViewModel
  end
end

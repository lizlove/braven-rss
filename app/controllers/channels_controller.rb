class ChannelsController < ApplicationController
  def index
    @channels = Channel.all
  end

  def show 
    @channel = Channel.find(params[:id])
  end

  def new
    @channel = Channel.new
  end

  def create
    @channel = Channel.new(channel_params)

    if @channel.save
      redirect_to @channel
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @channel = Channel.find(params[:id])
  end

  def update
    @channel = Channel.find(params[:id])

    if @channel.update(Channel_params)
      redirect_to @channel
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private 
    def channel_params
      params.require(:channel).permit(:name, :url, :description, :image)
    end

end

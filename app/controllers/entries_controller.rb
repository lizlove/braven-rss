class EntriesController < ApplicationController
  def create
    @channel = Channel.find(params[:channel_id])
    @entry = @channel.entries.create(entry_params)
    redirect_to channel_path(@channel)
  end

  private 
    def entry_params
      params.require(:title).permit(:published, :content, :url, :author, :read)
    end
end



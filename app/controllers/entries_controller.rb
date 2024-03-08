class EntriesController < ApplicationController
  def create
    @channel = Channel.find(params[:channel_id])
    @entry = @channel.entries.create(entry_params)
    redirect_to channel_path(@channel)
  end

  def update
    title = params[:title]
    is_read = ActiveRecord::Type::Boolean.new.cast(params[:read])
    if Entry.update(params[:channel_id], title: params[:title], read: is_read)
      puts params, is_read, title
      puts 'updated'
      @channel = Channel.find(params[:id])
      redirect_to channel_path(@channel)
    else 
      puts 'not updated'
      render :edit, status: :unprocessable_entity
    end
  end

  private 
    def entry_params
      if params[:read].is_a?(String)
        params[:read] = params[:read] == "true"
      else
        params.require(:title).permit(:published, :content, :url, :author, :read, :channel_id)
      end
    end
end



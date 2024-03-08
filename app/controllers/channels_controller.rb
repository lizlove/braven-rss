class ChannelsController < ApplicationController
  after_action :ingest_entries, only: [:create, :update]

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
      ingest_entries
      redirect_to @channel
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @channel = Channel.find(params[:id])
    @channel.destroy
    # TODO: Remove the entries associated with the channel? 
    redirect_to root_path, status: :see_other
  end

  private 
    def channel_params
      params.require(:channel).permit(:name, :url, :description, :image)
    end

    def ingest_entries
      @entries = Scraper.scrape_entries(@channel)
      @entries.each do |entry|
        copy = entry[:summary] || entry[:content] || "No summary available."
        link = entry[:url] || entry[:enclosure_url]
        Entry.create(title: entry[:title], published: entry[:published], content: copy, url: link, author: entry[:author], read: false, channel_id: @channel.id)
      end
      puts "Entries ingested", @entries.count
    end

end

class EntriesController < ApplicationController
  def create 
    result = CreateEntry.new.call(entry_params)
    if result.success?
      redirect_to channel_path(result.channel)
    else
      redirect_to channel_path(result.channel), alert: result.error
    end
end

class RemoteEntries
  def call(url)
    feed = Feedjira::Feed.fetch_and_parse(url)
    # feed.entries.map do |entry|
    #   {
    #     title: entry.title,
    #     published: entry.published,
    #     content: entry.content,
    #     url: entry.url,
    # }
    end

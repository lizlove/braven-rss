require "httparty"

class Scraper
  def self.scrape_entries(channel)
    xml = HTTParty.get(channel.url).body
    feed = Feedjira.parse(xml)
    n = 0
    feed.entries.each do |entry, index|
      new_entry = channel.entries.where(title: entry.title).first_or_initialize
      new_entry.update(published: entry.published, content: entry.content, url: entry.url, author: entry.author, channel_id: channel.id)
      puts "Entry created: #{new_entry.title}"
      n += 1
    end
    puts "#{n} entries created"
  end
end
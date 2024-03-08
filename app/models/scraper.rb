class Scraper
  def self.scrape_entries(channel)
    xml = HTTParty.get(channel.url).body
    feed = Feedjira.parse(xml)
    new_entries = feed.entries.filter_map {|entry| channel.entries.exists?(:title => entry.title) ? nil : entry}
  end
end
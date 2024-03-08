namespace :sync do
  task channels: [:environment] do
    Channel.all.each do |channel|
      xml = HTTParty.get(channel.url).body
      p "Found XML - #{xml}"
      content = Feedjira::Feed.parse(xml)
      content.entries.each do |entry, index|
        break if index == 10
        local_entry = channel.entries.where(title: entry.title).first_or_initialize
        local_entry.update_attributes(content: entry.content, author: entry.author, url: entry.url, published: entry.published)
        p "Synced Entry - #{entry.title}"
      end
      p "Synced Channel - #{channel.name}"
    end
  end
end

# TODO: Remove this is garbage!
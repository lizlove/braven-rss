require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', './channels.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'utf-8')

csv.each do |row|
  t = Channel.new
  t.name = row['name']
  t.url = row['url']
  t.description = row['description']
  t.image = row['image']
  t.save
  puts "#{t.name}, #{t.url} saved"
end
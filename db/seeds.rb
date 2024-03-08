require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'channels.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'utf-8')
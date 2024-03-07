namespace :export do
  desc "Export channels to seeds.rb" 
  task :export_to_seeds => :environment do
    Channel.all.each do |channels| 
      excluded_keys = ["created_at", "updated_at", "id"] 
      serialized = country
        .serializable_hash
        .delete_if{|key,value| excluded_keys.include?(key)} 
      puts “Channel.create”
    end 
  end
end

# TODO: Improve seed data
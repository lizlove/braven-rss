class CreateEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :entries do |t|
      t.string :title
      t.datetime :published
      t.text :content
      t.string :url
      t.string :author
      t.integer :channel_id

      t.timestamps
    end
  end
end

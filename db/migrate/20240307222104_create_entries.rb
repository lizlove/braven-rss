class CreateEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :entries do |t|
      t.string :title
      t.datetime :published
      t.text :content
      t.string :url
      t.string :author
      t.boolean :read, default: false
      t.references :channel, null: false, foreign_key: true

      t.timestamps
    end
  end
end

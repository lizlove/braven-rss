class CreateChannels < ActiveRecord::Migration[7.1]
  def change
    create_table :channels do |t|
      t.string :name
      t.string :url
      t.text :description
      t.text :image

      t.timestamps
    end
  end
end

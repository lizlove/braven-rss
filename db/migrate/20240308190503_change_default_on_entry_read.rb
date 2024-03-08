class ChangeDefaultOnEntryRead < ActiveRecord::Migration[7.1]
  def change
    change_column_default(:entries, :read, nil)
  end
end

class ChangeOldTableNameToNewTableName < ActiveRecord::Migration[8.0]
  def change
    rename_table :tasks, :goals
  end
end

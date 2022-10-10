class RenameTypeListsToTypes < ActiveRecord::Migration[7.0]
  def change
    rename_table :type_lists, :types
  end
end

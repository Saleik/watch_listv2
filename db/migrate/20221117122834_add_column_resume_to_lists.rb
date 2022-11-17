class AddColumnResumeToLists < ActiveRecord::Migration[7.0]
  def change
    add_column :lists, :resume, :string, limit:150
  end
end

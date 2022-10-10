class CreateTypeLists < ActiveRecord::Migration[7.0]
  def change
    create_table(:type_lists) do |t|
      t.string(:type)

      t.timestamps
    end
  end
end

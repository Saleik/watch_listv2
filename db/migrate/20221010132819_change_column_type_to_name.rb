class ChangeColumnTypeToName < ActiveRecord::Migration[7.0]
  def change
    change_table(:types) do |t|
      t.rename(:type, :name)
    end
  end
end

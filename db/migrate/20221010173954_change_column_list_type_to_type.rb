class ChangeColumnListTypeToType < ActiveRecord::Migration[7.0]
  def change
    change_table(:movie_types) do |t|
      t.rename(:type_list_id, :type_id)
    end
  end
end

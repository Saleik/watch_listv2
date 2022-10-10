class CreateMovieTypes < ActiveRecord::Migration[7.0]
  def change
    create_table(:movie_types) do |t|
      t.references(:type_list, null: false, foreign_key: true)
      t.references(:movies, null: false, foreign_key: true)

      t.timestamps
    end
  end
end

class ChangeColumnNameMoviesInMovieTypes < ActiveRecord::Migration[7.0]
  def change
    rename_column :movie_types, :movies_id, :movie_id
  end
end

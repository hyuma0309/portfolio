class RenamePostPathToMovies < ActiveRecord::Migration[5.2]
  def change
    rename_column :movies, :post_path, :poster_path
  end
end

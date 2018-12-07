class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :post_path
      t.text :overview
      t.date :release_date

      t.timestamps
    end
  end
end

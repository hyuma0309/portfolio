class AddTitleToTitles < ActiveRecord::Migration[5.2]
  def change
    add_column :titles, :title, :string
  end
end

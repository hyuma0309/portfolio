class CreateVodInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :vod_infos do |t|
      t.string :title
      t.belongs_to :movie, foreign_key: true

      t.timestamps
    end
  end
end

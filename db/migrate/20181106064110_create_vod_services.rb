class CreateVodServices < ActiveRecord::Migration[5.2]
  def change
    create_table :vod_services do |t|
      t.string :name
      t.belongs_to :vod_info, foreign_key: true

      t.timestamps
    end
  end
end

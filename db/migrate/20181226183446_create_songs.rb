class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.belongs_to :singer, foreign_key: true
      t.string :title
      t.string :track_uid

      t.timestamps
    end
  end
end

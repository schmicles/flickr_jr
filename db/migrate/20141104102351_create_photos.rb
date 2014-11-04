class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string   :file_name
      t.string   :caption
      t.integer  :album_id

      t.timestamps
    end
  end
end

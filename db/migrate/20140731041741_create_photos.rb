class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :small_thumb
      t.string :large_thumb
      t.timestamps
    end
  end
end

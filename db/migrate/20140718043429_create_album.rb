class CreateAlbum < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
    end
  end
end

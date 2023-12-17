class CreateVinyls < ActiveRecord::Migration[7.1]
  def change
    create_table :vinyls do |t|
      t.string :album_name
      t.string :artist_name

      t.timestamps
    end
  end
end

class AddAlbumArtUrlToVinyls < ActiveRecord::Migration[7.1]
  def change
    add_column :vinyls, :album_art_url, :string
  end
end

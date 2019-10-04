class AddFavoriteToArtworks < ActiveRecord::Migration[6.0]
  def change
    add_column :artworks, :favorite, :boolean, null: false, default: false
  end
end

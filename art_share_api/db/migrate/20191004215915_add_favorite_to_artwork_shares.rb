class AddFavoriteToArtworkShares < ActiveRecord::Migration[6.0]
  def change
    add_column :artwork_shares, :favorite, :boolean, null: false, default: false
  end
end

class CreateLikes < ActiveRecord::Migration[6.0]
  # What t.references :likeable, polymorphic: true does is 
  # t.integer :likeable_id
  # t.string :likeable_type
  # add_index :likes, [:likeable_type, :likeable_id]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.references :likeable, polymorphic: true
      t.timestamps
    end
    
    add_index :likes, [:user_id, :likeable_type, :likeable_id], unique: true
    add_index :likes, :user_id
  end
end

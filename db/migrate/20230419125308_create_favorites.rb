class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :user_id, null: false, foreign_key: true
      t.references :post_id, null: false, foreign_key: true
      
      t.index [:user_id, :post_id], unique: true
      t.timestamps
    end
  end
end

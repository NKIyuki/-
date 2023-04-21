class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id,null:false
      t.integer :comment_id,null:false
      t.text :content,null:false
      t.text :title,null:false
      t.string :image,null:false
      
      t.timestamps
    end
  end
end
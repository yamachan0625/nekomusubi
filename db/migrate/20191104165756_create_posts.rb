class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string     :title, null: false
      t.string     :address, index: true, null:false
      t.string     :image
      t.string     :content, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

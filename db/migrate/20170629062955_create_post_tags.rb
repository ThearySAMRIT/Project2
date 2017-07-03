class CreatePostTags < ActiveRecord::Migration[5.1]
  def change
    create_table :post_tags do |t|
      t.references :post_id, null: false, foreign_key: true
      t.references :tag_id, null: false, foreign_key: true

      t.timestamps
    end
    add_index :post_tags, :post_id
    add_index :post_tags, :tag_id
    add_index :post_tags, [:post_id, :tag_id], unique: true
  end
end

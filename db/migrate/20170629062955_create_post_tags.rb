class CreatePostTags < ActiveRecord::Migration[5.1]
  def change
    create_table :post_tags do |t|
      t.references :post, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
    add_index :post_tags, :post
    add_index :post_tags, :tag
    add_index :post_tags, [:post, :tag], unique: true
  end
end

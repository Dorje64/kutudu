class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :user, index: true
      t.references :post, index: true


      t.string :image_file_name
      t.string :image_content_type
      t.string :image_file_size
      t.datetime :image_updated_at
      t.timestamps
    end
    add_foreign_key :images, :users
    add_foreign_key :images, :posts
  end
end

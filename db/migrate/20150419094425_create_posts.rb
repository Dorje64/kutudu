class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :no
      t.string :course
      t.date :deadline

      t.timestamps null: false
    end
  end
end

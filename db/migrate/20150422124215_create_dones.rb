class CreateDones < ActiveRecord::Migration
  def change
    create_table :dones do |t|
      t.references :user, index: true
      t.references :post, index: true

      t.timestamps null: false
    end
    add_foreign_key :dones, :users
    add_foreign_key :dones, :posts
  end
end

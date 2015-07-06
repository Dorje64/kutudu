class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :groupname
      t.string :admin
      t.integer :member_count

      t.timestamps null: false
    end
  end
end

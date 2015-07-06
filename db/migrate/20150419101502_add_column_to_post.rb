class AddColumnToPost < ActiveRecord::Migration
  def change
    add_column :posts, :group_id, :integer
    add_column :posts, :username, :string
  end
end

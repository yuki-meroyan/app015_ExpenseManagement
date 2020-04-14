class AddColumnToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :master_user, :integer
  end
end

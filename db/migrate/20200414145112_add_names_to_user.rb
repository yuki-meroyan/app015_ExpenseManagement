class AddNamesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :family_name, :string
    add_column :users, :first_name, :string
    add_column :users, :nick_name, :string
  end
end

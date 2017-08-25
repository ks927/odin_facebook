class AddUserInfoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :birthday, :date
    add_column :users, :employer, :string
    add_column :users, :school, :string
    add_column :users, :residence, :string
  end
end

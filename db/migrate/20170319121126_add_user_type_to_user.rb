class AddUserTypeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_type, :integer, default: 0
  end
end
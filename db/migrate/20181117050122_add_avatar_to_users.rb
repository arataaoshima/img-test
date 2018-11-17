class AddAvatarToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :binary
  end
end

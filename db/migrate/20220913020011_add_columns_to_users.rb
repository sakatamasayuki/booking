class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_name, :string
    add_column :users, :user_intro, :string
    add_column :users, :user_pic, :string
  end
end

class AddUserIdToObras < ActiveRecord::Migration[5.2]
  def change
    add_column :obras, :user_id, :integer
  end
end

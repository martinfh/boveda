class RemoveStringFromObras < ActiveRecord::Migration[5.2]
  def change
    remove_column :obras, :string, :string
  end
end

class RemoveVendidoFromObras < ActiveRecord::Migration[5.2]
  def change
    remove_column :obras, :vendido, :boolean
  end
end

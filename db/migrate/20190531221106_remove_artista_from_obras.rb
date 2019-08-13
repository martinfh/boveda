class RemoveArtistaFromObras < ActiveRecord::Migration[5.2]
  def change
    remove_column :obras, :artista, :string
  end
end

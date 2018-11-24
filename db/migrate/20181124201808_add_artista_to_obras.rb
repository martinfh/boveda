class AddArtistaToObras < ActiveRecord::Migration[5.2]
  def change
    add_column :obras, :artista, :string
  end
end

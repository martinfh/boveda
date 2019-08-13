class AddAvatarToGalerista < ActiveRecord::Migration[5.2]
  def change
    add_column :galerista, :avatar, :binary
  end
end

class CreateObras < ActiveRecord::Migration[5.2]
  def change
    create_table :obras do |t|
      t.string :titulo
      t.text :tecnica
      t.string :medidas
      t.date :año
      t.integer :precio
      t.binary :imagen
      t.string :disponibilidad
      t.string :string

      t.timestamps
    end
  end
end

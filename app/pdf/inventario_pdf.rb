class InventarioPdf < Prawn::Document
	def initialize(obras)
		super()
		@obras = Obra.all
		usuario_boveda
		obra_id
	end
	def usuario_boveda
		text "INVENTARIO"
		
	end
	def obra_id 
	table obra_id_all do
		self.header = true
		row(0).font_style = :bold
		columns(1..6).align = :center
		self.row_colors = ["DDDDDD","FFFFFF"]
		border_width = 1
	end
	end
	def obra_id_all
[["título","Técnica", "Medidas", "Año", "Precio", "Disponibilidad"]] +
@obras.map do |obra|
	[obra.titulo,obra.tecnica,obra.medidas,obra.año,obra.precio,obra.disponibilidad]
		end
	end
end
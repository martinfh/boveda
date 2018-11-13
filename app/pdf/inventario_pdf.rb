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
		columns(0..2).align = :left
		columns(2..6).align = :right
	

		border_width = 0

	end
	end
	def obra_id_all
[["título","Técnica", "Medidas", "Año", "Precio", "Disponibilidad"]] +
@obras.map do |obra|
	[obra.titulo,obra.tecnica,obra.medidas,obra.año,obra.precio,obra.disponibilidad]
		end
	end
end
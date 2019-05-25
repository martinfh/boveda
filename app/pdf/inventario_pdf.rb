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
		columns(0..2).align = :center
		columns(2..6).align = :center
		columns(0..6).borders = :bottom, :top
		style columns(0..6), :font_size => 3

	end
	end
	def obra_id_all
[["artista","título","Técnica", "Medidas", "Año", "Precio", "Situación"]] +
@obras.map do |obra|
	[obra.artista,obra.titulo,obra.tecnica,obra.medidas,obra.año,obra.precio,obra.disponibilidad]
		end
	end

end
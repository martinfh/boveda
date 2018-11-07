class ObraPdf < Prawn::Document
	def initialize(obra)
		super()
		@obra = Obra.find (params[:id])
		obra_id_info
	end
	def obra_id_info
	[obra.titulo,obra.tecnica,obra.medidas,obra.año,]

	end
end


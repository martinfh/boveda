class ObrasController < ApplicationController
before_action :authenticate_user!
before_action :set_locale
 
def set_locale
  I18n.locale = params[:locale] || I18n.default_locale
end

	def index
		@obras = Obra.all 
	end
def new
end
def show
	@obra = Obra.find (params[:id])
	respond_to do |format|
		format.html
		format.pdf do render pdf: “inventario”,
 template: “obras_controller/show.html.erb”,
 layout: ‘pdf.html’
	end
	end
	end
	def edit
		@obra = Obra.find (params[:id])
	end
	def update
		@obra = Obra.find (params[:id])
		if @obra.update (obra_params)
			redirect_to @obras
		else
			render 'edit' 
		end
	end
def create
	#render plain: params[:obra].inspect
	@obra = current_user.obras.new(obra_params)
	@obra.save
	redirect_to obras_path
end
def destroy
	@obra = Obra.find (params[:id])
	@obra.destroy

	redirect_to obras_path
	end


private
def obra_params
	params.require(:obras).permit(:titulo, :tecnica, :medidas, :año, :precio, :imagenes, :disponibilidad)
end
end


class GaleriasController < ApplicationController

before_action :authenticate_user!

 
  def index
  @obras = Obra.all 
		respond_to do |format|
			format.html
			format.pdf do 
				pdf = InventarioPdf.new(@obra)
				send_data pdf.render, filename:"Inventario.pdf",
									type:"application/pdf",
									disposition:"inline"

			end
	end
end
def new
end
def show
	@obra = Obra.find (params[:id])
	 end
def edit
		@obra = Obra.find (params[:id])
	end
def update
		@obra = Obra.find (params[:id])
		if @obra.update (obra_params)
			redirect_to galerias_index_path
		else
			render 'edit' 
		end
	end
def create
	#render plain: params[:obra].inspect
	@obra = current_user.obras.new(obra_params)
	@obra.save
	redirect_to galerias_index_path
end
def destroy
	@obra = Obra.find (params[:id])
	@obra.destroy

	redirect_to galerias_index_path
	end


private
def obra_params
	params.require(:obras).permit(:artista, :titulo, :tecnica, :medidas, :año, :precio, :imagen, :vendido,:disponibilidad)
end
end

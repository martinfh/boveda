class ObrasController < ApplicationController
before_action :authenticate_user!
before_action :set_locale
helper_method :sort_direction

def set_locale
  I18n.locale = params[:locale] || I18n.default_locale
end

	def index
		if params[:sort] == 'name'
      @obras = Obra.all.order("form_name #{sort_direction}")
    elsif params[:sort] == 'created_at'
      @obra = Obra.all.order("created_at #{sort_direction}")
    else
      @obra = Obra.all
    end
		if params[:search]
			@obras = Obra.search (params[:search])
		else
			@obras = Obra.all
		end 
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
		respond_to do |format|
   format.html
   format.pdf do
     render pdf: "Obra",
     template: "obras/show.html.erb"
 end
 end 
	 end
	def edit
		@obra = Obra.find (params[:id])
	end
	
	def search
		if params[:obra].blank?
			@obras = Obra.all
		else
			@obra = Obra.search(params)
		end
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
def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end
def obra_params
	params.require(:obras).permit(:titulo, :tecnica, :medidas, :año, :precio, :imagen, :disponibilidad, :artista, :vendido, :search)
end
end

class ObrasController < ApplicationController
before_action :authenticate_user!
before_action :set_locale
helper_method :sort_column

def set_locale
  I18n.locale = params[:locale] || I18n.default_locale
end

	def index
		if params[:search]
			@obras = current_user.obras.search (params[:search])
		else
			@obras = current_user.obras.all
		end 
		respond_to do |format|
			format.html
			format. json { render json: ObrasDatatable.new(params) }
			format.pdf do 
				render pdf: "inventario",
     				template: "obras/pdfinventario.html.erb"

			end
	end
end
def new
	@obras = current_user.obras.new
end
 
def show
	@obra = Obra.find (params[:id])
		respond_to do |format|
   format.html
   format.pdf do
     render pdf: "Obra",
     template: "obras/#{params[:pdf_type]}.html.erb"
 end
 end 
	 end
	def edit
		@obra = Obra.find (params[:id])
	end
	
	def search
		if params[:obra].blank?
			@obras = current_user.obras.all
		else
			@obra = current_user.obras.search(params)
		end
	end

	def update
		@obra = Obra.find (params[:id])
		respond_to do |format|
      if @obra.update(obra_params)
        format.html { redirect_to @obra, notice: 'Obra was successfully updated.' }
        format.json { render :show, status: :ok, location: @obra }
        else
        format.html { render :edit }
        format.json { render json: @obra.errors, status: :unprocessable_entity }
      end
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
	params.require(:obra).permit(:titulo, :tecnica, :medidas, :año, :precio, :imagen, :disponibilidad, :search)
end

  
end

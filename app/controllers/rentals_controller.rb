class RentalsController < ApplicationController

  protect_from_forgery unless: -> { request.format.json? }
  

def create
    @rental = Rental.new(rental_params)
    new_item_params = params[:item]
    @rental.decode_image_data(params[:va_image_data])
    respond_to do |format|
      if @rental.save
        format.html { redirect_to @rental, notice: 'Rental was successfully created.'}
        format.json { render json: @rental.errors, status: :created }
      else
        format.html {render action: 'new'}
	format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
end



  # DELETE /rentals/1
  def destroy
    Rental.find(params[:id]).destroy
    flash[:success] = "Rental deleted"

    redirect_to rentals_url, notice: 'Rental was successfully destroyed.'
  end



	def edit
		@rental = Rental.find(params[:id])	
	end



	def index
		@rentals = Rental.all
		respond_to do |format|
			format.html
			format.json {render json: @rentals }
		end
	end



	def new
		@rental = Rental.new
	end
	


	def show
		@rental = Rental.find(params[:id])
		respond_to do |format|
			format.html
			format.json {render json: @rental }
		end
	end



# PATCH/PUT /rentals/1
  def update
    @rental = Rental.find(params[:id])
    if @rental.update_attributes!(rental_params)
#      redirect_to @rental, notice: 'Rental was successfully updated.'
      render action: 'edit'
    else
      render action: 'edit'
    end
  end

	private

	# See https://rubyplus.com/articles/3281-Mass-Assignment-in-Rails-5
	def rental_params
	  params.require(:rental).permit(:rental_address,
                                     :manager_id,
                                     :rental_rent,
                                     :rental_image,
                                     :rental_tenant_id)
	end  
end

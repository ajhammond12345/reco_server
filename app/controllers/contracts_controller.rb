class ContractsController < ApplicationController

  protect_from_forgery unless: -> { request.format.json? }
  

def create
    @contract = Contract.new(contract_params)
    respond_to do |format|
      if @contract.save
        format.html { redirect_to @contract, notice: 'Contract was successfully created.'}
        format.json { render json: @contract.errors, status: :created }
      else
        format.html {render action: 'new'}
	format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
end



  # DELETE /contracts/1
  def destroy
    Contract.find(params[:id]).destroy
    flash[:success] = "Contract deleted"

    redirect_to contracts_url, notice: 'Contract was successfully destroyed.'
  end



	def edit
		@contract = Contract.find(params[:id])	
	end



	def index
		@contracts = Contract.all
		respond_to do |format|
			format.html
			format.json {render json: @contracts }
		end
	end



	def new
		@contract = Contract.new
	end
	


	def show
		@contract = Contract.find(params[:id])
		respond_to do |format|
			format.html
			format.json {render json: @contract }
		end
	end



# PATCH/PUT /contracts/1
  def update
    @contract = Contract.find(params[:id])
    if @contract.update_attributes!(contract_params)
#      redirect_to @contract, notice: 'Contract was successfully updated.'
      render action: 'edit'
    else
      render action: 'edit'
    end
  end

	private

	# See https://rubyplus.com/articles/3281-Mass-Assignment-in-Rails-5
	def contract_params
	  params.require(:contract).permit(:contract_signed,
			                          :contract_date_signed,
                                      :contract_date_ended,
                                      :contract_pdf_file_path,
                                      :contract_property_id,
                                      :user_id)
	end  
end

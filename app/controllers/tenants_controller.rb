class TenantsController < ApplicationController

  protect_from_forgery unless: -> { request.format.json? }
  

def create
    @tenant = Tenant.new(tenant_params)
    respond_to do |format|
      if @tenant.save
        format.html { redirect_to @tenant, notice: 'Tenant was successfully created.'}
        format.json { render json: @tenant.errors, status: :created }
      else
        format.html {render action: 'new'}
	format.json { render json: @tenant.errors, status: :unprocessable_entity }
      end
    end
end



  # DELETE /tenants/1
  def destroy
    Tenant.find(params[:id]).destroy
    flash[:success] = "Tenant deleted"

    redirect_to tenants_url, notice: 'Tenant was successfully destroyed.'
  end



	def edit
		@tenant = Tenant.find(params[:id])	
	end



	def index
		@tenants = Tenant.all
		respond_to do |format|
			format.html
			format.json {render json: @tenants }
		end
	end



	def new
		@tenant = Tenant.new
	end
	


	def show
		@tenant = Tenant.find(params[:id])
		respond_to do |format|
			format.html
			format.json {render json: @tenant }
		end
	end



# PATCH/PUT /tenants/1
  def update
    @tenant = Tenant.find(params[:id])
    if @tenant.update_attributes!(tenant_params)
#      redirect_to @tenant, notice: 'Tenant was successfully updated.'
      render action: 'edit'
    else
      render action: 'edit'
    end
  end

	private

	# See https://rubyplus.com/articles/3281-Mass-Assignment-in-Rails-5
	def tenant_params
	  params.require(:tenant).permit(:tenant_user_id,
			:tenant_rental_id)
	end  
end

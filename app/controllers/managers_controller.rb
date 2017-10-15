class ManagersController < ApplicationController

  protect_from_forgery unless: -> { request.format.json? }
  

def create
    @manager = Manager.new(manager_params)
    respond_to do |format|
      if @manager.save
        format.html { redirect_to @manager, notice: 'Manager was successfully created.'}
        format.json { render json: @manager.errors, status: :created }
      else
        format.html {render action: 'new'}
	format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
end



  # DELETE /managers/1
  def destroy
    Manager.find(params[:id]).destroy
    flash[:success] = "Manager deleted"

    redirect_to managers_url, notice: 'Manager was successfully destroyed.'
  end



	def edit
		@manager = Manager.find(params[:id])	
	end



	def index
		@managers = Manager.all
		respond_to do |format|
			format.html
			format.json {render json: @managers }
		end
	end



	def new
		@manager = Manager.new
	end
	


	def show
		@manager = Manager.find(params[:id])
		respond_to do |format|
			format.html
			format.json {render json: @manager }
		end
	end



# PATCH/PUT /managers/1
  def update
    @manager = Manager.find(params[:id])
    if @manager.update_attributes!(manager_params)
#      redirect_to @manager, notice: 'Manager was successfully updated.'
      render action: 'edit'
    else
      render action: 'edit'
    end
  end

	private

	# See https://rubyplus.com/articles/3281-Mass-Assignment-in-Rails-5
	def manager_params
	  params.require(:manager).permit(:manager_user_id,
                                      :manager_code)
	end  
end

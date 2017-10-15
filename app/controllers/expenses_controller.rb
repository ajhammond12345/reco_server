class ExpensesController < ApplicationController

  protect_from_forgery unless: -> { request.format.json? }
  

def create
    @expense = Expense.new(expense_params)
    respond_to do |format|
      if @expense.save
        format.html { redirect_to @expense, notice: 'Expense was successfully created.'}
        format.json { render json: @expense.errors, status: :created }
      else
        format.html {render action: 'new'}
	format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
end



  # DELETE /expenses/1
  def destroy
    Expense.find(params[:id]).destroy
    flash[:success] = "Expense deleted"

    redirect_to expenses_url, notice: 'Expense was successfully destroyed.'
  end



	def edit
		@expense = Expense.find(params[:id])	
	end



	def index
		@expenses = Expense.all
		respond_to do |format|
			format.html
			format.json {render json: @expenses }
		end
	end



	def new
		@expense = Expense.new
	end
	


	def show
		@expense = Expense.find(params[:id])
		respond_to do |format|
			format.html
			format.json {render json: @expense }
		end
	end



# PATCH/PUT /expenses/1
  def update
    @expense = Expense.find(params[:id])
    if @expense.update_attributes!(expense_params)
#      redirect_to @expense, notice: 'Expense was successfully updated.'
      render action: 'edit'
    else
      render action: 'edit'
    end
  end

	private

	# See https://rubyplus.com/articles/3281-Mass-Assignment-in-Rails-5
	def expense_params
	  params.require(:expense).permit(:expense_amount,
                                     :expense_reason,
                                     :user_id,
                                     :expense_property_id)
	end  
end

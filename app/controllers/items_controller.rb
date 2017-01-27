class ItemsController < ApplicationController

  protect_from_forgery unless: -> { request.format.json? }
  

def create
    @item = Item.new(item_params)
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.'}
        format.json { render json: @item.errors, status: :created }
      else
        format.html {render action: 'new'}
	format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
end

  # DELETE /items/1
  def destroy
    Item.find(params[:id]).destroy
    flash[:success] = "Item deleted"

    redirect_to items_url, notice: 'Item was successfully destroyed.'
  end

	def edit
		@item = Item.find(params[:id])	
	end

	def index
		@items = Item.includes(:comments)
		respond_to do |format|
			format.html
			format.json {render json: @items, include: :comments}
		end
		
	end

	def total

		respond_to do |format|
			format.html
			format.json {render json: amount_raised}
		end
	end 

	def new
		@item = Item.new
	end
	
	def show
		@item = Item.find(params[:id])
		respond_to do |format|
			format.html
			format.json {render json: @item, include: :comments }
		end
	end
#
#  # PATCH/PUT /items/1
  def update
    @item = Item.find(params[:id])
    if @item.update_attributes!(item_params)
#      redirect_to @item, notice: 'Item was successfully updated.'
      render action: 'edit'
    else
      render action: 'edit'
    end
  end
#

#	def nicolas
#	    1400.upto(1430) do |i|
#		if Item.exists?(i) then
#			@item = Item.find(i)
#			@item.destroy
#		end
#	end
#		@items = Item.all
#		render 'index'
#	end

	private

	# See https://rubyplus.com/articles/3281-Mass-Assignment-in-Rails-5
	def item_params
	  params.require(:item).permit(:item_name,
			:item_condition,
			:item_description,
			:item_price_in_cents,
			:item_purchase_state, 
			:item_image)
	end  
end

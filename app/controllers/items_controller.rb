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

	def filtered_list
		data_params = params[:data]
logger.debug("params=#{params}")
logger.debug("data_params=#{data_params.inspect}")
logger.debug("example string=#{data_params[:example_string]}")
logger.debug("condition min value=#{data_params[:condition_min]}")
logger.debug("condition max value=#{data_params[:condition_max]}")
logger.debug("price_min value=#{data_params[:price_min]}")
logger.debug("price_max value=#{data_params[:price_max]}")

		# convert to integer to avoid SQL injection issues
		condition_min = data_params[:condition_min].to_i
		condition_max = data_params[:condition_max].to_i
		price_min = data_params[:price_min].to_i
		price_max = data_params[:price_max].to_i
		condition_min ||= 0
		condition_max ||= 10000
		price_min ||= 0
		price_max ||= 1000000000

		@items = Item.includes(:comments).where('item_price_in_cents >= ? and item_price_in_cents <= ? and item_condition >= ? and item_condition <= ?', price_min, price_max, condition_min, condition_max)
	
#		@items = Item.includes(:comments)
		respond_to do |format|
			format.html
			format.json {render json: @items, include: :comments}
		end
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

class PicturesController < ApplicationController

  protect_from_forgery unless: -> { request.format.json? }
  

def create
    @picture = Picture.new(picture_params)
    new_item_params = params[:item]
    @picture.decode_image_data(params[:va_image_data])
    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture, notice: 'Picture was successfully created.'}
        format.json { render json: @picture.errors, status: :created }
      else
        format.html {render action: 'new'}
	format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
end



  # DELETE /pictures/1
  def destroy
    Picture.find(params[:id]).destroy
    flash[:success] = "Picture deleted"

    redirect_to pictures_url, notice: 'Picture was successfully destroyed.'
  end



	def edit
		@picture = Picture.find(params[:id])	
	end



	def index
		@pictures = Picture.all
		respond_to do |format|
			format.html
			format.json {render json: @pictures }
		end
	end



	def new
		@picture = Picture.new
	end
	


	def show
		@picture = Picture.find(params[:id])
		respond_to do |format|
			format.html
			format.json {render json: @picture }
		end
	end



# PATCH/PUT /pictures/1
  def update
    @picture = Picture.find(params[:id])
    if @picture.update_attributes!(picture_params)
#      redirect_to @picture, notice: 'Picture was successfully updated.'
      render action: 'edit'
    else
      render action: 'edit'
    end
  end

	private

	# See https://rubyplus.com/articles/3281-Mass-Assignment-in-Rails-5
	def picture_params
	  params.require(:picture).permit(:picture_is_before_photo,
			:picture_image)
	end  
end

class NotificationsController < ApplicationController

  protect_from_forgery unless: -> { request.format.json? }
  

def create
    @notification = Notification.new(notification_params)
    respond_to do |format|
      if @notification.save
        format.html { redirect_to @notification, notice: 'Notification was successfully created.'}
        format.json { render json: @notification.errors, status: :created }
      else
        format.html {render action: 'new'}
	format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
end



  # DELETE /notifications/1
  def destroy
    Notification.find(params[:id]).destroy
    flash[:success] = "Notification deleted"

    redirect_to notifications_url, notice: 'Notification was successfully destroyed.'
  end



	def edit
		@notification = Notification.find(params[:id])	
	end



	def index
		@notifications = Notification.all
		respond_to do |format|
			format.html
			format.json {render json: @notifications }
		end
	end



	def new
		@notification = Notification.new
	end
	


	def show
		@notification = Notification.find(params[:id])
		respond_to do |format|
			format.html
			format.json {render json: @notification }
		end
	end



# PATCH/PUT /notifications/1
  def update
    @notification = Notification.find(params[:id])
    if @notification.update_attributes!(notification_params)
#      redirect_to @notification, notice: 'Notification was successfully updated.'
      render action: 'edit'
    else
      render action: 'edit'
    end
  end

	private

	# See https://rubyplus.com/articles/3281-Mass-Assignment-in-Rails-5
	def notification_params
	  params.require(:notification).permit(:notification_title,
                                           :notification_text,
                                           :notification_resolved,
                                           :notification_is_problem_with_property)	
    end  
end

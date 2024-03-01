class DriversController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found

    before_action :authenticate_safety_manager!
    
    before_action :set_driver, only: [:show, :edit, :update, :destroy]
  
    def index
      @drivers = Driver.all
    end
    
    def show
    end
  
    def new
      @driver = Driver.new
    end
  
    def edit
    end

    def create
      @driver = Driver.new(driver_params)
      if @driver.save
        flash.notice = "The driver record was created successfully."
        redirect_to @driver
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def update
      if @driver.update(driver_params)
        flash.notice = "The driver record was updated successfully."
        redirect_to @driver
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      begin
        @driver.destroy
        flash.notice = "The driver record was successfully deleted."
      rescue ActiveRecord::InvalidForeignKey
        flash.alert = "That driver record could not be deleted, because the driver has vehicle records."
      end

      respond_to do |format|
        format.html { redirect_to drivers_url }
        format.json { head :no_content }
      end
    end
  
    private
  
    def set_driver
      @driver = Driver.find(params[:id])
    end
  
    def driver_params
      params.require(:driver).permit(:first_name, :last_name, :phone, :email, :driver_license_number, :medical_card, :medical_card_expiration, :driver_application_doc, :drug_test_date, :mvr_report_date, :clearinghouse_date, :vehicle_id)
    end

    def catch_not_found(e)
      Rails.logger.debug("We had noy found exception.")
      flash.alert = e.to_s
      redirect_to drivers_path
    end
  end
  

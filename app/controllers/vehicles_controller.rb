class VehiclesController < ApplicationController

  before_action :authenticate_safety_manager!
  
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  
    def index
      @vehicles = Vehicle.all
    end
  
    def show
    end
  
    def new
      @vehicle = Vehicle.new
    end
  
    def create
      @vehicle = Vehicle.new(vehicle_params)
      if @vehicle.save
        flash.notice = "Vehicle was successfully created."
        redirect_to @vehicle
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
    end
  
    def update
      if @vehicle.update(vehicle_params)
        flash.notice = "Vehicle was successfully updated."
        redirect_to @vehicle
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @vehicle.destroy
      respond_to do |format|
        format.html { redirect_to vehicles_url, notice: "Vehicle was successfully removed." }
        format.json { head :no_content }
      end
    end
  
    private
  
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    def vehicle_params
      params.require(:vehicle).permit(:unit_number, :plate_number, :vin_number, :registration_expiration, :insurance_expiration)
    end

    def catch_not_found(e)
      Rails.logger.debug("We had not found exception.")
      flash.alert = e.to_s
      redirect_to vehicles_path
    end
  end
  

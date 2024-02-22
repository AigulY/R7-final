require 'rails_helper'
RSpec.describe "Vehicles", type: :request do

  describe "GET /index" do
    it "renders the index view" do
      FactoryBot.create_list(:vehicle, 10)
      get vehicles_path
      expect(response).to render_template(:index)
    end
  end

  describe "GET /vehicles/[vehicle]" do
    it "vehicles the :show template" do
        vehicle = FactoryBot.create(:vehicle)
      get vehicle_path(id: vehicle.id)
      expect(response).to render_template(:show)
    end
    it "redirects to the index path if the vehicle id is invalid" do
      get vehicle_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to vehicles_path
    end
  end

  describe "GET /vehicles/new" do
    it "renders the :new template" do
      get new_vehicle_path
      expect(response).to render_template(:new)
    end
  end

  describe "GET /vehicles/[vehicle]/edit" do
    it "renders the :edit template" do
        vehicle = FactoryBot.create(:vehicle)
      get edit_vehicle_path(id: vehicle.id)
      expect(response).to render_template(:edit)
    end
    it "redirects to the index path if the vehicle id is invalid" do
      get edit_vehicle_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to vehicles_path
    end
  end

  describe "POST /vehicles with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
        driver = FactoryBot.create(:driver)
      vehicle_attributes = FactoryBot.attributes_for(:vehicle, driver_id: driver.id)
      expect { post vehicles_path, params: {vehicle: vehicle_attributes}
    }.to change(Vehicle, :count)
      expect(response).to redirect_to vehicle_path(id: Vehicle.last.id)
    end
  end

  describe "POST /vehicles with invalid data" do
    it "does not save a new entry or redirect" do
        vehicle_attributes = FactoryBot.attributes_for(:vehicle)
        vehicle_attributes.delete(:product_id)
      expect { post vehicles_path, params: {vehicle: vehicle_attributes}
    }.to_not change(Vehicle, :count)
      expect(response).to render_template(:new)
    end
  end

  describe "PUT /vehicles/[vehicle] with valid data" do
    it "updates an entry and redirects to the show path for the vehicle" do
        vehicle = FactoryBot.create(:vehicle)
      put vehicle_path(vehicle.id), params: {vehicle: {product_count: 50}}
      vehicle.reload
      expect(vehicle.product_count).to eq(50)
      expect(response).to redirect_to("/vehicles/#{vehicle.id}")
    end
  end

  describe "PUT /vehicles/[vehicle] with invalid data" do
    it "does not update the vehicle record or redirect" do
        vehicle = FactoryBot.create(:vehicle)
      put "/vehicles/#{vehicle.id}", params: {vehicle: {driver_id: 5001}}
      vehicle.reload
      expect(vehicle.driver_id).not_to eq(5001)
      expect(response).to render_template(:edit)
    end
  end

  describe "DELETE an vehicle" do
    it "deletes an vehicle" do
        vehicle = FactoryBot.create(:vehicle)
      expect { delete vehicle_path(vehicle.id)
    }.to change(Vehicle, :count)
      expect(response).to redirect_to vehicles_path
    end
  end

end

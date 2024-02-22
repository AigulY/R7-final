require 'rails_helper'
RSpec.describe "DriversControllers", type: :request do
  describe "get drivers_path" do
    it "renders the index view" do
      FactoryBot.create_list(:driver, 10)
      get drivers_path
      expect(response).to render_template(:index)
    end
  end
  describe "get driver_path" do
    it "renders the :show template" do
      driver = FactoryBot.create(:driver)
      get driver_path(id: driver.id)
      expect(response).to render_template(:show)
    end
    it "redirects to the index path if the driver id is invalid" do
      get driver_path(id: 1000) #an ID that doesn't exist
      expect(response).to redirect_to drivers_path
    end
  end
describe "get new_driver_path" do
    it "renders the :new template" do
      get new_driver_path
      expect(response).to render_template(:new)
    end
  end
  describe "get edit_driver_path" do
    it "renders the :edit template" do
      driver = FactoryBot.create(:driver)
      get edit_driver_path(id: driver.id)
      expect(response).to render_template(:edit)
    end
  end
  describe "post drivers_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      driver_attributes = FactoryBot.attributes_for(:driver)
      expect { post drivers_path, params: {driver: driver_attributes}
    }.to change(Driver, :count)
      expect(response).to redirect_to driver_path(id: Driver.last.id)
    end
  end
  describe "post drivers_path with invalid data" do
    it "does not save a new entry or redirect" do
      driver_attributes = FactoryBot.attributes_for(:driver)
      driver_attributes.delete(:first_name)
      expect { post drivers_path, params: {driver: driver_attributes}
    }.to_not change(Driver, :count)
      expect(response).to render_template(:new)
    end
  end
  describe "put driver_path with valid data" do
    it "updates an entry and redirects to the show path for the driver" do
      driver = FactoryBot.create(:driver)
      new_attributes = { first_name: "Updated Name" }
      put driver_path(id: driver.id), params: { driver: new_attributes }
      expect(response).to redirect_to driver_path(driver)
      driver.reload
      expect(driver.first_name).to eq("Updated Name")
    end
  end
  describe "put driver_path with invalid data" do
    it "does not update the driver record or redirect" do
      driver = FactoryBot.create(:driver)
      new_attributes = { first_name: nil }
      put driver_path(id: driver.id), params: { driver: new_attributes }
      expect(response).to_not redirect_to driver_path(driver)
      expect(response).to render_template(:edit)
      driver.reload
      expect(driver.first_name).to_not eq(nil)
    end
  end
  describe "delete a driver record" do
    it "deletes a driver record" do
      driver = FactoryBot.create(:driver)
      expect { delete driver_path(driver) }.to change(Driver, :count).by(-1)
      expect(response).to redirect_to drivers_path
    end
  end
end
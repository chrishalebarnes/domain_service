require 'rails_helper'

RSpec.describe DomainsController, type: :controller do
  describe "get domains#index" do
  	it "should respond with http 200 success" do
  	  expect(response).to be_success
  	end
  end

  describe "post domains#create" do
  	it "should change domains count by 1" do
  	  expect {
        post :create, domain: FactoryGirl.attributes_for(:domain)   
  	  }.to change(Domain, :count).by(1)
  	  expect(response).to have_http_status(:created)
    end

    it "should reject domains without a hostname" do
      post :create, domain: FactoryGirl.attributes_for(:domain, hostname: nil)
      expect(response).to have_http_status(:unprocessable_entity)      
    end
  end

  describe "get domains#show" do
  	it "should get a single domain" do
  	  domain = FactoryGirl.create(:domain)
  	  get :show, id: domain.id
  	  expect(assigns(:domain)).to eq(domain)
  	  expect(response).to be_success
  	end
  end

  describe "put domains#update" do
  	it "should update an existing domain hostname" do
  	  domain = FactoryGirl.create(:domain)
  	  domain.hostname = "new hostname!"
      patch :update, id: domain.id, domain: domain.attributes
      expect(assigns(:domain).hostname).to eql domain.hostname
      expect(response).to be_success
  	end
  end

  describe "delete domains#destroy" do
  	it "should destroy an existing domain" do
  	  domain = FactoryGirl.create(:domain)
  	  expect {
        delete :destroy, id: domain.id
  	  }.to change(Domain, :count).by(-1)
  	  expect(response).to be_success
  	end
  end
end
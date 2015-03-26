require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  describe "get accounts#index" do
  	it "should respond with http 200 success" do
  	  expect(response).to be_success
  	end

    # TODO: this doesn't work because the generated list from create_list does not have the Domain children
    # The response does have the Domain children, so they don't match
  	#it "should return json array of accounts" do
    #  accounts = FactoryGirl.create_list(:accounts_with_domains, 3)
      
    #  get :index

    #  expect({ accounts: accounts }).to eq(JSON.parse(response.body))
  	#end
  end

  describe "post accounts#create" do
  	it "should change account count by 1" do
  	  expect {
        post :create, account: FactoryGirl.attributes_for(:account)   
  	  }.to change(Account, :count).by(1)
  	  expect(response).to have_http_status(:created)
    end

    it "should reject new accounts without a name" do
      post :create, account: FactoryGirl.attributes_for(:account, name: nil)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "get accounts#show" do
  	it "should get a single account" do
  	  account = FactoryGirl.create(:account)
  	  get :show, id: account.id
  	  expect(assigns(:account)).to eq(account)
  	  expect(response).to be_success
  	end
  end

  describe "put accounts#update" do
  	it "should update an existing account name" do
  	  account = FactoryGirl.create(:account)
  	  account.name ="New Name!"
      patch :update, id: account.id, account: account.attributes
      expect(assigns(:account).name).to eql account.name
      expect(response).to be_success
  	end

    it "should reject updates to accounts without a name" do
      account = FactoryGirl.create(:account)
      account.name = nil
      patch :update, id: account.id, account: account.attributes
      expect(response).to have_http_status(:unprocessable_entity)      
    end    
  end

  describe "delete accounts#destroy" do
  	it "should destroy an existing account" do
  	  account = FactoryGirl.create(:account)
  	  expect {
        delete :destroy, id: account.id
  	  }.to change(Account, :count).by(-1)
  	  expect(response).to be_success
  	end
  end
end
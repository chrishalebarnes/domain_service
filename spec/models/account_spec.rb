RSpec.describe Account, type: :model do
  describe "account validations" do
  	it "should not be valid without name" do
  	  account = FactoryGirl.build(:account, name: nil)
  	  expect(account).to_not be_valid
  	end

  	it "should be valid with all attributes" do
  	  account = FactoryGirl.build(:account)
  	  expect(account).to be_valid
    end  	
  end  
end
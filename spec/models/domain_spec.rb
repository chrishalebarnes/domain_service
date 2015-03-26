RSpec.describe Domain, type: :model do
  describe "domain validations" do
  	it "should not be valid without hostname" do
  	  domain = FactoryGirl.build(:domain, hostname: nil)
  	  expect(domain).to_not be_valid
  	end

  	it "should be valid with all attributes" do
  	  domain = FactoryGirl.build(:domain)
  	  expect(domain).to be_valid
    end
  end  
end
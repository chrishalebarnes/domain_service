require 'rails_helper'

RSpec.describe SaveIpAddressJob, type: :job do
  describe "ip address service" do
  	it "should resolve a hostname into an IP address async" do
  	  domain = FactoryGirl.create(:domain, hostname: "localhost")
  	  scope = self  #Not sure why this works, using expect inside the block gets an undefined method exception
  	  SaveIpAddressJob.after_perform do |job|
  	  	#localhost should resolve to 127.0.0.1, but there should be a better way to test this
  	  	scope.expect(domain.reload.ip_address).to scope.eq("127.0.0.1")
  	  end
  	  domain.queue_ip_lookup_job
  	end
  end
end

class SaveIpAddressJob < ActiveJob::Base
  queue_as :default

  def perform(domain)
  	#refresh the domain model from the database
  	domain.reload
    domain.ip_address = domain.lookup  #use dig to resolve the hostname into an IP
    domain.is_host_name_resolved = true
    domain.save  #finally save it
  end
end
class Domain < ActiveRecord::Base
  validates :hostname, presence: true,  uniqueness: true
  belongs_to :account

  after_commit :queue_ip_lookup_job, unless: :is_host_name_resolved

  def queue_ip_lookup_job
    SaveIpAddressJob.perform_later(self)
  end

  def lookup
    ip = `dig +short #{self.hostname}` #TODO: extract into a class to wrap up dig
    logger.debug "Resolved #{self.hostname} to #{ip}"  #check for this in log/test.log
    ip.strip #remove \n from the shell out      
  end
end
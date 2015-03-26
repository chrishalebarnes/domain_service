class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :hostname
      t.string :ip_address
      t.boolean :is_host_name_resolved, :default => false
      t.belongs_to :account, index:true
    end
  end
end

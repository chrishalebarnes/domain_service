FactoryGirl.define do
  sequence(:name) { |n| "Some Account Name #{n}" }

  factory :account do
    name
    # Factory for accounts with 3 associations to Domain objects
    factory :accounts_with_domains do
      after(:create) do |account|
        account.domains = create_list(:domain, 3, account: account)
      end      
    end
  end
end
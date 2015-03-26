Rails.application.routes.draw do
  scope :api do
    resources :accounts, except: [:new, :edit]
    resources :domains,  except: [:new, :edit]
  end
end

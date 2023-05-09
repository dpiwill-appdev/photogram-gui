Rails.application.routes.draw do
  root "users#index"

  resources :users, param: :username do
    resources :photos, only: [:create]
  end

  resources :photos, except: [:create] do
    resources :comments, only: [:create]
  end

  delete "/delete_photo/:id", { :controller => "photos", :action => "destroy" }
end

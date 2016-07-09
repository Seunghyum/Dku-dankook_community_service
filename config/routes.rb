Rails.application.routes.draw do
  scope module: :test_lecture_registers do
    get "home" => "test_lectures#home", as:"test_home"
    resources :test_lectures
    resources :test_users do
      collection do
        get "sign_in" => "test_users#sign_in", as: "sign_in"
      end
    end
    resources :rehearsal_users do
      collection do
        get "sign_in" => "rehearsal_users#sign_in", as: "sign_in"
      end
      resources :rehearsal_lectures
    end
  end
#강의평가
  resources :lecture_infos do
    resources :lecture_estimates do
      member do
        get "like" => "lecture_estimates#upvote"
        get "dislike" => "lecture_estimates#downvote"
      end
    end
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
#달력
  resources :meetings
#사물함
  get 'locker/index'

  get 'locker/manage'

  get 'locker/nottime'

  get 'locker/reject'

  get 'locker/selecting'

# 전화번호부
  resources :school_phone_searchings

  get 'home/index'

  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords'}


  resources :boards do
    resources :posts do
      member do
        get "like" => "posts#upvote"
        get "dislike" => "posts#downvote"
      end
      # resources :comments, module: :posts, shallow: true
      resources :comments, module: :posts do
        member do
          get "like" => "comments#upvote"
          get "dislike" => "comments#downvote"
        end
      end
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

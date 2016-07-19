Rails.application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  #중고책
  resources :book_lists do
    resources :books, only: [:edit, :update, :destroy]
  end
  resources :books, only: [:new, :create]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # 수강신청 리허설
  scope module: :test_lecture_registers do
    get "home" => "test_lectures#home", as:"test_home"
    get "test_lectures/index" => "test_lectures#index", as: "test_lectures"
    get "test_users/sign_in" => "test_users#sign_in", as: "sign_in_test_users"
    # resources :rehearsal_users do
    #   collection do
    #     get "sign_in" => "rehearsal_users#sign_in", as: "sign_in"
    #   end
    #   resources :rehearsal_lectures
    # end
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

#달력
  resources :meetings

#사물함
post '/lockers/lockerselect' => 'lockers#lockerselect', as: "lockerselect_lockers"

post '/lockers/destroy' => 'lockers#destroy', as: "destroy_lockers"

post 'lockers/first_check' => "lockers#first_check", as: "first_check_lockers"

get 'lockers/home' => "lockers#home", as: "home_lockers"

get 'lockers/reject' => "lockers#reject", as: "reject_lockers"

get 'lockers/index' => "lockers#index", as: "index_lockers"

get 'lockers/manage' => "lockers#manage", as: "manage_lockers"

get 'lockers/selecting_page' => "lockers#selecting_page", as: "selecting_page_lockers"

get 'lockers/nottime' => "lockers#nottime", as: "nottime_lockers"

# 전화번호부
  resources :school_phone_searchings

  get 'home/index' => "home#index"

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

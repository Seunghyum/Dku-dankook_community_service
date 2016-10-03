Rails.application.routes.draw do
  post '/tinymce_assets' => 'tinymce_assets#create'
  
  resources :blogings do
    member do
      get "like" => "posts#upvote"
      get "dislike" => "posts#downvote"
    end
    # resources :comments, module: :posts, shallow: true
    resources :comments, module: :blogings do
      member do
        get "like" => "comments#upvote"
        get "dislike" => "comments#downvote"
      end
    end
  end
  #admin
  ActiveAdmin.routes(self)
  mount RedactorRails::Engine => '/redactor_rails'
  #중고책
  resources :book_lists do
    resources :books, only: [:edit, :update, :destroy] do
      member do
        get 'purchase' => "books#purchase", as: "purchase"
        get 'reject_purchase' => "books#reject_purchase", as: "reject_purchase"
      end
    end
  end
  resources :books, only: [:new, :create]

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

#중고책
post 'used_books/selecting/:id' => 'used_books#selecting', as: 'selecting_used_book'

delete 'used_books/destroy/:id' => 'used_books#destroy', as: 'destroy_used_book'

get 'used_books/index' => 'used_books#index', as: 'used_books'

get 'used_books/result' => 'used_books#result', as: 'result_used_books'

#사물함
post '/lockers/lockerselect' => 'lockers#lockerselect', as: "lockerselect_lockers"

post '/lockers/destroy' => 'lockers#destroy', as: "destroy_lockers"

post 'lockers/first_check' => "lockers#first_check", as: "first_check_lockers"

get 'lockers/home' => "lockers#home", as: "home_lockers"

get 'lockers/reject' => "lockers#reject", as: "reject_lockers"

get 'lockers/index' => "lockers#index", as: "index_lockers"

get 'lockers/result' => "lockers#result", as: "result_lockers"

get 'lockers/selecting_page' => "lockers#selecting_page", as: "selecting_page_lockers"

get 'lockers/nottime' => "lockers#nottime", as: "nottime_lockers"

# 전화번호부
  resources :school_phone_searchings

  get 'home/index' => "home#index"
  get 'home/certify' => "home#certify"

  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations',
                                    passwords: 'users/passwords', :omniauth_callbacks => "users/omniauth_callbacks"}

  devise_scope :user do
   get "/users/sign_in", to: "devise/sessions#new"
   unauthenticated :user do
     root to: 'home#index', as: :unauthenticated_root
   end
 end


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

  #교수 투표
  get 'pickme/show' => "pickme#show", as: "pickme"
  get 'pickme/index' => "pickme#index", as: "pickmes"
  get 'pickme/ranking' => "pickme#ranking", as: "pickme_rankings"
  get 'pickme/intro' => "pickme#intro", as: "pickme_intro"
  get "pickme/:id/like", to: "pickme#upvote", as: "like_pickmes"
  get "pickme/:id/dislike", to: "pickme#downvote", as: "dislike_pickmes"

  root 'home#index'
end

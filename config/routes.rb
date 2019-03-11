Rails.application.routes.draw do
  resources :images, only: [:destroy]
  resources :users, except: %i[update destroy], constraints: { id: /[0-9]+/} do
    get :hello_world
    collection do
      # remove this after implementing token auth
      post 'follow/:current_user_id/', action: :follow, constraints: { current_user_id: /[0-9]+/ }
    end
    resources :posts, only: %i[new index] do
      collection do
        get ':offset/', action: :index, constraints: { offset: /[0-9]+/ }
      end

      resources :follows, only: %i[new destroy]



    end
  end

  resources :posts, only: %i[update destroy], constraints: { post_id: /[0-9]+/ } do
    resources :comments, only: %i[new index]do
      collection do
        get ':offset/', action: :index, constraints: { offset: /[0-9]+/ }
      end
    end

    # likes controller
    resources :likes, only: %i[new destroy index] do
      collection do
        # get 'num_likes/', action: :get_post_likes
      end
    end




  end


  resources :comments, only: %i[update destroy]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  #Rails.application.routes.default_url_options[:"localhost:3000"]
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get 'users/:id', to: 'users#show', as: 'user'
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]

  get 'mood_boards/:moodboard_id/pins', to: 'pins#index', as: 'mood_board_pins'
  post 'mood_boards/:moodboard_id/pins', to: 'pins#create'
  get 'mood_boards/:moodboard_id/pins/new', to: 'pins#new', as: 'new_mood_board_pin'
  get '/mood_boards/:moodboard_id/pins/:id', to: 'pins#show', as: 'mood_board_pin'
  patch '/mood_boards/:moodboard_id/pins/:id', to: 'pins#update'
  delete '/mood_boards/:moodboard_id/pins/:id', to:'pins#destroy'
  put '/mood_boards/:moodboard_id/pins/:id', to: 'pins#update'
  get '/mood_boards/:moodboard_id/pins/:id/edit', to: 'pins#edit', as: 'edit_mood_board_pin'

  get 'pins/:id/grab', to: 'pins#grab', as: 'grab_pin'
  post 'pins/:id/repin', to: 'pins#repin', as: 'repin_pin'
  post 'pins/:id/editing', to: 'pins#editing', as: 'editing_pin'

  #get '/mood_boards/:moodboard_id/users/:id', to: 'users#show', as: 'mood_board_user'

  ####### SEE HERE #######
  # Per Prof. Fleming: If you add any routes, the to: portion MUST NOT USE a '_' symbol 
  ####### SEE HERE #######
  root to: redirect('/mood_boards')

  # Route to the main page.
  get 'mood_boards', to: 'moodboards#index', as: 'mood_boards'
  # # Route to the create page
  post 'mood_boards', to: 'moodboards#create'
  get 'mood_boards/new', to: 'moodboards#new', as: 'new_mood_board'
  # # Route to the show page.
  get 'mood_boards/:id', to: 'moodboards#show', as: 'mood_board'
  # # Route to the edit page.
  patch 'mood_boards/:id', to: 'moodboards#update'
  put 'mood_boards/:id', to: 'moodboards#update'
  # # Route to destroy a moodboard.
  delete 'mood_boards/:id', to: 'moodboards#destroy', as: 'destroy_mood_board'
  # Route to edit page.
  get 'mood_board/:id', to: 'moodboards#edit', as: 'edit_mood_board'
  # Route to get_inspired
  get 'mood_board/:id', to: 'moodboards#getinspired', as: 'getinspired'

  get 'mood_boards/:moodboard_id/comments', to: 'comments#index', as: 'mood_board_comments'
  post 'mood_boards/:moodboard_id/comments', to: 'comments#create'
  get 'mood_boards/:moodboard_id/comments/new', to: 'comments#new', as: 'new_mood_board_comment'
  delete 'mood_boards/:moodboard_id/comments/:id', to: 'comments#destroy', as:'mood_board_comment'

  post 'mood_boards/:moodboard_id/ratings/:id', to: 'moodboards#rate', as: 'mood_board_rating'

end

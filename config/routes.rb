Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'application#dashboard'
  get '/projects' => 'application#projects'
  get '/auth/spotify/callback', to: 'application#dashboard'
  get '/blogs', to: 'blogs#index'
  get '/blogs/blockchain', to: 'blogs#blockchain'
  get '/blogs/watson', to: 'blogs#watson'
  get '/blogs/tdd4l', to: 'blogs#tdd4l'

end

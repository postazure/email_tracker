Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trackers, param: :uuid
  get 'trackers/:uuid/mark' => 'trackers#mark'
end

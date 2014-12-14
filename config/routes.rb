Rails.application.routes.draw do
  resources :mappings

  resources :keywords

  get '/search' => 'memes#search'
  get '/searchresults' => 'memes#searchresults'

  post '/donewsearch' => 'memes#performsearch'
  post '/delete_keyword/:id' => 'keywords#destroy'
  post '/delete_meme/:id' => 'memes#destroy'
  post '/delete_mapping/:id' => 'mappings#destroy'

  resources :memes

end

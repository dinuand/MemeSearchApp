Rails.application.routes.draw do
  resources :keywords

  get '/search' => 'memes#search'
  get '/searchresults' => 'memes#searchresults'

  post '/donewsearch' => 'memes#performsearch'
  post '/delete_keyword/:id' => 'keywords#destroy'
  post '/delete_meme/:id' => 'memes#destroy'

  resources :memes

end

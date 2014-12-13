json.array!(@memes) do |meme|
  json.extract! meme, :id, :title, :keywords, :url, :rating
  json.url meme_url(meme, format: :json)
end

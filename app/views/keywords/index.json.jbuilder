json.array!(@keywords) do |keyword|
  json.extract! keyword, :id, :key=string
  json.url keyword_url(keyword, format: :json)
end

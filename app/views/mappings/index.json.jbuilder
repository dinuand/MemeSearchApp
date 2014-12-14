json.array!(@mappings) do |mapping|
  json.extract! mapping, :id, :meme_id, :keyword_id
  json.url mapping_url(mapping, format: :json)
end

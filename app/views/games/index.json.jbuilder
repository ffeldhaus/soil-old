json.array!(@games) do |game|
  json.extract! game, :title
  json.url game_url(game, format: :json)
end